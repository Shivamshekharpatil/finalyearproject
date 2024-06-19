import 'dart:io';

import 'package:finalyearproject/controllers/authentication_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/custom_text_field_widget.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  //personal info
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController ageTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController cityTextEditingController = TextEditingController();
  TextEditingController countryTextEditingController = TextEditingController();
  TextEditingController nationalityTextEditingController = TextEditingController();
  TextEditingController summaryTextEditingController = TextEditingController();
  //user type
  TextEditingController usertypeTextEditingController = TextEditingController();

  //Background - educational values
  TextEditingController skillsTextEditingController = TextEditingController();
  TextEditingController educationTextEditingController =
      TextEditingController();
  TextEditingController langTextEditingController = TextEditingController();

  //Work Experience
  TextEditingController jobtitleTextEditingController = TextEditingController();
  TextEditingController companyNameTextEditingController =
      TextEditingController();
  TextEditingController startDateTextEditingController =
      TextEditingController();
  TextEditingController endDateTextEditingController = TextEditingController();

  bool showProgressBar = false;

  var authenticationController = AuthenticationController.authController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),

              const Text(
                "Create Account",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: 10,
              ),

              const Text(
                "To get Started Now",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(
                height: 16,
              ),

              //choose image circle avatar
              authenticationController.imageFile == null
                  ? const CircleAvatar(
                      radius: 80,
                      backgroundImage: AssetImage("asset/image/profile.png"),
                      backgroundColor: Colors.white,
                    )
                  : Container(
                      width: 180,
                      height: 180,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey,
                        image: DecorationImage(
                          fit: BoxFit.fitHeight,
                          image: FileImage(
                            File(
                              authenticationController.imageFile!.path,
                            ),
                          ),
                        ),
                      ),
                    ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () async {
                      await authenticationController.pickImageFileFromGallery();

                      setState(() {
                        authenticationController.imageFile;
                      });
                    },
                    icon: const Icon(
                      Icons.image_outlined,
                      color: Colors.grey,
                      size: 30,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  IconButton(
                    onPressed: () async {
                      await authenticationController
                          .captureImageFromPhoneCamera();

                      setState(() {
                        authenticationController.imageFile;
                      });
                    },
                    icon: const Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.grey,
                      size: 30,
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 30,
              ),

              //personal info
              const Text(
                "Personal Info:",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: 30,
              ),

              //name
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFileWidget(
                  editingController: nameTextEditingController,
                  labelText: "Name",
                  iconData: Icons.person_outline,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              //Email
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFileWidget(
                  editingController: emailTextEditingController,
                  labelText: "Email",
                  iconData: Icons.email_outlined,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              //Password
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFileWidget(
                  editingController: passwordTextEditingController,
                  labelText: "Password",
                  iconData: Icons.lock_outline,
                  isObscure: true,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              //age
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFileWidget(
                  editingController: ageTextEditingController,
                  labelText: "Age",
                  iconData: Icons.numbers,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              //phone
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFileWidget(
                  editingController: phoneTextEditingController,
                  labelText: "Phone Number",
                  iconData: Icons.call,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              //city
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFileWidget(
                  editingController: cityTextEditingController,
                  labelText: "City",
                  iconData: Icons.location_city,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              //country
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFileWidget(
                  editingController: countryTextEditingController,
                  labelText: "Country",
                  iconData: Icons.location_city,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              //Nationality
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFileWidget(
                  editingController: nationalityTextEditingController,
                  labelText: "Nationality",
                  iconData: Icons.flag_circle_outlined,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              //summary
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFileWidget(
                  editingController: summaryTextEditingController,
                  labelText: "Summary",
                  iconData: Icons.text_fields,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              //Languages
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFileWidget(
                  editingController: langTextEditingController,
                  labelText: "Languages",
                  iconData: Icons.language,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              //usertype
              const Text(
                "User Type:",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: 12,
              ),

              //user
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFileWidget(
                  editingController: usertypeTextEditingController,
                  labelText: "User",
                  iconData: CupertinoIcons.rectangle_stack_person_crop_fill,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              //Education Background
              const Text(
                "Education Background:",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: 12,
              ),

              //Education
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFileWidget(
                  editingController: educationTextEditingController,
                  labelText: "Education",
                  iconData: Icons.history_edu,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              //Skills
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFileWidget(
                  editingController: skillsTextEditingController,
                  labelText: "Skills",
                  iconData: Icons.work,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              //Work Experience
              const Text(
                "Work Expirence:",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: 12,
              ),

              //Job Title
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFileWidget(
                  editingController: jobtitleTextEditingController,
                  labelText: "Job Title",
                  iconData: Icons.title,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              //Company Name
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFileWidget(
                  editingController: companyNameTextEditingController,
                  labelText: "Company Name",
                  iconData: Icons.work,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              //StartDate
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFileWidget(
                  editingController: startDateTextEditingController,
                  labelText: "Start Date",
                  iconData: Icons.numbers,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              //End Date
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFileWidget(
                  editingController: endDateTextEditingController,
                  labelText: "End Date",
                  iconData: Icons.numbers,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 30,
              ),

              //Create account button
              Container(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    )),
                child: InkWell(
                  onTap: () async
                  {
                    if (authenticationController.imageFile != null) {
                      if (
                          //personal info
                          nameTextEditingController.text.trim().isNotEmpty &&
                              emailTextEditingController.text
                                  .trim()
                                  .isNotEmpty &&
                              passwordTextEditingController.text
                                  .trim()
                                  .isNotEmpty &&
                              ageTextEditingController.text
                                  .trim()
                                  .isNotEmpty &&
                              phoneTextEditingController.text
                                  .trim()
                                  .isNotEmpty &&
                              cityTextEditingController.text
                                  .trim()
                                  .isNotEmpty &&
                              countryTextEditingController.text
                                  .trim()
                                  .isNotEmpty &&
                              nationalityTextEditingController.text
                                  .trim()
                                  .isNotEmpty &&
                              summaryTextEditingController.text
                                  .trim()
                                  .isNotEmpty &&
                              //education
                              usertypeTextEditingController.text
                                  .trim()
                                  .isNotEmpty &&
                              skillsTextEditingController.text
                                  .trim()
                                  .isNotEmpty &&
                              educationTextEditingController.text
                                  .trim()
                                  .isNotEmpty &&
                              langTextEditingController.text
                                  .trim()
                                  .isNotEmpty &&
                              //work experience
                              jobtitleTextEditingController.text
                                  .trim()
                                  .isNotEmpty &&
                              companyNameTextEditingController.text
                                  .trim()
                                  .isNotEmpty &&
                              startDateTextEditingController.text
                                  .trim()
                                  .isNotEmpty &&
                              endDateTextEditingController.text
                                  .trim()
                                  .isNotEmpty)
                      {
                        setState(() {
                          showProgressBar = true;
                        });

                        await authenticationController.createNewUserAccount(
                          //personal info
                          authenticationController.profilrImage!,
                          nameTextEditingController.text.trim(),
                          emailTextEditingController.text.trim(),
                          passwordTextEditingController.text.trim(),
                          ageTextEditingController.text.trim(),
                          phoneTextEditingController.text.trim(),
                          cityTextEditingController.text.trim(),
                          countryTextEditingController.text.trim(),
                          nationalityTextEditingController.text.trim(),
                          summaryTextEditingController.text.trim(),
                          //user type
                          usertypeTextEditingController.text.trim(),
                          //education
                          educationTextEditingController.text.trim(),
                          skillsTextEditingController.text.trim(),
                          langTextEditingController.text.trim(),
                          //work experience
                          jobtitleTextEditingController.text.trim(),
                          companyNameTextEditingController.text.trim(),
                          startDateTextEditingController.text.trim(),
                          endDateTextEditingController.text.trim(),
                        );

                        setState(() {
                          showProgressBar = false;
                          authenticationController.imageFile = null;
                        });

                      }
                      else {
                        Get.snackbar("Incomplete Field",
                            "Please fill out all field in text fields.");
                      }
                    } else {
                      Get.snackbar("Image File Missing",
                          "Please pick image from Photo gallery or capture with Camera");
                    }
                  },
                  child: const Center(
                    child: Text(
                      "Create Account",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 16,
              ),

              //already have an account login here button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account? ",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: const Text(
                      "Login Here",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 16,
              ),

              showProgressBar == true
                  ? const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.pink),
                    )
                  : Container(),

              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
