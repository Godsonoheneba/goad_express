import 'package:flutter/material.dart';
import 'package:goad_express/utils/app_colors.dart';

class AppDivider8 extends StatelessWidget {
  const AppDivider8({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: AppColors.lightWhite,
      thickness: 8,
    );
  }
}

class AppDivider1 extends StatelessWidget {
  const AppDivider1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: AppColors.lightWhite,
      thickness: 1,
    );
  }
}
