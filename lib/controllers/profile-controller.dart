import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalyearproject/model/person.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController
{
  final Rx<List<Person>> usersProfileList = Rx<List<Person>>([]);
  List<Person> get allUsersProfileList => usersProfileList.value;
  
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    
    usersProfileList.bindStream(
      FirebaseFirestore.instance
          .collection("users")
          .where("uid", isNotEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .snapshots()
          .map((QuerySnapshot queryDataSnapshot)
      {
        List<Person> profilesList = [];

        for(var eachProfile in queryDataSnapshot.docs)
        {
          profilesList.add(Person.fromdataSnapshot(eachProfile));
        }
        return profilesList;
      })
    );
  }
}