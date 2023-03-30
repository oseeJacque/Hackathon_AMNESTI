import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:hackathonmobile/core/constants/colors.dart';
import 'package:hackathonmobile/core/utils/app_text.dart';

import '../../constants/assert.dart';
import '../../constants/string.dart';
import 'fisrt_splash_screen.dart';

class WelcommePage extends StatelessWidget {
  const WelcommePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: AnimatedSplashScreen(
        duration: 2500,
        splashTransition: SplashTransition.fadeTransition,
        nextScreen: const FirstSplashScreen(),
        splash: Column(
          children: [
            //Flexible(child: Container(),flex: 1,),

            SizedBox(
              height: 50,
              width: 50,
              child: Image.asset(
                AssetData.logoP,
                fit: BoxFit.cover,
              ),
            ),
            AppText(
              StringData.denonce,
              color: AppColor.blueBgColor,
              size: 25.0,
            ),
            // Flexible(child: Container(),flex: 1,),
          ],
        ),
      ),
    );
  }
}
