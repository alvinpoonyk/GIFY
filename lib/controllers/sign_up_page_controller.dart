import 'package:get/get.dart';
import 'package:gify/models/image_file.dart';
import 'package:gify/services/get_selected_image_bytes.dart';

class SignUpPageController extends GetxController {

  var userImage = ImageFile(null, null).obs;

  Future<void> setUserImage() async {
    ImageFile selectedImage = await getSelectedImageFile();
    userImage.value = selectedImage;
    userImage.refresh();
  }


}