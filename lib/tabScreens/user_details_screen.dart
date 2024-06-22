
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slider/carousel.dart';

class UserDetailsScreen extends StatefulWidget
{
  String? userID;
  UserDetailsScreen({super.key, this.userID,});

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen>
{
  //personal info
  String name = '';
  String email = '';
  String password = '';
  String age = '';
  String phone = '';
  String city = '';
  String country = '';
  String nationality = '';
  String summary = '';

  //user type
  String userType = '';

  //background
  String skills = '';
  String education = '';
  String lang = '';

  //work experience
  String jobtitle = '';
  String compnayName = '';
  String startDate = '';
  String endDate = '';

  //slider images
  String urlImage1 = "https://firebasestorage.googleapis.com/v0/b/swipejobnow-app.appspot.com/o/PlaceHolder%2Fuser.png?alt=media&token=d7254008-fa3c-4d2f-a7de-8b7d0ec419fa";


  retrieveUserInfo() async {
   await FirebaseFirestore.instance
        .collection("users")
        .doc(widget.userID)
        .get()
        .then((snapshot)
   {
      if (snapshot.exists)
      {
        if(snapshot.data()!["urlImage1"] != null)
        {
          setState(() {
            urlImage1 = snapshot.data()!["urlImage1"];
          });
        }
        setState(() {
          //personal info
          name = snapshot.data()!['name'];
          email = snapshot.data()!['email'];
          password = snapshot.data()!['password'];
          age = snapshot.data()!['age'].toString();
          phone = snapshot.data()!['phone'].toString();
          city = snapshot.data()!['city'];
          country = snapshot.data()!['country'];
          nationality = snapshot.data()!['nationality'];
          summary = snapshot.data()!['summary'];

          //userType
          userType = snapshot.data()!['userType'];

          //Background
          skills = snapshot.data()!['skills'];
          education = snapshot.data()!['education'];
          lang = snapshot.data()!['lang'];

          //Work Experience
          jobtitle = snapshot.data()!['jobtitle'];
          compnayName = snapshot.data()!['companyName'];
          startDate = snapshot.data()!['startDate'].toString();
          endDate = snapshot.data()!['endDate'].toString();
        });
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    retrieveUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "User Profile",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            icon: const Icon(
              Icons.logout,
              size: 30,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              //image
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: Carousel(
                    items: [
                      Image.network(urlImage1, fit: BoxFit.cover),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 10.0,),

              //personal info
              const SizedBox(height: 30,),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Personal Information:",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Divider(
                color: Colors.white,
                thickness: 2,
              ),

              //personal info table data
              Container(
                padding: const EdgeInsets.all(20.0),
                child: Table(
                  children: [

                    //name
                    TableRow(
                      children:
                        [
                          const Text(
                            "Name: ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),

                          Text(
                            name,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                            ),
                          ),
                        ],
                    ),

                    //extra row
                    const TableRow(
                      children:
                      [
                        Text(""),
                        Text(""),
                      ],
                    ),

                    //age
                    TableRow(
                      children:
                      [
                        const Text(
                          "Age: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          age,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),

                    //extra row
                    const TableRow(
                      children:
                      [
                        Text(""),
                        Text(""),
                      ],
                    ),

                    //Email
                    TableRow(
                      children:
                      [
                        const Text(
                          "Email ID: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          email,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),

                    //extra row
                    const TableRow(
                      children:
                      [
                        Text(""),
                        Text(""),
                      ],
                    ),

                    //Phone
                    TableRow(
                      children:
                      [
                        const Text(
                          "Phone No: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          phone,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),

                    //extra row
                    const TableRow(
                      children:
                      [
                        Text(""),
                        Text(""),
                      ],
                    ),

                    //city
                    TableRow(
                      children:
                      [
                        const Text(
                          "City: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          city,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),

                    //extra row
                    const TableRow(
                      children:
                      [
                        Text(""),
                        Text(""),
                      ],
                    ),

                    //country
                    TableRow(
                      children:
                      [
                        const Text(
                          "Country: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          country,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),

                    //extra row
                    const TableRow(
                      children:
                      [
                        Text(""),
                        Text(""),
                      ],
                    ),

                    //Nationality
                    TableRow(
                      children:
                      [
                        const Text(
                          "Nationality: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          nationality,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),

                    //extra row
                    const TableRow(
                      children:
                      [
                        Text(""),
                        Text(""),
                      ],
                    ),

                    //Summary
                    TableRow(
                      children:
                      [
                        const Text(
                          "Summary: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          summary,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),

              //userType
              const SizedBox(height: 30,),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "User Type:",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Divider(
                color: Colors.white,
                thickness: 2,
              ),
              //userType table data
              Container(
                padding: const EdgeInsets.all(20.0),
                child: Table(
                  children: [

                    //userType
                    TableRow(
                      children:
                      [
                        const Text(
                          "User Type: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          userType,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),

                    //extra row
                    const TableRow(
                      children:
                      [
                        Text(""),
                        Text(""),
                      ],
                    ),
                  ],
                ),
              ),

              //Background
              const SizedBox(height: 30,),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Background Information:",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Divider(
                color: Colors.white,
                thickness: 2,
              ),
              //Background table data
              Container(
                padding: const EdgeInsets.all(20.0),
                child: Table(
                  children: [

                    //skills
                    TableRow(
                      children:
                      [
                        const Text(
                          "Skills: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          skills,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),

                    //extra row
                    const TableRow(
                      children:
                      [
                        Text(""),
                        Text(""),
                      ],
                    ),

                    //Education
                    TableRow(
                      children:
                      [
                        const Text(
                          "Education: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          education,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),

                    //extra row
                    const TableRow(
                      children:
                      [
                        Text(""),
                        Text(""),
                      ],
                    ),

                    //Language
                    TableRow(
                      children:
                      [
                        const Text(
                          "Language: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          lang,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),

                    //extra row
                    const TableRow(
                      children:
                      [
                        Text(""),
                        Text(""),
                      ],
                    ),
                  ],
                ),
              ),

              //Work Experience
              const SizedBox(height: 30,),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Work Experience:",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Divider(
                color: Colors.white,
                thickness: 2,
              ),
              //Work Experience table data
              Container(
                padding: const EdgeInsets.all(20.0),
                child: Table(
                  children: [

                    //jobtitle
                    TableRow(
                      children:
                      [
                        const Text(
                          "job Title: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          jobtitle,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),

                    //extra row
                    const TableRow(
                      children:
                      [
                        Text(""),
                        Text(""),
                      ],
                    ),

                    //CompanyName
                    TableRow(
                      children:
                      [
                        const Text(
                          "Company Name: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          compnayName,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),

                    //extra row
                    const TableRow(
                      children:
                      [
                        Text(""),
                        Text(""),
                      ],
                    ),

                    //start date
                    TableRow(
                      children:
                      [
                        const Text(
                          "Start Date: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          startDate,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),

                    //extra row
                    const TableRow(
                      children:
                      [
                        Text(""),
                        Text(""),
                      ],
                    ),

                    //End date
                    TableRow(
                      children:
                      [
                        const Text(
                          "End Date: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          endDate,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
