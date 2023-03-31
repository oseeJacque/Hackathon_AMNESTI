import 'package:flutter/material.dart';
import 'package:hackathonmobile/core/constants/colors.dart';

class AppFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPass;
  final String hintText;
  final TextInputType textInputType;
  int minLine = 1;
  int maxLine = 1;
  String? Function(String?)? validator;

  AppFieldInput(
      {Key? key,
      required this.textEditingController,
      this.isPass = false,
      required this.hintText,
      required this.textInputType,
      this.validator,
      this.minLine = 1,
      this.maxLine = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderSide: Divider.createBorderSide(context),
    );

    return Container(
      decoration: BoxDecoration(
          color: AppColor.greySkyColor,
          borderRadius: BorderRadius.circular(10.0)),
      child: TextFormField(
        controller: textEditingController,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: AppColor.greyBlackColor),
          border: OutlineInputBorder(
            gapPadding: 10.0,
            borderSide: BorderSide(
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
        style: TextStyle(color: AppColor.blackColor),
        keyboardType: textInputType,
        obscureText: isPass,
        validator: validator,
        minLines: minLine,
        maxLines: maxLine,
      ),
    );
  }
}
