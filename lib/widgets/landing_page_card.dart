import 'package:flutter/material.dart';
import 'package:goad_express/utils/app_colors.dart';

class LandingPageCard extends StatelessWidget {
  const LandingPageCard(
      {Key? key,
      required this.color,
      required this.title,
      required this.subTitle,
      required this.image,
      this.borderRadius})
      : super(key: key);

  final BorderRadius? borderRadius;
  final Color color;
  final String image;
  final String subTitle;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: borderRadius,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(
                image,
              ),
            ),
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              color: AppColors.foodColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            subTitle,
            style: const TextStyle(
              fontSize: 11,
              color: AppColors.foodColor,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
