import 'package:get/get.dart';
import 'package:gify/constants/filters.dart';
import 'package:gify/repositories/items_repository.dart';
import 'package:gify/repositories/items_repository_impl.dart';

class ExplorePageController extends GetxController {

  var itemsToDisplay = [].obs;
  var category =  kDefaultCategoryFilter.obs;
  var location = kDefaultLocationFilter.obs;

  @override
  void onInit() {
    getItems();
    super.onInit();
  }

  final ItemsRepository _itemsRepository = ItemsRepositoryImpl();

  getItems() async {
    itemsToDisplay.clear();
    /// Get all items without any filters
    await _itemsRepository.getItems().then((items) => items.forEach((item) => itemsToDisplay.add(item)));
  }

  Future<void> getItemsByCategory({required String selectedCategory}) async {
    category = selectedCategory.obs;
    itemsToDisplay.clear();

    /// Check if selected category is default and current location filter is default
    if (category.string.compareTo(kDefaultCategoryFilter) == 0 && location.string.compareTo(kDefaultLocationFilter) == 0) {
      await getItems();
      return;
    }

    /// Check if selected category is default and there is existing location filter is applied
    if (category.string.compareTo(kDefaultCategoryFilter) == 0 && location.string.compareTo(kDefaultLocationFilter) != 0) {
      await _itemsRepository.getItemsByLocation(location: location.string).then((items) => items.forEach((item) => itemsToDisplay.add(item)));
      return;
    }

    /// Check if only category filter is applied by user
    if (location.string.compareTo(kDefaultLocationFilter) == 0) {
      /// Get all items that matches the selected category
      await _itemsRepository.getItemsByCategory(category: category.string).then((items) => items.forEach((item) => itemsToDisplay.add(item)));
    } else {
      /// Get items that matches the selected category and previously selected location
      await _itemsRepository.getItemsByCategoryAndLocation(category: category.string, location: location.string).then((items)
      => items.forEach((item) => itemsToDisplay.add(item)));
    }
  }

  Future<void> getItemsByLocation({required String selectedLocation}) async {
    location = selectedLocation.obs;
    itemsToDisplay.clear();

    /// Check if selected category is default and current location filter is default
    if (category.string.compareTo(kDefaultCategoryFilter) == 0 && location.string.compareTo(kDefaultLocationFilter) == 0) {
      await getItems();
      return;
    }

    /// Check if selected location is default and there is existing category filter is applied
    if (location.string.compareTo(kDefaultLocationFilter) == 0 && category.string.compareTo(kDefaultCategoryFilter) != 0) {
      await _itemsRepository.getItemsByCategory(category: category.string).then((items) => items.forEach((item) => itemsToDisplay.add(item)));
      return;
    }

    /// Check if only location filter is applied by user
    if (category.string.compareTo(kDefaultCategoryFilter) == 0) {
      /// Get all items that matches the selected location
      await _itemsRepository.getItemsByLocation(location: location.string).then((items) => items.forEach((item) => itemsToDisplay.add(item)));
    } else {
      /// Get items that matches the selected location and previously selected category
      await _itemsRepository.getItemsByCategoryAndLocation(category: category.string, location: location.string).then((items)
      => items.forEach((item) => itemsToDisplay.add(item)));
    }
  }

}