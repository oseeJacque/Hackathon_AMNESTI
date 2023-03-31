// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:hackathonmobile/core/constants/assert.dart';
import 'package:hackathonmobile/core/utils/app_input.dart';
import 'package:hackathonmobile/core/utils/app_utils_function.dart';
import 'package:hackathonmobile/core/utils/dynamique_button.dart';
import 'package:hackathonmobile/core/utils/helper_preferences.dart';

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
  RegExp phoneRegex = RegExp(r'^(\+[0-9]{1,3}\s*)?[0-9]{8}$');

  TextEditingController numController = TextEditingController();
  bool numberAvailable = false;
  String number = '';

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    checkNumber();
    super.initState();
  }

  @override
  void dispose() {
    numController.dispose();
    super.dispose();
  }

  checkNumber() async {
    bool dispo = await HelperPreferences.checkKey('NUMBER');
    if (dispo) {
      number = await HelperPreferences.retrieveStringValue('NUMBER');
      numberAvailable = true;
      logd(number);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: MyAppBar(),
      floatingActionButton: FloatingActionButtonWidget(
        action: () {
          if (numberAvailable) {
            navigateToNextPageWithTransition(context, const ChoisirMoyenPage());
          } else {
            getUserPhoneNumber(context);
          }
        },
        icon: AssetData.mediumMicroP,
      ),
      body: SingleChildScrollView(
        child: Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                SizedBox(
                  height: height * .05,
                ),
                AppText(
                  StringData.denoncer,
                  color: AppColor.blueBgColor,
                  size: 20.0,
                  weight: FontWeight.w700,
                ),
                SizedBox(
                  height: height * .2,
                ),
                AppText(
                  StringData.denoncerViolation,
                  color: AppColor.blackColor,
                  size: 30.0,
                  weight: FontWeight.w700,
                ),
                SizedBox(
                  height: height * .2,
                ),
                //Faire une denonciation
                GestureDetector(
                  onDoubleTap: () {
                    if (numberAvailable) {
                      navigateToNextPageWithTransition(
                          context, const ChoisirMoyenPage());
                    } else {
                      getUserPhoneNumber(context);
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    width: width * .65,
                    height: height * .65,
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
                        ]),
                    child: Container(
                      padding: const EdgeInsets.all(30.0),
                      width: width * .55,
                      height: height * .5,
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
                          ]),
                      child: InkWell(
                          onTap: () {
                            if (numberAvailable) {
                              navigateToNextPageWithTransition(
                                  context, const ChoisirMoyenPage());
                            } else {
                              getUserPhoneNumber(context);
                            }
                          },
                          child: Image.asset(AssetData.microP)),
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }

  void getUserPhoneNumber(
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
                  StringData.numeroTelephone,
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
                    textEditingController: numController,
                    textInputType: TextInputType.number,
                    validator: (p0) {
                      if (p0 != '' && phoneRegex.hasMatch(p0 ?? '')) {
                        return null;
                      } else {
                        return 'Format +229 60000009 ou 60000009';
                      }
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
                    if (_formKey.currentState!.validate()) {
                      number = numController.text;
                      await HelperPreferences.saveStringValue(
                          'NUMBER', numController.text);

                      Navigator.pop(context);

                      navigateToNextPageWithTransition(
                          context, const ChoisirMoyenPage());
                    } else {
                      logd("Nooooooooo");
                    }
                  },
                  bgColor: AppColor.blueBgColor,
                  radius: 10)
            ],
          );
        });
  }
}
