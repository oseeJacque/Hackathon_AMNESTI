import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

import '../constants/assert.dart';
import '../constants/colors.dart';
import '../screens/app_screens/notification.dart';
import '../utils/app_text.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  
  MyAppBar(
      {super.key,
      });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return  AppBar(
        leading:
            Container(
              margin: const EdgeInsets.only(left: 15.0),
              child: IconButton(onPressed: () {}, icon: Image.asset(AssetData.logoP,fit: BoxFit.cover,))),
        elevation: 0.0,
        backgroundColor: AppColor.backgroundColor,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 15.0),
            child: badges.Badge(
                position: badges.BadgePosition.topEnd(top: -10, end: -12),
                showBadge: true,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const NotificationWidget()));
                },
                badgeStyle: badges.BadgeStyle(
                  shape: badges.BadgeShape.square,
                  badgeColor: AppColor.blueBgColor,
                  padding: const EdgeInsets.all(8),
                  borderRadius: BorderRadius.circular(50),
                  borderSide: const BorderSide(color: Colors.white, width: 2),
                ),
                badgeContent: const AppText("2"),
                child: Image.asset(AssetData.notificationIconP)),
          )
        ],
      );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
