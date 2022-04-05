import 'package:flutter/material.dart';
import 'package:goad_express/utils/app_colors.dart';

class SelectDrive extends StatelessWidget {
  const SelectDrive(
      {Key? key,
      required this.image,
      required this.title,
      required this.subTitle,
      required this.time,
      required this.amount,
      required this.onTap})
      : super(key: key);

  final String image;
  final String title;
  final String subTitle;
  final String time;
  final String amount;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 210,
        height: 230,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: const BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.all(
            Radius.circular(
              23.0,
            ),
          ),
        ),
        child: Column(
          children: [
            Container(
              width: 210,
              height: 130,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: const BorderRadius.all(
                  Radius.circular(
                    23.0,
                  ),
                ),
                image: DecorationImage(
                    image: AssetImage(image), fit: BoxFit.contain),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 16,
                          color: AppColors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: Text(
                        subTitle,
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.grey2,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              padding: const EdgeInsets.all(4),
              margin: const EdgeInsets.only(
                left: 10,
                right: 10,
                bottom: 10,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      time,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.white,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Text(
                    amount,
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
