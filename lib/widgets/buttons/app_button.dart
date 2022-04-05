import 'package:flutter/material.dart';
import 'package:goad_express/utils/app_colors.dart';

class AppButton extends StatelessWidget {
  const AppButton(
      {Key? key,
      required this.title,
      required this.onTap,
      required this.backgroudColor,
      required this.textColor,
      required this.borderColor,
      required this.widthSize})
      : super(key: key);
  // final String image;
  final String title;
  final Color backgroudColor;
  final Color borderColor;
  final Color textColor;
  final double widthSize;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    // MediaQueryData queryData;
    // queryData = MediaQuery.of(context);

    var theHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            width: widthSize,
            // queryData.
            height: 56,
            decoration: BoxDecoration(
              color: backgroudColor,
              borderRadius: BorderRadius.circular(7),
              border: Border.all(
                color: borderColor,
              ),
              boxShadow: [
                BoxShadow(
                  spreadRadius: 0,
                  blurRadius: 5,
                  color: AppColors.black.withOpacity(0.25),
                  offset: const Offset(0.0, 0.0),
                )
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Image.asset("assets/icons/$image"),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Text(
                    title,
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 16,
                      color: textColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
