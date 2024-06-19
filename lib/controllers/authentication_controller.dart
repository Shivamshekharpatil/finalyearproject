import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalyearproject/authenticationScreen/login_screen.dart';
import 'package:finalyearproject/homeScreen/home_screen.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:finalyearproject/model/person.dart' as personModel;

class AuthenticationController extends GetxController
{
  static AuthenticationController authController = Get.find();

  late Rx<User?> firebaseCurrentUser;

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

  Future<String> uploadImageToStorage(File imageFile) async
  {
    Reference referenceStorage = FirebaseStorage.instance.ref()
        .child("Profile Image")
        .child(FirebaseAuth.instance.currentUser!.uid);

    UploadTask task = referenceStorage.putFile(imageFile);
    TaskSnapshot snapshot = await task;

    String downloadurlOfImage = await snapshot.ref.getDownloadURL();

    return downloadurlOfImage;
  }

  createNewUserAccount(
      //personal info
      File imageProfile, String name,
      String email, String password, String age,
      String phone,String city, String country,
      String nationality, String summary,

      //user Type
      String userType,

      //Eductaion Background
      String education,
      String skills, String lang,

      //Work Experience
      String jobtitle, String companyName,
      String startDate, String endDate) async
  {
    try
    {
      //1. Authenctication using email and password
      UserCredential credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password
      );

      //2. upload image to storage
      String urlOfDownloadedImage =  await uploadImageToStorage(imageProfile);

      //3. save user info to firestore database
      personModel.Person personInstance = personModel.Person(
        //Person Info
        uid: FirebaseAuth.instance.currentUser!.uid,
        imageProfile: urlOfDownloadedImage,
        name: name,
        email: email,
        password: password,
        age: int.parse(age),
        phone: int.parse(phone),
        city: city,
        country: country,
        nationality: nationality,
        summary: summary,
        publishedDateTime: DateTime.now().millisecondsSinceEpoch,

        // User type
        userType: userType,

        //Education
        education: education,
        skills: skills,
        lang: lang,

        //Work Experience
        jobtitle: jobtitle,
        companyName: companyName,
        startDate: DateTime.now().millisecondsSinceEpoch,
        endDate: DateTime.now().millisecondsSinceEpoch,
      );

      await FirebaseFirestore.instance.collection("users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set(personInstance.toJson());

      Get.snackbar("Account Successfully Created", "Congratulations");
      Get.to(const HomeScreens());
    }
    catch(errorMsg)
    {
      Get.snackbar("Try again Accout not created", "Error Occurred: $errorMsg");
    }
  }

  loginUser(String emailUser, String passwordUser) async
  {
    try
    {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailUser,
          password: passwordUser,
      );

      Get.snackbar("Welcome back $emailUser", "You have logged-in successfully");
      Get.to(const HomeScreens());
    }
    catch(errorMsg)
    {
      Get.snackbar("Login Unsuccessful", "Error occurred: $errorMsg");
    }
  }

  checkIfUserIsLoggedIn(User? currentUser)
  {
    if(currentUser == null)
    {
      Get.to(const LoginScreen());
    }
    else
    {
      Get.to(const HomeScreens());
    }
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();

    firebaseCurrentUser = Rx<User?>(FirebaseAuth.instance.currentUser);
    firebaseCurrentUser.bindStream(FirebaseAuth.instance.authStateChanges());

    ever(firebaseCurrentUser, checkIfUserIsLoggedIn);
  }
}