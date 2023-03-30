


import 'package:flutter/material.dart';

import 'package:google_nav_bar/google_nav_bar.dart';

import '../constants/colors.dart';
import '../screens/app_screens/acceuil_page.dart';
import '../screens/app_screens/actualite_page.dart';
import '../screens/app_screens/denonciation_page.dart';
import '../screens/app_screens/historique_page.dart';


class BottomNavigationWidget extends StatefulWidget {
  final int currentPage;
  const BottomNavigationWidget({super.key, required this.currentPage});

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  final  List<Widget> _pageViewList=[
    const DenonciationPage(), 
    const AcceuilPage(),
    const ActualitePage(),
    const HistoriquePage()
  ];
  final pageController=PageController();
  @override 
  void initState(){
    super.initState();
    setState(() {
      pageController.jumpToPage(widget.currentPage);
    });
  }
  @override
  Widget build(BuildContext context) {
    return  GNav(
        onTabChange:(value){
          pageChange(value);
        },
        backgroundColor: AppColor.greySkyColor,
        padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 15.0),
        activeColor: AppColor.blueBgColor,
        tabBackgroundColor: AppColor.backgroundColor,
        color: AppColor.blackColor,
        
        gap: 10,
        tabs: [
          GButton(icon: Icons.mic,text: "Denoncer",onPressed:(ValueKey){
              
          },),
          GButton(icon: Icons.home_outlined,text: "Acceuil",),
          GButton(icon: Icons.newspaper,text: "Actualité"),
          GButton(icon: Icons.multiline_chart,text:"Historique"),
        ],
      );
  }
  void pageChange(value){
    pageController.jumpToPage(value);
  }
}