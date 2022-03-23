import 'package:flutter/material.dart';
import 'package:goad_express/pages/landing_page.dart';
import 'package:goad_express/utils/app_colors.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Roboto",
        primarySwatch: Colors.blue,
        iconTheme: const IconThemeData(
          color: AppColors.primaryColor,
        ),
      ),
      home: const LandingPage(),
    );
  }
}
