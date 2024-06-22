import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalyearproject/global_second.dart';
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

  favouriteSentAndFavouriteReceived(String toUserID, String senderName) async
  {
    var document = await FirebaseFirestore.instance
        .collection("users")
        .doc(toUserID).collection("favouriteReceived").doc(currentUserID)
        .get();

    //remove the favourite from database
    if(document.exists)
    {
      //remove [currentUserID] from the favouriteReceived list of profile person [toUserID].
      await FirebaseFirestore.instance
          .collection("users")
          .doc(toUserID).collection("favouriteReceived").doc(currentUserID)
          .delete();

      //remove [toUserID] from the favouriteSent list of profile person [currentUserID].
      await FirebaseFirestore.instance
          .collection("users")
          .doc(currentUserID).collection("favouriteSent").doc(toUserID)
          .get();
    }
    else //mark as favourite //add favourite in database
    {
      //add [currentUserID] from the favouriteReceived list of profile person [toUserID].
      await FirebaseFirestore.instance
          .collection("users")
          .doc(toUserID).collection("favouriteReceived").doc(currentUserID)
          .set({});

      //add profile person [toUserID] to the favouriteSent list of profile person [currentUserID].
      await FirebaseFirestore.instance
          .collection("users")
          .doc(currentUserID).collection("favouriteSent").doc(toUserID)
          .set({});

      //send notification
    }

    update();
  }
}