import 'package:cloud_firestore/cloud_firestore.dart';

class Person {
  //Personal info
  String? imageProfile;
  String? name;
  String? email;
  String? password;
  String? city;
  String? country;
  String? nationality;
  String? summary;
  int? publishedDateTime;

  //User type
  String? userType;

  //Background
  String? skills;
  String? education;
  String? lang;

  //Work Experience
  String? jobtitle;
  String? companyName;
  int? startDate;
  int? endDate;

  Person(
      {this.imageProfile,
      this.name,
      this.email,
      this.password,
      this.city,
      this.country,
      this.summary,
      this.publishedDateTime,
      this.userType,
      this.skills,
      this.education,
      this.nationality,
      this.lang,
      this.jobtitle,
      this.companyName,
      this.startDate,
      this.endDate});

  static Person fromdataSnapshot(DocumentSnapshot snapshot) {
    var dataSnapshot = snapshot.data() as Map<String, dynamic>;

    return Person(
      imageProfile: dataSnapshot["imageProfile"],
      name: dataSnapshot["name"],
      email: dataSnapshot["email"],
      password: dataSnapshot["password"],
      city: dataSnapshot["city"],
      country: dataSnapshot["country"],
      nationality: dataSnapshot["nationality"],
      summary: dataSnapshot["summary"],
      publishedDateTime: dataSnapshot["publishedDateTime"],
      userType: dataSnapshot["userType"],
      skills: dataSnapshot["skills"],
      education: dataSnapshot["education"],
      lang: dataSnapshot["lang"],
      jobtitle: dataSnapshot["jobtitle"],
      companyName: dataSnapshot["companyName"],
      startDate: dataSnapshot["startDate"],
      endDate: dataSnapshot["endDate"],
    );
  }

  Map<String, dynamic> toJson() => {
        "imageProfile": imageProfile,
        "name": name,
        "email": email,
        "password": password,
        "city": city,
        "country": country,
        "summary": summary,
        "publishedDateTime": publishedDateTime,
        "userType": userType,
        "nationality": nationality,
        "skills": skills,
        "education": education,
        "lang": lang,
        "jobtitle": jobtitle,
        "companyName": companyName,
        "startDate": startDate,
        "endDate": endDate,
      };
}
