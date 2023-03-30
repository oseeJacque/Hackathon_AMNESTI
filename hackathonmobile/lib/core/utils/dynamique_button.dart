import 'package:flutter/material.dart';

import '../constants/colors.dart';

class DynamiqueButton extends StatelessWidget {
  final Widget childs;
  final double width;
  final double height;
  final VoidCallback action;
  final Color bgColor;
  final double radius;
  final bool hasShadow;

  const DynamiqueButton(
      {super.key,
      required this.childs,
      required this.width,
      required this.height,
      required this.action,
      required this.bgColor,
      required this.radius,
      this.hasShadow = false});

  @override
  Widget build(BuildContext) {
    return InkWell(
      onTap: action,
      child: Container(
        alignment: Alignment.center,
        width: width,
        height: height,
        decoration: BoxDecoration(
            boxShadow: hasShadow
                ? [
                    BoxShadow(
                        color: AppColor.greyBlackColor,
                        spreadRadius: 2.0,
                        offset: const Offset(0, 1),
                        blurRadius: 10.0)
                  ]
                : null,
            color: bgColor,
            borderRadius: BorderRadius.all(Radius.circular(radius))),
        child: childs,
      ),
    );
  }
}
