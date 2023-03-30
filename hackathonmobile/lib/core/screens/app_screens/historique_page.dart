import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../utils/app_text.dart';

class HistoriquePage extends StatefulWidget {
  const HistoriquePage({super.key});

  @override
  State<HistoriquePage> createState() => _HistoriquePageState();
}

class _HistoriquePageState extends State<HistoriquePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: AppText("Je suis la page d'actualité",color: AppColor.blackColor,)),
    );
  }
}