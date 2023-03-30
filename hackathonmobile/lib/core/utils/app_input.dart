import 'package:flutter/material.dart';
import 'package:hackathonmobile/core/constants/colors.dart';

class AppFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPass;
  final String hintText;
  final TextInputType textInputType;
  final bool multiLine;
  const AppFieldInput({
    Key? key,
    required this.textEditingController,
    this.isPass = false,
    required this.hintText,
    required this.textInputType, 
    this.multiLine=false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderSide: Divider.createBorderSide(context),
    );

    return Container(
      decoration: BoxDecoration(
        color: AppColor.greySkyColor, 
        borderRadius: BorderRadius.circular(10.0)
 ),
      child: TextField(
        controller: textEditingController,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: AppColor.greyBlackColor),
          border: OutlineInputBorder(
                  gapPadding: 10.0,
                  borderSide:  BorderSide(
                    color: AppColor.blueBgColor,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
          focusedBorder: inputBorder,
          enabledBorder: inputBorder,
          filled: true,
          contentPadding: const EdgeInsets.all(8),
        ), 
        keyboardType: textInputType, 
        obscureText: isPass,
      ),
    );
  }
}