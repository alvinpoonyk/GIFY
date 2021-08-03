import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:gify/constants/failure_types.dart';
import 'package:gify/constants/filters.dart';
import 'package:gify/errors/failure.dart';
import 'package:gify/models/item.dart';
import 'package:gify/models/user.dart';
import 'package:gify/repositories/items_repository.dart';
import 'package:gify/repositories/items_repository_impl.dart';
import 'package:gify/repositories/users_repository.dart';
import 'package:gify/repositories/users_repository_impl.dart';
import 'package:gify/widgets/getX_widgets/getX_error_snack_bar.dart';

class ExplorePageController extends GetxController {

  RxList<Item> itemsToDisplay = <Item>[].obs;
  RxString category =  kDefaultCategoryFilter.obs;
  RxString location = kDefaultLocationFilter.obs;

  @override
  void onInit() {
    getItems();
    super.onInit();
  }

  final ItemsRepository _itemsRepository = ItemsRepositoryImpl();
  final UsersRepository _usersRepository = UsersRepositoryImpl();

  Future<User> getItemOwner({required String id}) async {
    try {
      return await _usersRepository.getUserById(id: id);
    } catch(e) {
      print("ExplorePageController(getItemOwner): ${e.toString()}");
      _showErrorSnackBar(errorTitle: unknownException, errorMessage: unknownExceptionErrorMessage);
      throw e;
    }
  }

  /// Populates the items to display stream with a list of items fetched from items repository
  Future<void> getItems() async {
      /// Clears the current stream of list of items
      itemsToDisplay.clear();
      try {
        /// Gets items from the item repository
        Either<Failure,List<Item>> result = await _itemsRepository.getItems();
        result.fold(
                /// If failure, display the error based on its type and message
                (failure) => _showErrorSnackBar(errorTitle: failure.type, errorMessage: failure.toString()),
                (items) {
                  /// If success, clear the current stream and the list of fetched items to the current stream
              itemsToDisplay.clear();
              itemsToDisplay.addAll(items);
            });
      } catch(e) {
        /// Leave the current stream empty as it is
        print("ExplorePageController(getItems): ${e.toString()}");
        _showErrorSnackBar(errorTitle: unknownException, errorMessage: unknownExceptionErrorMessage);
      }

  }

  Future<void> getItemsByCategory({required String selectedCategory}) async {
    category = selectedCategory.obs;
    itemsToDisplay.clear();
    try {
      /// Check if selected category is default and current location filter is default
      if (category.string.compareTo(kDefaultCategoryFilter) == 0 && location.string.compareTo(kDefaultLocationFilter) == 0) {
        await getItems();
        return;
      }

      /// Check if selected category is default and there is existing location filter is applied
      if (category.string.compareTo(kDefaultCategoryFilter) == 0 && location.string.compareTo(kDefaultLocationFilter) != 0) {
        return;
      }

      /// Check if only category filter is applied by user
      if (location.string.compareTo(kDefaultLocationFilter) == 0) {
        /// Get all items that matches the selected category
        try {
          Either<Failure,List<Item>> result = await _itemsRepository.getItemsByCategory(category: category.string);
          result.fold(
            /// If failure, display the error based on its type and message
                  (failure) => _showErrorSnackBar(errorTitle: failure.type, errorMessage: failure.toString()),
                  (items) {
                /// If success, clear the current stream and the list of fetched items to the current stream
                itemsToDisplay.clear();
                itemsToDisplay.addAll(items);
              });
        } catch(e) {
          /// Leave the current stream empty as it is
          print("ExplorePageController(getItems): ${e.toString()}");
          _showErrorSnackBar(errorTitle: unknownException, errorMessage: unknownExceptionErrorMessage);
        }
      } else {
        /// Get items that matches the selected category and previously selected location
        Either<Failure,List<Item>> result = await _itemsRepository.getItemsByCategoryAndLocation(category: category.string, location: location.string);
        result.fold(
          /// If failure, display the error based on its type and message
                (failure) => _showErrorSnackBar(errorTitle: failure.type, errorMessage: failure.toString()),
                (items) {
              /// If success, clear the current stream and the list of fetched items to the current stream
              itemsToDisplay.clear();
              itemsToDisplay.addAll(items);
            });
        return;
      }
    } catch (e) {
      print("ExplorePageController(getItemsByCategory): ${e.toString()}");
      _showErrorSnackBar(errorTitle: unknownException, errorMessage: unknownExceptionErrorMessage);
    }
  }

  Future<void> getItemsByLocation({required String selectedLocation}) async {
    location = selectedLocation.obs;
    itemsToDisplay.clear();
    try {
      /// Check if selected category is default and current location filter is default
      if (category.string.compareTo(kDefaultCategoryFilter) == 0 && location.string.compareTo(kDefaultLocationFilter) == 0) {
        await getItems();
        return;
      }

      /// Check if selected location is default and there is existing category filter is applied
      if (location.string.compareTo(kDefaultLocationFilter) == 0 && category.string.compareTo(kDefaultCategoryFilter) != 0) {
        Either<Failure,List<Item>> result = await _itemsRepository.getItemsByCategory(category: category.string);
        result.fold(
          /// If failure, display the error based on its type and message
                (failure) => _showErrorSnackBar(errorTitle: failure.type, errorMessage: failure.toString()),
                (items) {
              /// If success, clear the current stream and the list of fetched items to the current stream
              itemsToDisplay.clear();
              itemsToDisplay.addAll(items);
            });
        return;
      }

      /// Check if only location filter is applied by user
      if (category.string.compareTo(kDefaultCategoryFilter) == 0) {
        /// Get all items that matches the selected location
        Either<Failure,List<Item>> result = await _itemsRepository.getItemsByLocation(location: location.string);
        result.fold(
          /// If failure, display the error based on its type and message
                (failure) => _showErrorSnackBar(errorTitle: failure.type, errorMessage: failure.toString()),
                (items) {
              /// If success, clear the current stream and the list of fetched items to the current stream
              itemsToDisplay.clear();
              itemsToDisplay.addAll(items);
            });
        return;
      } else {
        /// Get items that matches the selected location and previously selected category
        Either<Failure,List<Item>> result = await  _itemsRepository.getItemsByCategoryAndLocation(category: category.string, location: location.string);
        result.fold(
          /// If failure, display the error based on its type and message
                (failure) => _showErrorSnackBar(errorTitle: failure.type, errorMessage: failure.toString()),
                (items) {
              /// If success, clear the current stream and the list of fetched items to the current stream
              itemsToDisplay.clear();
              itemsToDisplay.addAll(items);
            });
        return;
      }
    } catch (e) {
      /// Leave the current stream empty as it is
      print("ExplorePageController(getItemsByLocation): ${e.toString()}");
      _showErrorSnackBar(errorTitle: unknownException, errorMessage: unknownExceptionErrorMessage);
    }
  }

  /// Helper method to display error snack bar
  void _showErrorSnackBar({required String errorTitle, required String errorMessage}) {
      getXErrorSnackBar(title: errorTitle, message: errorMessage);
  }

}