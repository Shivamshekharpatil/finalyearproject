import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalyearproject/global_second.dart';
import 'package:flutter/material.dart';

class FavouriteSentFavouriteReceivedScreen extends StatefulWidget {
  const FavouriteSentFavouriteReceivedScreen({super.key});

  @override
  State<FavouriteSentFavouriteReceivedScreen> createState() => _FavouriteSentFavouriteReceivedScreenState();
}

class _FavouriteSentFavouriteReceivedScreenState extends State<FavouriteSentFavouriteReceivedScreen> {

  bool isFavouriteSentClicked = true;
  List<String> favouriteSentList = [];
  List<String> favouriteReceivedList = [];
  List favouritesList = [];
  getFavouriteListKeys() async
  {
    if(isFavouriteSentClicked){
      var favouriteSentDocument = await FirebaseFirestore.instance
          .collection("users")
          .doc(currentUserID.toString()).collection("favouriteSent")
          .get();

      for(int i=0; i<favouriteSentDocument.docs.length; i++){
        favouriteSentList.add(favouriteSentDocument.docs[i].id);
      }
      getKeysDataFromUsersCollection(favouriteSentList);
    }
    else {
      var favouriteReceivedDocument = await FirebaseFirestore.instance
          .collection("users")
          .doc(currentUserID.toString()).collection("favouriteReceived")
          .get();

      for(int i=0; i<favouriteReceivedDocument.docs.length; i++){
        favouriteReceivedList.add(favouriteReceivedDocument.docs[i].id);
      }

      getKeysDataFromUsersCollection(favouriteReceivedList);
    }

  }

  getKeysDataFromUsersCollection(List<String> keysList) async {
    var allUsersDocument = await FirebaseFirestore.instance.collection("users").get();

    for(int i=0; i<allUsersDocument.docs.length; i++){
      for(int k=0; k<keysList.length; k++){
        if(((allUsersDocument.docs[i].data() as dynamic)["uid"]) == keysList[k]){
          favouritesList.add(allUsersDocument.docs[i].data());
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Favourite sent and Favourite received Screen",
          style: TextStyle(
            color: Colors.green,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
