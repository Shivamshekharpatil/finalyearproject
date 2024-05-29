import 'package:finalyearproject/model/onboard.dart';
import 'package:finalyearproject/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../helper/global.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = PageController();

    final list = [
      //Onboarding 1
      Onboard(
        title: 'Unlock Your Future:',
        subtitle: 'Your Dream Job is Just a Swipe Away!',
        lottie: 'tart'),

      //Onboarding 2
      Onboard(
          title: 'Find Your Perfect Candidate & Job!',
          subtitle: 'Swipe Right to Connect, Swipe Left to Pass – Efficient Hiring at Your Fingertips!',
          lottie: 'right_and_left'),
    ];

    return Scaffold(
      body: PageView.builder(
        controller: c,
        itemCount: list.length,
        itemBuilder: (ctx, ind) {

          final islast = ind == list.length - 1;

        return Column(
          children: [
            Lottie.asset('asset/lottie/${list[ind].lottie}.json',
              height: mq.height * .6, width: islast ? mq.width * .7 : null),

            //title
             Text(
               list[ind].title,
              style: const TextStyle(
                  fontSize: 18, fontWeight: FontWeight.w900, letterSpacing: .5),
            ),

            //for adding some space
            SizedBox(height: mq.height * .015),
            //subtitle
            SizedBox(
              width: mq.width * .7,
              child:  Text(
                list[ind].subtitle,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 13.5, letterSpacing: .5, color: Colors.black54),
              ),
            ),

            const Spacer(),

            //dots

            Wrap(
                spacing: 10,
                children: List.generate(list.length, (i) =>
                    Container(
                      width: i == ind ? 15 : 10,
                      height: 8,
                      decoration:  BoxDecoration(
                          color: i == ind ? Colors.red : Colors.grey,
                          borderRadius: const BorderRadius.all(Radius.circular(5))),
                    ),)
            ),

            const Spacer(),

            //button
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    elevation: 0,
                    textStyle:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    minimumSize: Size(mq.width * .4, 50)),
                onPressed: () {
                  if (islast) {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (_) => const HomeScreen()));
                  } else {
                    c.nextPage(
                        duration: const Duration(milliseconds: 600),
                        curve: Curves.ease);
                  }
                },
                child:  Text( islast ? 'Finish' : 'Next')),
          ],
        );

      },),
    );
  }
}
