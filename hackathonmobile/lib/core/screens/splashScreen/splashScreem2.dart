import 'package:flutter/material.dart';

import '../../constants/assert.dart';
import '../../constants/colors.dart';
import '../../constants/string.dart';

class SplashScreen2 extends StatelessWidget {
  const SplashScreen2({super.key});

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
            Image.asset(
              AssetData.assuranceDroitP
                  ,
              width: width * .8,
            ),
            const SizedBox(
              height: 40.0,
            ),
            Text(StringData.faireValoirVosdroits,
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