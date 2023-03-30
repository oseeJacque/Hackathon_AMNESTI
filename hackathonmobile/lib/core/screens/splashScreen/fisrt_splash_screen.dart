import 'package:flutter/material.dart';
import 'package:hackathonmobile/core/constants/colors.dart';
import 'package:hackathonmobile/core/screens/splashScreen/splashScreem2.dart';
import 'package:hackathonmobile/core/screens/splashScreen/splash_screen1.dart';
import 'package:hackathonmobile/core/screens/splashScreen/splash_screen3.dart';
import 'package:hackathonmobile/core/utils/app_text.dart';
import 'package:hackathonmobile/core/utils/dynamique_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../constants/string.dart';
import '../app_screens/home_page.dart';

class FirstSplashScreen extends StatefulWidget {
  const FirstSplashScreen({super.key});

  @override
  State<FirstSplashScreen> createState() => _FirstSplashScreenState();
}

class _FirstSplashScreenState extends State<FirstSplashScreen> {
  final _pageController = PageController();
  int page = 0;
  final List<Widget> _listpage = [
    const SplashScreen1(),
    const SplashScreen2(),
    const SplashScreen3(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: AppColor.backgroundColor,
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: height * .8,
                child: PageView(
                  controller: _pageController,
                  children: _listpage,
                  onPageChanged: (value) {
                    pageChange(value);
                  },
                ),
              ),

              //Page Indicator
              SmoothPageIndicator(
                controller: _pageController,
                count: 3,
                axisDirection: Axis.horizontal,
                effect: SlideEffect(
                    spacing: 8.0,
                    radius: 50.0,
                    dotWidth: 24.0,
                    dotHeight: 16.0,
                    paintStyle: PaintingStyle.stroke,
                    strokeWidth: 1.5,
                    dotColor: Colors.grey,
                    activeDotColor: AppColor.blueBgColor),
              ),
              SizedBox(
                height: height * .05,
              ),
              //Bouton Commencer
              DynamiqueButton(
                  childs: page == 0
                      ? Container(
                          alignment: Alignment.center,
                          child: AppText(
                            StringData.commencer,
                            color: AppColor.whiteColor,
                            size: 24.0,
                            weight: FontWeight.w700,
                          ))
                      : Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppText(
                              StringData.suivant,
                              color: AppColor.whiteColor,
                              size: 24.0,
                              weight: FontWeight.w700,
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: AppColor.whiteColor,
                            )
                          ],
                        ),
                  width: width * .5,
                  height: height * .06,
                  action: () {
                    page == 0
                        ? pageChange(1)
                        : (page == 1)
                            ? pageChange(2)
                            : Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const MyHomePage()));
                  },
                  bgColor: AppColor.blueBgColor,
                  radius: 15.0),

              SizedBox(
                height: height * .05,
              ),
            ],
          ),
        ));
    ;
  }

  void pageChange(value) {
    _pageController.jumpToPage(value);
    setState(() {
      page = value;
    });
  }
}
