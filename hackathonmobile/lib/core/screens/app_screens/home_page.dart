import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hackathonmobile/core/constants/colors.dart';
import 'package:hackathonmobile/core/screens/app_screens/acceuil_page.dart';
import 'package:hackathonmobile/core/screens/app_screens/actualite_page.dart';
import 'package:hackathonmobile/core/screens/app_screens/historique_page.dart';
import 'package:hackathonmobile/core/utils/app_text.dart';
import 'package:hackathonmobile/core/widgets/app_bar.dart';

import '../../constants/assert.dart';
import 'package:badges/badges.dart' as badges;

import 'denonciation_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 final  List<Widget> _pageViewList=[
    const DenonciationPage(), 
    const AcceuilPage(),
    const ActualitePage(),
    const HistoriquePage()
  ];
  final pageController=PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      bottomNavigationBar: GNav(
        onTabChange: pageChange,
        backgroundColor: AppColor.greySkyColor,
        padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 15.0),
        activeColor: AppColor.blueBgColor,
        tabBackgroundColor: AppColor.backgroundColor,
        color: AppColor.blackColor,
        
        gap: 10,
        tabs: const[
          GButton(icon: Icons.mic,text: "Denoncer",),
          GButton(icon: Icons.home_outlined,text: "Acceuil",),
          GButton(icon: Icons.newspaper,text: "Actualité"),
          GButton(icon: Icons.multiline_chart,text:"Historique"),
        ],
      ),

      body: PageView(
        controller: pageController,
        children: _pageViewList,
      ),
    );
  }

  void pageChange(value){
    pageController.jumpToPage(value);
  }
}
