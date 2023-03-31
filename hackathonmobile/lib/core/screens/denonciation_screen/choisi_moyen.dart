import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hackathonmobile/core/constants/assert.dart';
import 'package:hackathonmobile/core/constants/colors.dart';
import 'package:hackathonmobile/core/utils/app_text.dart';
import 'package:hackathonmobile/core/utils/app_utils_function.dart';
import 'package:hackathonmobile/core/widgets/app_bar.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../widgets/floating_bouton.dart';
import 'formulaire_denonciation.dart';
import 'note_vocal.dart';

class ChoisirMoyenPage extends StatelessWidget {
  const ChoisirMoyenPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: MyAppBar(
        back: true
      ),
      floatingActionButton:FloatingActionButtonWidget(
         rotate: true,
        action:(){
          
        }, 
        icon:AssetData.messageQuestionP,),

      //bottomNavigationBar: const BottomNavigationWidget(currentPage: 0,),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(
              horizontal: width * .03, vertical: height * .05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppText(
                "Choisir un moyen",
                color: AppColor.blueBgColor,
                size: 20,
                weight: FontWeight.w700,
              ),
              SizedBox(
                height: height * .1,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: AppText(
                    "Remplissez le formulaire si c'est possible, cela \n nous facilitera la tâche",
                    color: AppColor.blackColor,
                    size: 13.0,
                    weight: FontWeight.w700,
                  )),
              SizedBox(
                height: height * .05,
              ),

              //Note vocal
              optionsCase(
                action: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NoteVocalPage()));
                },
                text: "Note vocal",
                urlImage: AssetData.microphone2P,
              ),
              SizedBox(
                height: height * .05,
              ),

              //Appel
              optionsCase(
                action: () async {
                  //Navigator.push(context, MaterialPageRoute(builder: (context)=> const AppelVocalScreen ()));

                  String phoneNumber = '61024670';
                  final Uri url = Uri.parse('tel:$phoneNumber');

                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  } else {
                    toast(
                        'Impossible de lancer l\'appel pour ce numéro $phoneNumber');
                  }
                },
                text: "Appel",
                urlImage: AssetData.phonBigP,
              ),
              SizedBox(
                height: height * .05,
              ),

              //Formulaire
              optionsCase(
                action: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const FormulaireDenonciationScreen()));
                },
                text: "Formulaire",
                urlImage: AssetData.receipteditP,
              ),
              SizedBox(
                height: height * .05,
              ),

              //Contact  whatsapp
              optionsCase(
                action: () async {
                  String phoneNumber = '+22997028433';

                  var androidUrl =
                      "whatsapp://send?phone=$phoneNumber&text=Bonjour AMNESTI, besoin d'aide !";
                  var iosUrl =
                      "https://wa.me/$phoneNumber?text=${Uri.parse('Bonjour AMNESTI, besoin d\'aide !')}";

                  try {
                    if (Platform.isIOS) {
                      await launchUrl(Uri.parse(iosUrl));
                    } else {
                      await launchUrl(Uri.parse(androidUrl));
                    }
                  } on Exception {
                    toast('WhatsApp is not installed.');
                  }
                },
                text: "Contact whatsapp",
                urlImage: AssetData.whatsappP,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget optionsCase(
      {required String urlImage,
      required String text,
      required VoidCallback action,
      }) {
    return Column(
      children: [
        InkWell(
          onTap: action,
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
              urlImage,
              color: AppColor.blueBgColor,
            ),
          ),
        ),
        AppText(
          text,
          color: AppColor.blackColor,
          weight: FontWeight.w700,
        )
      ],
    );
  }
}
