import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gify/constants/filters.dart';
import 'package:gify/models/image_file.dart';
import 'package:gify/models/item.dart';
import 'package:gify/repositories/items_repository.dart';
import 'package:gify/repositories/items_repository_impl.dart';
import 'package:gify/services/get_selected_image_bytes.dart';
import 'package:gify/widgets/center_circular_progress_indicator.dart';
import 'package:gify/widgets/getX_widgets/getX_error_snack_bar.dart';

class EditItemPageController extends GetxController {
  final Item item;

  /// Control booleans to indicate if image 1 or 2 was changed
  RxBool isImage1Changed = false.obs;
  RxBool isImage2Changed = false.obs;

  /// Initialise stream Strings variables
  RxString category = ''.obs;
  RxString location = ''.obs;

  final List<String> locationOptions = [... kLocations];
  final List<String> categoryOptions = [... kCategories];

  /// Initialise ImageFile objects to store item images
  Rx<ImageFile> image1 = ImageFile(null, null).obs;
  Rx<ImageFile> image2 = ImageFile(null, null).obs;

  final ItemsRepository _itemsRepository = ItemsRepositoryImpl();
  final TextEditingController itemNameController = TextEditingController();
  final TextEditingController availabilityController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  final errorTitle = 'Oops, something went wrong...';

  EditItemPageController({required this.item});

  void onInit() {
    /// Assign variables with item data upon initialisation
    locationOptions.removeAt(0);
    categoryOptions.removeAt(0);
    category = item.category.obs;
    location = item.location.obs;
    itemNameController.text = item.name;
    availabilityController.text = item.availability;
    descriptionController.text = item.description;
    super.onInit();
  }

  /// Disposal of controllers to avoid memeory leakage
  void onClose() {
    itemNameController.dispose();
    availabilityController.dispose();
    descriptionController.dispose();
    super.onClose();
  }

  /// Setter for setting category
  void setCategory({required String value}) {
    category.value = value;
  }

  /// Setter for setting location
  void setLocation({required String value}) {
    location.value = value;
  }

  /// Setter for setting image 1
  void setImage1() async {
    try {
      ImageFile imageFile1 = await getSelectedImageFile();
      image1.value = imageFile1;
      isImage1Changed.toggle();
      image1.refresh();
    } catch(e) {
      _showErrorSnackBar(errorTitle: errorTitle, errorMessage: e.toString());
    }
  }

  /// Setter for setting image 2
  void setImage2() async {
    try {
      ImageFile imageFile2 = await getSelectedImageFile();
      image2.value = imageFile2;
      isImage2Changed.toggle();
      image2.refresh();
    } catch(e) {
      _showErrorSnackBar(errorTitle: errorTitle, errorMessage: e.toString());
    }
  }

  /// Function to edit item in remote database based on user inputs
  Future<void> editItemInRemoteDatabase() async {
    try {

      Future<void> editItemProcess() async {
        Map<String, dynamic> itemData = {
          'id': item.id,
          'name': itemNameController.text.trim(),
          'images': item.images,
          'ownerID': item.ownerID,
          'location': location.value,
          'category': category.value,
          'description': descriptionController.text.trim(),
          'availability': availabilityController.text.trim(),
          'isRemoved': false
        };

        if(isImage1Changed.isTrue) {
          return await _itemsRepository.editItem(id: item.id, itemData: itemData, imageFile1: image1.value);
        }

        if(isImage2Changed.isTrue) {
          return await _itemsRepository.editItem(id: item.id, itemData: itemData, imageFile2: image2.value);
        }

        return await _itemsRepository.editItem(id: item.id, itemData: itemData);
      }

      await Get.showOverlay(
        asyncFunction: editItemProcess,
        loadingWidget: centerCircularProgressIndicator(),
      );

      Get.back();

    } catch(e) {
      print("EditItemPageController(editItemInRemoteDatabase): ${e.toString()}");
    }

  }

  /// Helper method to display error snack bar
  void _showErrorSnackBar({required String errorTitle, required String errorMessage}) {
    getXErrorSnackBar(title: errorTitle, message: errorMessage);
  }
}