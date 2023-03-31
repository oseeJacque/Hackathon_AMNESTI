import 'package:flutter/material.dart';
import 'package:hackathonmobile/core/utils/app_text.dart';
import 'package:hackathonmobile/core/widgets/app_bar.dart';

import '../../constants/colors.dart';
import '../../constants/string.dart';
import '../../utils/app_input.dart';
import '../../utils/app_utils_function.dart';
import '../../utils/dynamique_button.dart';

class NotificationWidget extends StatefulWidget {
  final bool showDialogue;
  const NotificationWidget({super.key, this.showDialogue=true});

  @override
  State<NotificationWidget> createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<NotificationWidget> {

 TextEditingController _passwordController = TextEditingController();
  bool numberAvailable = false;
  String number = '';

  final _formKey = GlobalKey<FormState>();

@override 
void initState(){
  setState(() {
    super.initState();
  });
}
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.width;
    return  Scaffold(
      appBar: MyAppBar(),
      body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: width * .05),
            child: Column(
              children: [
                AppText(
                  "Notifications",
                  color: AppColor.blueBgColor,
                  weight: FontWeight.bold,
                  size: 22,
                ),
                SizedBox(
                  height: height * .1,
                ),
                InkWell(
                    onTap: () {
                      UtilFunctions.showMessageDialog(context,
                          title: "Contenu Notification",
                          subtitle:
                              'Votre dénonciation qui a pour titre “L’UE doit reconnaître la réalité du crime d’apartheid en Israël “ est en cours de traitement .');
                    },
                    child: notificationTemplate(
                        text: 'Dénonciation en attente', typeNotif: 1)),
                const SizedBox(
                  height: 20.0,
                ),
                InkWell(
                    onTap: () {
                      UtilFunctions.showMessageDialog(context,
                          title: "Contenu Notification",
                          subtitle:
                              'Votre dénonciation qui a pour titre “L’UE doit reconnaître la réalité du crime d’apartheid en Israël “ est en cours de traitement .');
                    },
                    child: notificationTemplate(
                        text: 'Dénonciation en attente', typeNotif: 2)),
                const SizedBox(
                  height: 20.0,
                ),
                InkWell(
                    onTap: () {
                      UtilFunctions.showMessageDialog(context,
                          title: "Contenu Notification",
                          subtitle:
                              'Votre dénonciation qui a pour titre “L’UE doit reconnaître la réalité du crime d’apartheid en Israël “ est en cours de traitement .');
                    },
                    child: notificationTemplate(
                        text: 'Dénonciation en attente', typeNotif: 3))
              ],
            ),
          ),
        ),
    )
    ;
  }

  Widget notificationTemplate({required int typeNotif, required String text}) {
    return Container(
      height: 50.0,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: typeNotif == 1
              ? AppColor.backgroundColor
              : typeNotif == 2
                  ? AppColor.redColor
                  : Colors.green,
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(color: AppColor.greyColor)),
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: AppText(
        text,
        color: typeNotif == 1 ? AppColor.blackColor : AppColor.whiteColor,
      ),
    );
  }

 getUserPassword(
    BuildContext context,
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
            title: AppText(
              "",
              color: AppColor.blackColor,
              size: 18,
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppText(
                  "Mot de pass de connexion",
                  color: AppColor.blackColor,
                  size: 25,
                  weight: FontWeight.w700,
                  align: TextAlign.center,
                ),
                const SizedBox(
                  height: 15.0,
                ),

                //Numero de telephone
                Form(
                  key: _formKey,
                  child: AppFieldInput(
                    hintText: StringData.entrerNumero,
                    textEditingController: _passwordController,
                    textInputType: TextInputType.number,
                    validator: (p0) {
                      /*if (p0 != '' && phoneRegex.hasMatch(p0 ?? '')) {
                        return null;
                      } else {
                        return 'Format +229 60000009 ou 60000009';
                      }*/
                    },
                  ),
                )
              ],
            ),
            actions: [
              DynamiqueButton(
                  childs: AppText(
                    StringData.valider,
                    weight: FontWeight.w700,
                    size: 18.0,
                  ),
                  width: 100,
                  height: 45,
                  action: () async {
                    /*if (_formKey.currentState!.validate()) {
                      number = numController.text;
                      await HelperPreferences.saveStringValue(
                          'NUMBER', numController.text);

                      Navigator.pop(context);

                      navigateToNextPageWithTransition(
                          context, const ChoisirMoyenPage());
                    } else {
                      logd("Nooooooooo");
                    }*/
                  },
                  bgColor: AppColor.blueBgColor,
                  radius: 10)
            ],
          );
        });
  }
}
