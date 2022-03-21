import 'package:flutter/material.dart';
import 'package:goad_express/utils/app_colors.dart';

class RideShareHomePage extends StatefulWidget {
  const RideShareHomePage({Key? key}) : super(key: key);

  @override
  State<RideShareHomePage> createState() => _RideShareHomePageState();
}

class _RideShareHomePageState extends State<RideShareHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: AppColors.primaryColor,
        ),
      ),

      body: Stack(
        children: [
          
        ],
      ),
    );
  }
}
