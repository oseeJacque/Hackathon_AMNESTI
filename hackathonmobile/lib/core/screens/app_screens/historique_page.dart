import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/string.dart';
import '../../utils/app_input.dart';
import '../../utils/app_text.dart';
import '../../utils/dynamique_button.dart';
import 'notification.dart';

class HistoriquePage extends StatefulWidget {
  const HistoriquePage({super.key});

  @override
  State<HistoriquePage> createState() => _HistoriquePageState();
}

class _HistoriquePageState extends State<HistoriquePage> {
  TextEditingController _passwordController = TextEditingController();
  bool numberAvailable = false;
  String number = '';

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return NotificationWidget();
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
                    hintText: "Mot de passe",
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