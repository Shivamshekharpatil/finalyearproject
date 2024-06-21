import 'package:finalyearproject/controllers/profile-controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SwippingScreen extends StatefulWidget {
  const SwippingScreen({super.key});

  @override
  State<SwippingScreen> createState() => _SwippingScreenState();
}

class _SwippingScreenState extends State<SwippingScreen> {
  ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return PageView.builder(
            itemCount: profileController.allUsersProfileList.length,
            controller: PageController(initialPage: 0, viewportFraction: 1),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final eachProfileInfo =
                  profileController.allUsersProfileList[index];

              return DecoratedBox(
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: NetworkImage(
                    eachProfileInfo.imageProfile.toString(),
                  ),
                  fit: BoxFit.cover,
                )),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      //filter icon button
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.filter_list,
                              size: 30,
                            ),
                          ),
                        ),
                      ),

                      const Spacer(),

                      //user data
                      GestureDetector(
                        onTap: () {},
                        child: Column(
                          children: [
                            //name
                            Text(
                              eachProfileInfo.name.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                letterSpacing: 4,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            //age - city
                            Text(
                              eachProfileInfo.age.toString() +
                                  " ⦾ " +
                                  eachProfileInfo.city.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                letterSpacing: 4,
                              ),
                            ),

                            const SizedBox(
                              height: 4,
                            ),

                            //Jobtitle and userType
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white30,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                  ),
                                  child: Text(
                                    eachProfileInfo.jobtitle.toString(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),

                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white30,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(16)),
                                  ),
                                  child: Text(
                                    eachProfileInfo.userType.toString(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),



                            //country and nationality
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white30,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                  ),
                                  child: Text(
                                    eachProfileInfo.country.toString(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),

                                const SizedBox(
                                  width: 6,
                                ),

                                //nationality
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white30,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                  ),
                                  child: Text(
                                    eachProfileInfo.nationality.toString(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(
                        height: 14,
                      ),

                      //image buttons - favourite - chat - like
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          //favourite button
                          GestureDetector(
                            onTap: () {},
                            child: Image.asset(
                              "asset/image/star.png",
                              width: 50,
                            ),
                          ),

                          //chat button
                          GestureDetector(
                            onTap: () {},
                            child: Image.asset(
                              "asset/image/chat.png",
                              width: 70,
                            ),
                          ),

                          //like button
                          GestureDetector(
                            onTap: () {},
                            child: Image.asset(
                              "asset/image/thumbs-up.png",
                              width: 50,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            });
      }),
    );
  }
}
