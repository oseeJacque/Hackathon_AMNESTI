import 'package:flutter/material.dart';
import 'package:hackathonmobile/core/constants/colors.dart';
import 'package:hackathonmobile/core/utils/app_text.dart';

class ActualitePage extends StatefulWidget {
  const ActualitePage({super.key});

  @override
  State<ActualitePage> createState() => _ActualitePageState();
}

class _ActualitePageState extends State<ActualitePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: AppText("Je suis la page d'actualité",color: AppColor.blackColor,)),
    );
  }
}