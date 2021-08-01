import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:gify/constants/filters.dart';
import 'package:gify/models/image_file.dart';
import 'package:gify/repositories/items_repository.dart';
import 'package:gify/repositories/items_repository_impl.dart';
import 'package:gify/services/get_selected_image_bytes.dart';
import 'package:gify/widgets/center_circular_progress_indicator.dart';
import 'package:gify/widgets/getX_widgets/getX_error_snack_bar.dart';

class AddItemPageController extends GetxController {

  Rx<ImageFile> image1 = ImageFile(null, null).obs;
  Rx<ImageFile> image2 = ImageFile(null, null).obs;

  final ItemsRepository _itemsRepository = ItemsRepositoryImpl();

  final List<String> locationOptions = [... kLocations];
  final List<String> categoryOptions = [... kCategories];

  RxString selectedLocation = 'Select Location'.obs;
  RxString selectedCategory = 'Select Category'.obs;

  final TextEditingController nameTextController = TextEditingController();
  final TextEditingController locationTextController = TextEditingController();
  final TextEditingController categoryTextController = TextEditingController();
  final TextEditingController availabilityTextController = TextEditingController();
  final TextEditingController descriptionTextController = TextEditingController();


  final errorTitle = 'Oops, something went wrong...';

  void setSelectedLocation({required String value}) {
    selectedLocation.value = value;
  }

  void setSelectedCategory({required String value}) {
    selectedCategory.value = value;
  }

  void onInit() {
    locationOptions.removeAt(0);
    categoryOptions.removeAt(0);
    super.onInit();
  }

  void onClose() {
    nameTextController.dispose();
    locationTextController.dispose();
    categoryTextController.dispose();
    availabilityTextController.dispose();
    descriptionTextController.dispose();
    super.onClose();
  }

  void setImage1() async {
    try {
      ImageFile imageFile1 = await getSelectedImageFile();
      image1.value = imageFile1;
      image1.refresh();
    } catch(e) {
      _showErrorSnackBar(errorTitle: errorTitle, errorMessage: e.toString());
    }
  }

  void setImage2() async {
    try {
      ImageFile imageFile2 = await getSelectedImageFile();
      image2.value = imageFile2;
      image2.refresh();
    } catch(e) {
      _showErrorSnackBar(errorTitle: errorTitle, errorMessage: e.toString());
    }
  }

  Future<void> storeItemInRemoteDatabase({
    required String name, required String ownerID, required String location, required String category,
    required String description, required String availability}) async {

      if (image1.value.bytes == null || image1.value.file == null || image2.value.bytes == null || image2.value.bytes == null)
        return await Get.defaultDialog(title: 'Error', middleText: 'Please ensure you have attached 2 images');

      Map<String, dynamic> itemData = {
        "name" : name,
        "ownerID" : ownerID,
        "location" : location,
        "category" : category,
        "description" : description,
        "availability" : availability,
        "isRemoved" : false,
      };

      try {
        await Get.showOverlay(
          asyncFunction: () => _itemsRepository.createItem(itemData: itemData, imageFile1: image1.value, imageFile2: image2.value),
          loadingWidget: centerCircularProgressIndicator(),
        );
        Map<String, String> params = {"id" : ownerID};
        Get.offAndToNamed("/profile/", parameters: params);
      } catch(e) {
        _showErrorSnackBar(errorTitle: errorTitle, errorMessage: e.toString());
      }
  }

  /// Helper method to display error snack bar
  void _showErrorSnackBar({required String errorTitle, required String errorMessage}) {
    getXErrorSnackBar(title: errorTitle, message: errorMessage);
  }

}