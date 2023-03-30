import 'package:flutter/material.dart';
import 'package:hackathonmobile/core/utils/dynamique_button.dart';

import '../../constants/assert.dart';
import '../../constants/colors.dart';
import '../../constants/string.dart';
import '../../utils/app_text.dart';
import '../../widgets/app_bar.dart';
import '../../widgets/floating_bouton.dart';

class AcceuilPage extends StatefulWidget {
  const AcceuilPage({super.key});

  @override
  State<AcceuilPage> createState() => _AcceuilPageState();
}

class _AcceuilPageState extends State<AcceuilPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: MyAppBar(),
      floatingActionButton:FloatingActionButtonWidget(
        action:(){
        }, 
        icon:AssetData.messageQuestionP,),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(
              horizontal: width * .03, vertical: height * .05),
          child: Column(
            children: [
              //Hearder of page
              Container(
                padding: EdgeInsets.symmetric(
                    vertical: height * .03, horizontal: 15.0),
                height: height * .6,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColor.backgroundColor,
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 2.0,
                          spreadRadius: 1.0,
                          offset: const Offset(0, 0),
                          color: AppColor.greyColor)
                    ]),
                child: Column(children: [
                  RichText(
                      text: TextSpan(
                          style: TextStyle(
                              color: AppColor.blackColor,
                              fontSize: 25.20,
                              fontWeight: FontWeight.w700),
                          children: [
                        TextSpan(
                          text: StringData.bienvenu,
                        ),
                        TextSpan(
                            text: " ${StringData.appName}",
                            style: TextStyle(color: AppColor.blueBgColor))
                      ])),
                  SizedBox(
                    height: height * .05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RichText(
                          text: TextSpan(
                              style: TextStyle(
                                  color: AppColor.blackColor,
                                  fontSize: 15.20,
                                  fontWeight: FontWeight.w700),
                              children: [
                            TextSpan(
                              text: StringData.textDenoncer,
                            ),
                            TextSpan(
                                text: " ${StringData.surCe}",
                                style: TextStyle(color: AppColor.blueBgColor))
                          ])),
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: AppColor.blueBgColor,
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: 2.0,
                                  blurRadius: 1.0,
                                  offset: const Offset(0, 0),
                                  color: AppColor.greyColor)
                            ]),
                        alignment: Alignment.center,
                        height: height * .3,
                        width: width * .3,
                        child: Image.asset(
                          AssetData.microP,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset(AssetData.infocircleP),
                      AppText(
                        StringData.infos,
                        color: AppColor.blackColor,
                      )
                    ],
                  )
                ]),
              ),
              Image.asset(
                AssetData.bigmicroP,
                height: height * .6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _textCotainer(text: "liberté d'expression"),
                  _textCotainer(text: "Violence policière")
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _textCotainer(text: "Viole"),
                  _textCotainer(text: "Discrimination"),
                  _textCotainer(text: "torture")
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _textCotainer(text: "détention"),
                  _textCotainer(text: "Emprisonement"),
                  _textCotainer(text: "...")
                ],
              ),
              SizedBox(
                height: height * .05,
              ),

              // Participer à une pétition
              Align(
                alignment: Alignment.centerLeft,
                child: DynamiqueButton(
                    childs: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AppText(
                          "Signer une pétition",
                          color: AppColor.backgroundColor,
                          weight: FontWeight.bold,
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: AppColor.backgroundColor,
                        )
                      ],
                    ),
                    width: width * .6,
                    height: height * .12,
                    action: () {},
                    bgColor: AppColor.blueBgColor,
                    radius: 10.0),
              ), 
            SizedBox(
                height: height * .1,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _textCotainer({required String text}) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: AppColor.backgroundColor,
          boxShadow: [
            BoxShadow(
                color: AppColor.greyColor,
                blurRadius: 2.0,
                spreadRadius: 1.0,
                offset: const Offset(0, 0))
          ]),
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      alignment: Alignment.center,
      child: AppText(
        text,
        color: AppColor.blackColor,
      ),
    );
  }
}
