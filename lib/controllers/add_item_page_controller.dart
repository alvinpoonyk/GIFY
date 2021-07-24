import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gify/constants/styles.dart';
import 'package:gify/repositories/items_repository.dart';
import 'package:gify/repositories/items_repository_impl.dart';
import 'package:gify/services/get_selected_image_bytes.dart';
import 'package:gify/widgets/center_circular_progress_indicator.dart';

class AddItemPageController extends GetxController {

  var image1 = ImageFile(null, null).obs;
  var image2 = ImageFile(null, null).obs;
  var isLoading = false;

  final ItemsRepository _itemsRepository = ItemsRepositoryImpl();

  void setLoadingStatus({required bool loadingStatus}) {
    isLoading = loadingStatus;
  }

  void setImage1() async {
    ImageFile imageFile1 = await getSelectedImageFile();
    image1.value = imageFile1;
    image1.refresh();
  }

  void setImage2() async {
    ImageFile imageFile2 = await getSelectedImageFile();
    image2.value = imageFile2;
    image2.refresh();
  }

  Future<void> storeItemInRemoteDatabase({
    required String name, required String ownerID, required String location, required String category,
    required String description, required String availability}) async {
      Map<String, dynamic> itemData = {
        "name" : name,
        "ownerID" : ownerID,
        "location" : location,
        "category" : category,
        "description" : description,
        "availability" : availability,
      };

      Get.showOverlay(
          asyncFunction: () => _itemsRepository.createItem(itemData: itemData, imageFile1: image1.value, imageFile2: image2.value),
          loadingWidget: centerCircularProgressIndicator(),
      );
  }

}

class ImageFile {
  var file;
  var bytes;
  ImageFile(this.file, this.bytes);
}