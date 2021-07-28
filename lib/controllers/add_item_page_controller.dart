import 'package:get/get.dart';
import 'package:gify/models/image_file.dart';
import 'package:gify/repositories/items_repository.dart';
import 'package:gify/repositories/items_repository_impl.dart';
import 'package:gify/services/get_selected_image_bytes.dart';
import 'package:gify/widgets/center_circular_progress_indicator.dart';
import 'package:gify/widgets/getX_widgets/getX_error_snack_bar.dart';

class AddItemPageController extends GetxController {

  var image1 = ImageFile(null, null).obs;
  var image2 = ImageFile(null, null).obs;
  var isLoading = false;

  final ItemsRepository _itemsRepository = ItemsRepositoryImpl();

  final errorTitle = 'Oops, something went wrong...';

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