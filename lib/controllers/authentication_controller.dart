import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AuthenticationController extends GetxController
{
  static AuthenticationController authController = Get.find();

  late Rx<File?> pickedFile;
  File? get profilrImage => pickedFile.value;
  XFile? imageFile;

  pickImageFileFromGallery() async
  {
    imageFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if(imageFile != null)
      {
        Get.snackbar("Profile Image", "You have successfully picked your profile image from gallery.");
      }

    pickedFile = Rx<File?>(File(imageFile!.path));
  }

  captureImageFromPhoneCamera() async
  {
    imageFile = await ImagePicker().pickImage(source: ImageSource.camera);

    if(imageFile != null)
    {
      Get.snackbar("Profile Image", "You have successfully captured your profile image using camera.");
    }

    pickedFile = Rx<File?>(File(imageFile!.path));
  }
}