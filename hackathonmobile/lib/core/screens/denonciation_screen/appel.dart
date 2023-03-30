

import 'package:flutter/material.dart';
import 'package:hackathonmobile/core/constants/assert.dart';
import 'package:hackathonmobile/core/utils/app_text.dart';
import 'package:hackathonmobile/core/utils/dynamique_button.dart';
import 'package:hackathonmobile/core/widgets/app_bar.dart';

import '../../constants/colors.dart';
import '../../widgets/floating_bouton.dart';

class AppelVocalScreen extends StatefulWidget {
  const AppelVocalScreen({super.key});

  @override
  State<AppelVocalScreen> createState() => _AppelVocalScreenState();
}

class _AppelVocalScreenState extends State<AppelVocalScreen> {
  
  @override
  Widget build(BuildContext context) {
  

    @override 
    void initState(){
      super.initState(); 
    }

    @override 
    void dispose(){
      super.dispose(); 
     
    }
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: MyAppBar(),
     floatingActionButton:FloatingActionButtonWidget(action:(){         
        }, 
        icon:AssetData.messageQuestionP,),

      //bottomNavigationBar: const BottomNavigationWidget(currentPage: 0,),
      
        body: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(vertical: height*.05,horizontal: width*.03),
          child: Column(
            children: [
              AppText("Appel",color: AppColor.blueBgColor,size: 20.0,weight: FontWeight.bold,), 
              SizedBox(height: height*.3,), 
              InkWell(
          onTap: (){},
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColor.blueBgColor,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(
              AssetData.phonBigP,
              color: AppColor.blueBgColor,
            ),

            //Boutton de gestion audion 

          ),
        ),
        
        SizedBox(height: height*.1,),

       AppText("00:02",color: AppColor.blueBgColor,size: 30.0,weight: FontWeight.bold,), 
        SizedBox(height: height*.1,),
       
        //Dénoncer button
        DynamiqueButton(
          childs: const AppText("Dénoncer",size: 20.0,weight: FontWeight.w700,), 
          width: width*.45, 
          height: height*.15, 
          action: (){}, 
          bgColor: AppColor.blueBgColor, 
          radius: 10.0)
            ],
          ),
        ),
    );
  }
}