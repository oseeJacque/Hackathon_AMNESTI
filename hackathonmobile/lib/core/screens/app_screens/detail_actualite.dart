

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hackathonmobile/core/widgets/app_bar.dart';

import '../../constants/colors.dart';
import '../../utils/app_text.dart';

class ActuailiteDetail extends StatelessWidget {
  final Map<String,String> data;
  const ActuailiteDetail({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: MyAppBar(), 
      body: SingleChildScrollView(
        child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 20.0),
                  width: double.infinity,
                  height: height,
                  decoration:  BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: AppColor.backgroundColor,
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 1.0,
                        blurRadius:10.0, 
                        offset: const Offset(0, 0), 
                        color: AppColor.greyColor
                      )
                    ]
                  ),
                  child: Column(
                    children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0), 
                            color: AppColor.greyColor
                          ),
                          width: double.infinity,
                          height: height*.4,
                          child: Image.asset(data["image"]!,fit:BoxFit.fill,),
                        ), 
                      const SizedBox(height: 10.0,),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: AppText(data["date"]!,color: AppColor.blackColor,)),
                              const SizedBox(height: 25.0,), 
                              Align(
                                alignment: Alignment.centerLeft,
                                child: AppText(data["title"]!,color: AppColor.blackColor,weight: FontWeight.w700,size:20 ,)),
                              
      
                          ],
                        ),
                      )
      
                    ],
                  ), 

                ),
      ),
    );
  }
}