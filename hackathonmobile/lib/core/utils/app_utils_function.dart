
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hackathonmobile/core/constants/colors.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';

import '../constants/string.dart';
import 'app_text.dart';

class UtilFunctions{


//Pick image
Future pickImage(ImageSource source) async {
  final image=await ImagePicker().pickImage(source: source);
  if (image != null) {
    return await image.readAsBytes();
  }
  print('No Image Selected');
}


//Shwo snackbar to user 
SnackBar customSnackBar({required String content}) {
  return SnackBar(
    backgroundColor: Colors.black,
    content: Text(
      content,
      style: const TextStyle(color: Colors.white, letterSpacing: 0.5),
    ),
  );
}


//Show Message dialogue
void showMessageDialog(BuildContext context,
    {String title = "", String subtitle = ""}) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: AppText(
            title,
            color: AppColor.blackColor,
            size: 18,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppText(
                subtitle,
                color: AppColor.backgroundColor,
                size: 16,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: (() => Navigator.of(context).pop()),
              child: AppText("OK", color:AppColor.blueBgColor),
            ),
          ],
        );
      });
} 

//Toast message
void toast(String msg) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 2,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 12.0);
}


//Format date
static String formateDate(DateTime date,
      {String format = ""}) {
        format = StringData.formatDateTime1;
    return DateFormat(format).format(date);
  }

  static String formatTimeOfDay(TimeOfDay tod) {
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
    final format = DateFormat.jm();
    DateTime date = DateFormat.jm().parse(format.format(dt));
    return DateFormat("HH:mm").format(date);
  }

  static String getDuration(DateTime date) {
    final Duration duration = DateTime.now().difference(date).abs();

    if (duration.inDays > 30 * 3) {
      return date.toIso8601String();
    } else if (duration.inDays >= 30) {
      return "il y a ${(duration.inDays / 30).toStringAsFixed(0)} mois";
    } else if (duration.inDays >= 1) {
      return "il y a ${duration.inDays} jours";
    } else if (duration.inHours >= 1) {
      return "il y a ${duration.inHours} heures";
    } else {
      return "il y a ${duration.inMinutes} minutes";
    }
  }


//Auto player 
}