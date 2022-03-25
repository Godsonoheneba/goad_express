import 'package:flutter/material.dart';
import 'package:goad_express/utils/app_colors.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: AppColors.lightWhite,
      thickness: 8,
    );
  }
}
