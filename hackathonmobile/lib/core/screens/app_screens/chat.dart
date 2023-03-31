

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hackathonmobile/core/constants/assert.dart';
import 'package:hackathonmobile/core/constants/colors.dart';
import 'package:hackathonmobile/core/utils/app_input.dart';
import 'package:hackathonmobile/core/utils/app_text.dart';
import 'package:hackathonmobile/core/widgets/app_bar.dart';

class ChatScreenPage extends StatefulWidget {
  const ChatScreenPage({super.key});

  @override
  State<ChatScreenPage> createState() => _ChatScreenPageState();
}

class _ChatScreenPageState extends State<ChatScreenPage> {
  TextEditingController _messageController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: MyAppBar(),
      floatingActionButton: Container(
        margin: EdgeInsets.symmetric(horizontal: width*.04),
        width: double.infinity,
        height: height*.15,
        child: Row(
          children: [
            Container(
              margin:EdgeInsets.only(left: 25.0),
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: AppColor.blueBgColor, 
                borderRadius: BorderRadius.circular(50.0)
              ),
              alignment: Alignment.center,
              child: IconButton(onPressed: (){}, icon: Image.asset(AssetData.microphone2P,color: AppColor.backgroundColor,fit: BoxFit.cover,))),
              SizedBox(width: 10.0,),
            Expanded(child: AppFieldInput(textEditingController: _messageController, hintText: "message", textInputType: TextInputType.text)), 

          ],
        ),
      ),

      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(
              horizontal: width * .05, vertical: height * .05),
          child: Column(
            children: [
              Align( 
                alignment: Alignment.center,
                child: AppText("Conseils",color: AppColor.blueBgColor,size: 22.0,weight: FontWeight.w700,)), 
                const SizedBox(height: 20.0,), 
                Container(
                  alignment: Alignment.bottomCenter,
                  height: height*2,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(15.0),topRight: Radius.circular(15.0)), 
                    color: AppColor.greySkyColor, 
                    
                  ),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: height*.05),
                          width: width*.7,
                          decoration:  BoxDecoration(
                            border: Border.all(color: AppColor.greyColor), 
                            borderRadius: BorderRadius.circular(20.0),
                            color: AppColor.backgroundColor
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
                          child:  Text("Bienvenue dans la discussion,nous sommes disponible pour toutes vos préoccupatios.",style: TextStyle(color: AppColor.blackColor,fontSize: 15.0),textAlign: TextAlign.center,),
                        )
                      ],
                    ),
                  ),
                )


            ],
          ),
        ),
      ),
    );
  }
}