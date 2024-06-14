import 'package:finalyearproject/tabScreens/favourite_sent_favourite_received_screen.dart';
import 'package:finalyearproject/tabScreens/like_sent_like_received_screen.dart';
import 'package:finalyearproject/tabScreens/swipping_screen.dart';
import 'package:finalyearproject/tabScreens/user_details_screen.dart';
import 'package:finalyearproject/tabScreens/view_sent_view_received_screen.dart';
import 'package:flutter/material.dart';

class HomeScreens extends StatefulWidget {
  const HomeScreens({super.key});

  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  int screenIndex = 0;
  List tabScreenList = [
    SwippingScreen(),
    ViewSentViewReceivedScreen(),
    FavouriteSentFavouriteReceivedScreen(),
    LikeSentLikeReceivedScreen(),
    UserDetailsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (indexNumber)
        {
          setState(() {
            screenIndex = indexNumber;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white12,
        currentIndex: screenIndex,
        items: const [
          // Swipping Icon
          BottomNavigationBarItem(
              icon: Icon(
                Icons.swipe,
                size: 30,
              ),
              label: ""),

          // view Icon
          BottomNavigationBarItem(
              icon: Icon(
                Icons.remove_red_eye,
                size: 30,
              ),
              label: ""),

          //Favourite Icon
          BottomNavigationBarItem(
              icon: Icon(
                Icons.star,
                size: 30,
              ),
              label: ""),

          //Like Icon
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                size: 30,
              ),
              label: ""),

          //User Icon
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: 30,
              ),
              label: ""),
        ],
      ),
      body: tabScreenList[screenIndex],
    );
  }
}
