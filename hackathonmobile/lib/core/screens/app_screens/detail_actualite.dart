

import 'package:flutter/material.dart';
import 'package:hackathonmobile/core/utils/dynamique_button.dart';
import 'package:hackathonmobile/core/widgets/app_bar.dart';
import 'package:url_launcher/url_launcher.dart';

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
                  //height: height*2.5s,
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
                          height: height*.6,
                          child: Image.network(data["image"]!,
                                  fit: BoxFit.fill, loadingBuilder:
                                      (BuildContext context, Widget child,
                                          ImageChunkEvent? loadingProgress) {
                                if (loadingProgress == null) {
                                  return child;
                                }
                                return Center(
                                  child: CircularProgressIndicator(
                                    color: AppColor.blueBgColor,
                                    value: loadingProgress.expectedTotalBytes !=
                                            null
                                        ? loadingProgress
                                                .cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes!
                                        : null,
                                  ),
                                );
                              }),
                        ), 
                      const SizedBox(height: 10.0,),
                      Container(
                        margin: const EdgeInsets.only(bottom: 20.0),
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: AppText(data["date"]!,color: AppColor.blackColor,)),
                              const SizedBox(height: 25.0,), 
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(data["title"]!,style: TextStyle(color: AppColor.blackColor,fontWeight: FontWeight.w700,fontSize: 20.0))),
                                const SizedBox(height: 20.0,),
                              Text(data["description"]!,style: TextStyle(color: AppColor.blackColor,fontSize: 18.0),), 

                            const SizedBox(height: 30.0,),
                            //Lire la suite 
                            Align(
                              alignment: Alignment.center,
                              child: DynamiqueButton(
                                childs: AppText("Lire la suite",color: AppColor.backgroundColor,weight: FontWeight.w700,), 
                                width: width*.3, 
                                height: height*.1, 
                                action: (){
                                  _launchUrl(data["link"]!);
                                }, 
                                bgColor: AppColor.blueBgColor, 
                                radius: 10.0),
                            )
                          ],
                        ),
                      )
      
                    ],
                  ), 

                ),
      ),
    );
  }
  Future<void> _launchUrl(url) async {
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }}
}