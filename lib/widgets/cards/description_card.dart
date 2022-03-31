import 'package:flutter/material.dart';
import 'package:goad_express/utils/app_colors.dart';

class DescriptionCard extends StatelessWidget {
  const DescriptionCard(
      {Key? key,
      required this.title,
      required this.subTitle,
      required this.backColor})
      : super(key: key);
  final String title;
  final String subTitle;
  final Color backColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 20,
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        color: backColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            spreadRadius: 0,
            blurRadius: 20,
            color: AppColors.black.withOpacity(0.25),
            offset: const Offset(0.0, 0.0),
          )
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 17,
                  color: AppColors.white,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 7,
          ),
          Row(
            children: [
              Text(
                subTitle,
                style: const TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 14,
                  color: AppColors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
