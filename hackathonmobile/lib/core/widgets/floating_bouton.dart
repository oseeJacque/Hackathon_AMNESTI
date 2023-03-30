import 'dart:math';

import 'package:flutter/material.dart';

import '../constants/colors.dart';

class FloatingActionButtonWidget extends StatelessWidget {
  final String icon;
  final  action;
  const FloatingActionButtonWidget({super.key, required this.icon, required this.action});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: action,
      child: Container(
        width: 60.0,
        height: 60.0,
        padding: const EdgeInsets.all(10.0),
        decoration:  BoxDecoration(
          color: AppColor.whiteColor, 
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(
            color: AppColor.blueBgColor, 
            spreadRadius: 1.0,
            blurRadius: 5.0,
            offset: Offset(0, 0)
          )]
        ),
        child: Transform.rotate(
          angle: -pi/4,
          child: Image.asset(icon,color: AppColor.blueBgColor)),
      ));
  }
}