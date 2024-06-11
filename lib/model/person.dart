import 'package:cloud_firestore/cloud_firestore.dart';

class Person
{
  //Personal info
  String? imageProfile;
  String? name;
  String? email;
  String? password;
  String? city;
  String? country;
  String? summary;
  int? publishedDateTime;

  //User type
  String? userType;

  //Background
  String? nationality;
  String? skills;
  String? education;


  Person({
   this.imageProfile,
   this.name,
   this.email,
   this.password,
   this.city,
   this.country,
   this.summary,
   this.publishedDateTime,
   this.userType,
   this.nationality,
   this.skills,
   this.education
});

  static Person fromdataSnapshot(DocumentSnapshot snapshot)
  {
    var dataSnapshot = snapshot.data() as Map<String, dynamic>;

    return Person(
      imageProfile: dataSnapshot["imageProfile"],
      name: dataSnapshot["name"],
      email: dataSnapshot["email"],
      password: dataSnapshot["password"],
      city: dataSnapshot["city"],
      country: dataSnapshot["country"],
      summary: dataSnapshot["summary"],
      publishedDateTime: dataSnapshot["publishedDateTime"],
      userType: dataSnapshot["userType"],
      nationality: dataSnapshot["nationality"],
      skills: dataSnapshot["skills"],
      education: dataSnapshot["education"]
    );
  }

  Map<String, dynamic> toJson() =>
      {
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
      };

}