import 'package:flutter/material.dart';
import 'package:hackathonmobile/core/constants/colors.dart';

import 'core/screens/splashScreen/welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor:AppColor.backgroundColor,
        ),
      home: const WelcommePage(),
    );
  }
}

