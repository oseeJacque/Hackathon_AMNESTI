import 'package:flutter/material.dart';

import '../../constants/assert.dart';
import '../../constants/colors.dart';
import '../../constants/string.dart';

class SplashScreen1 extends StatelessWidget {
  const SplashScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return  Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ///SizedBox(height: height*.05,),
            Image.asset(
              AssetData.denoncerImageP
                  ,
              width: width * .8,
            ),
            const SizedBox(
              height: 40.0,
            ),
            Text(StringData.denoncerInjustice,
                style: TextStyle(
                    color: AppColor.blackColor,
                    fontSize: 32.0,
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.center),
          ],
        ),
      ),
    );;
  }
}