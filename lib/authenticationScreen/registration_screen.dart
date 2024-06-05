
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/custom_text_field_widget.dart';

class RegistrationScreen extends StatefulWidget
{
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen>
{
  //personal info
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController cityTextEditingController = TextEditingController();
  TextEditingController countryTextEditingController = TextEditingController();
  TextEditingController summaryTextEditingController = TextEditingController();
  //user type
  TextEditingController usertypeTextEditingController = TextEditingController();

  //Background - educational values
  TextEditingController nationalityTextEditingController = TextEditingController();
  TextEditingController skillsTextEditingController = TextEditingController();
  TextEditingController educationTextEditingController = TextEditingController();

  bool showProgressBar = false;

  @override
  Widget build(BuildContext context)
  {
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
              GestureDetector(
                onTap: ()
                {

                },
                child: const CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage(
                      "asset/image/profile.png"
                  ),
                  backgroundColor: Colors.white,
                ),
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
                    )
                ),
                child: InkWell(
                  onTap: (){

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
                    onTap: ()
                    {
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

              showProgressBar == true ? const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.pink),
              ) : Container(),

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
