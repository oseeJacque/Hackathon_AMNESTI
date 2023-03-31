import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hackathonmobile/core/utils/app_text.dart';
import 'package:hackathonmobile/core/widgets/app_bar.dart';

import '../../constants/colors.dart';
import '../../utils/app_utils_function.dart';

class NotificationWidget extends StatefulWidget {
  const NotificationWidget({super.key});

  @override
  State<NotificationWidget> createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<NotificationWidget> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.width;
    return Scaffold(
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
    );
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
}
