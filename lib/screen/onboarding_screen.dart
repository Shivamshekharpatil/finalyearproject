import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../helper/global.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Lottie.asset('asset/lottie/tart.json', height: mq.height * .6),

          //title
          const Text(
            'Connect and Conquer',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w900, letterSpacing: .5),
          ),

          //for adding some space
          SizedBox(height: mq.height * .015),
          //subtitle
          SizedBox(
            width: mq.width * .7,
            child: const Text(
              'Bridging Talent and Opportunity with Real-Time Conversations',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 13.5, letterSpacing: .5, color: Colors.black54),
            ),
          ),

          const Spacer(),

          //dots

          Wrap(
            spacing: 10,
              children: List.generate(2, (i) =>
              Container(
                width: 10,
                height: 8,
                decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(5))),
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
              onPressed: () {},
              child: const Text('Next'))
        ],
      ),
    );
  }
}
