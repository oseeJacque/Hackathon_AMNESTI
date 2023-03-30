

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hackathonmobile/core/constants/assert.dart';
import 'package:hackathonmobile/core/utils/app_input.dart';
import 'package:hackathonmobile/core/utils/dynamique_button.dart';

import '../../constants/colors.dart';
import '../../constants/string.dart';
import '../../utils/app_text.dart';
import '../../widgets/app_bar.dart';
import '../../widgets/floating_bouton.dart';
import '../denonciation_screen/choisi_moyen.dart';

class DenonciationPage extends StatefulWidget {
  const DenonciationPage({super.key});

  @override
  State<DenonciationPage> createState() => _DenonciationPageState();
}

class _DenonciationPageState extends State<DenonciationPage> {
  TextEditingController numController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar:MyAppBar(),
      floatingActionButton:FloatingActionButtonWidget(
        action:(){
          getUserPhoneNumber(context);
        }, 
        icon:AssetData.mediumMicroP,) , 
      body: Container(
        alignment: Alignment.center,
        child:Column(
          children: [
             SizedBox(height: height*.05,),
            AppText(StringData.denoncer,color: AppColor.blueBgColor,size: 20.0,weight: FontWeight.w700,), 
            SizedBox(height: height*.2,),
            AppText(StringData.denoncerViolation,color: AppColor.blackColor,size: 30.0,weight: FontWeight.w700,), 
            SizedBox(height: height*.2,),
            //Faire une denonciation
            GestureDetector(
              onDoubleTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (context)=>ChoisirMoyenPage()));
              },
              child: Container( 
                padding: const EdgeInsets.all(10.0),
                width: width*.65,
                height: height*.65,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(500),
                  color: AppColor.whiteColor, 
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.blueBgColor,
                      blurRadius: 20.0,
                      offset: const Offset(0, 0),
                      spreadRadius: 3.0,
                    )
                  ]
                ),
                child: Container(
                  padding: const EdgeInsets.all(30.0),
                  width: width*.55,
                height: height*.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(500),
                  color: AppColor.blueBgColor, 
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.blueBgColor,
                      blurRadius: 5.0,
                      offset: const Offset(0, 0),
                      spreadRadius: 1.0,
                    )
                  ]
                ),
                child: InkWell(
                  onTap: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>ChoisirMoyenPage()));

                  },
                  child: Image.asset(AssetData.microP)),
                ),
              ),
            )
          ],
        ) ),
    );
  }

  void getUserPhoneNumber(BuildContext context,
    ) {
  showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: AppColor.greyColor,
      builder: (context) {
        return AlertDialog(
          
          shadowColor: AppColor.blueBgColor,
          shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0)),
          backgroundColor: AppColor.backgroundColor,
          title: AppText(""
            ,
            color: AppColor.blackColor,
            size: 18,
          ),
          
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppText(
                StringData.numeroTelephone,
                color: AppColor.blackColor,
                size: 25,
                weight:FontWeight.w700 ,
                align: TextAlign.center,
              ),
              const SizedBox(height: 15.0,), 

              //Numero de telephone
              AppFieldInput(  
              hintText: StringData.entrerNumero, 
              textEditingController: numController, 
              textInputType: TextInputType.number, 
              )
            ],
          ),
          actions: [
            DynamiqueButton(
      
              childs: AppText(StringData.valider,weight: FontWeight.w700,size: 18.0,), width: 100, height: 45, action: (){
                Navigator.pop(context);
              }, bgColor: AppColor.blueBgColor, radius: 10)
          ],
        );
      });
}
}