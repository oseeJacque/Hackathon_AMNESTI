

import 'package:flutter/material.dart';
import 'package:hackathonmobile/core/utils/dynamique_button.dart';
import 'package:hackathonmobile/core/widgets/app_bar.dart';

import '../../constants/assert.dart';
import '../../constants/colors.dart';
import '../../utils/app_input.dart';
import '../../utils/app_text.dart';
import '../../widgets/floating_bouton.dart';

class FormulaireDenonciationScreen extends StatefulWidget {
  const FormulaireDenonciationScreen({super.key});

  @override
  State<FormulaireDenonciationScreen> createState() => _FormulaireDenonciationScreenState();
}

class _FormulaireDenonciationScreenState extends State<FormulaireDenonciationScreen> {
  TextEditingController _nameController=TextEditingController(); 
  TextEditingController _prenomsController=TextEditingController();
  TextEditingController _titleController=TextEditingController();
  TextEditingController _descriptionController=TextEditingController();

  String? typeDenonciateur;
  int page_instance=0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.width;
    return  Scaffold(
      appBar: MyAppBar(),
     floatingActionButton:FloatingActionButtonWidget(action:(){         
        }, 
        icon:AssetData.messageQuestionP,),

      //bottomNavigationBar: const BottomNavigationWidget(currentPage: 0,),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(vertical: height*.05,horizontal: width*.06),
            
          child: Column(
            children: [
              AppText("Dénoncer le fait",color: AppColor.blueBgColor,size: 20.0,weight: FontWeight.bold,), 
              SizedBox(height: height*.3,),
              Container(
                child: (page_instance==0)?
                forme1(): 
                (page_instance==1)?
                form2(): 
                (page_instance==2)?
                form3(): 
                (page_instance==3)?
                form4(): 
                form5(),
              ), 
              SizedBox(height: height*.1,), 
      
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //Précédent
                  DynamiqueButton(
                    hasShadow: true,
                    childs: AppText("Précedant",color: AppColor.blueBgColor,), 
                    width: width*.4, 
                    height: height*.1, 
                    action: (){
                      if(page_instance !=0){
                        setState(() {
                          page_instance=page_instance-1;
                        });
                      }
                    }, 
                    bgColor: AppColor.backgroundColor, 
                    radius: 10.0), 
      
                    //suivant
                  DynamiqueButton(
                    childs: AppText(!(page_instance==5)?"Suivant":"Soumettre",color: AppColor.backgroundColor,), 
                    width: width*.4, 
                    height: height*.1, 
                    action: (){
                      if(page_instance <=5){
                        setState(() {
                          page_instance=page_instance+1;
                        });
                      }
                    }, 
                    bgColor: AppColor.blueBgColor, 
                    radius: 10.0)
                ],
              )
                   
            ], 
          ),
        ),
      ),
    );
  }

  Widget forme1(){
    return   Column(

      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: AppText("Vous êtes victime ou \ndénonciateur?",color: AppColor.blackColor,weight: FontWeight.w400,size: 22,)), 
        const SizedBox(height: 20.0,),
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.only(left: 10.0),
          child: Column(
            children: [
              RadioListTile(
          contentPadding: const EdgeInsets.all(10.0),
                    activeColor: AppColor.blueBgColor,
                    selectedTileColor: AppColor.blueBgColor,
                    title: AppText("Victime",color: AppColor.blackColor,size: 20.0,weight: FontWeight.w500,),
                    value: "Victime", 
                    groupValue: typeDenonciateur, 
                    onChanged: (value){
                      setState(() {
                          typeDenonciateur = value.toString();
                      });
                      print(typeDenonciateur);
                    },
                ), 
      RadioListTile(
                    activeColor: AppColor.blueBgColor,
                    title: AppText("Dénonciateur",color: AppColor.blackColor,size: 20.0,weight: FontWeight.w500),
                    value: "Dénonciateur", 
                    groupValue: typeDenonciateur, 
                    onChanged: (value){
                      setState(() {
                          typeDenonciateur = value.toString();
                      });
                      print(typeDenonciateur);
                    },
                ),
            ],
          ),
        )
        
    ],);
  }

  Widget form2(){
    return Column(
      children: [
        typeDenonciateur=="Victime"? Align(
          alignment: Alignment.centerRight,
          child:AppText( 
            "Optionnelle",color: AppColor.blackColor,
          ),           
        ):Container(),
        const SizedBox(height:30.0 ,),
        AppText( 
          typeDenonciateur=="Victime"?"Informations de la victime":"Informations personnelle",color: AppColor.blackColor,weight: FontWeight.w400,size: 22,), 
          const SizedBox(height:30.0 ,),

        AppFieldInput(hintText: 'Entrer votre nom', 
        textEditingController: _nameController, 
        textInputType: TextInputType.text,), 
        const SizedBox(height:20.0 ,),

        AppFieldInput(hintText: 'Entrer votre prenom', 
        textEditingController: _prenomsController, 
        textInputType: TextInputType.text,), 

      ],
    ) ;
  } 



  Widget form3(){
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: AppText( 
            "Optionnelle",color: AppColor.blackColor,weight: FontWeight.w400,size: 15,),
        ), 
          const SizedBox(height:30.0 ,),
          AppText( 
            "Ajouter un audio",color: AppColor.blackColor,weight: FontWeight.w400,size: 22,),
          const SizedBox( 
            height: 25.0,
          ),
          InkWell(
          onTap: (){},
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColor.blueBgColor,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(
              AssetData.microphone2P,
              color: AppColor.blueBgColor,
            ),

            //Boutton de gestion audion 

          ),
        ),
        const SizedBox(height:15.0,),
        Image.asset(AssetData.progressionP), 
        const SizedBox(height: 15.0,),
       AppText("00:02",color: AppColor.blueBgColor,size: 30.0,weight: FontWeight.bold,), 
         
      ],
    );
  }

  Widget form4(){
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: AppText( 
            "Optionnelle",color: AppColor.blackColor,weight: FontWeight.w400,size: 15,),
        ),
        const SizedBox(height: 20.0,),
      AppText( 
            "Ajouter d'image ou de vidéo",color: AppColor.blackColor,weight: FontWeight.w400,size: 22,),

      const SizedBox(height: 30.0,),
      Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColor.blueBgColor,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(
              AssetData.cameraP,
              color: AppColor.blueBgColor,
            ),

          ),
          const SizedBox(height: 20.0,),
          Container(
            child: Image.asset(AssetData.personP),
          )
         
      ],
    );
  }

  Widget form5(){
    return Column(
      children: [

        AppText( 
            "Décriver les faits",color: AppColor.blackColor,weight: FontWeight.w400,size: 22,),
        const SizedBox(height: 20.0,), 
        AppFieldInput(textEditingController: _titleController, 
        hintText: "Entrer un titre", 
        textInputType: TextInputType.text), 
        const SizedBox(height: 20,),

        AppFieldInput(
          multiLine: true,
          textEditingController: _titleController, 
        hintText: "Description des faits", 
        textInputType: TextInputType.multiline),

        const SizedBox(height: 20,),

        AppFieldInput(
          multiLine: true,
          textEditingController: _titleController, 
        hintText: "Entrer un contact joignable", 
        textInputType: TextInputType.multiline),  



      ],
    );
  }
}