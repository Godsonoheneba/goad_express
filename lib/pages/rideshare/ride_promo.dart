import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:goad_express/utils/app_colors.dart';
import 'package:goad_express/utils/app_texts.dart';

class RidePromo extends StatefulWidget {
  RidePromo({Key? key}) : super(key: key);

  @override
  State<RidePromo> createState() => _RidePromoState();
}

class _RidePromoState extends State<RidePromo> {
  TextEditingController promoCodeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.primaryColor,
        shadowColor: AppColors.white,
        elevation: 1,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.all(25),
            child: const Text(
              AppTexts.enterPromo,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            width: double.infinity,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.grey4,
            ),
            child: TextField(
              controller: promoCodeController,
              style: const TextStyle(
                fontFamily: "Roboto",
                fontSize: 16,
              ),
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 25,
                ),
                hintText: "Promo code",
                hintStyle: TextStyle(
                  fontSize: 20,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: const Text(
              AppTexts.enterPromoDesc,
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              if (promoCodeController.text.isNotEmpty) {
                if (promoCodeController.text == '123456') {
                  CoolAlert.show(
                    context: context,
                    type: CoolAlertType.success,
                    text: AppTexts.successForCode,
                    barrierDismissible: false,
                    backgroundColor: AppColors.primaryColor,
                    animType: CoolAlertAnimType.slideInDown,
                  );

                  setState(() {
                    promoCodeController.text = '';
                  });
                } else {
                  CoolAlert.show(
                    context: context,
                    type: CoolAlertType.error,
                    text: AppTexts.invalidCode,
                    barrierDismissible: false,
                    backgroundColor: AppColors.primaryColor,
                    animType: CoolAlertAnimType.slideInUp,
                  );
                }
              } else {
                CoolAlert.show(
                  context: context,
                  type: CoolAlertType.error,
                  text: AppTexts.allFieldMustBeFill,
                  barrierDismissible: false,
                  backgroundColor: AppColors.primaryColor,
                  animType: CoolAlertAnimType.slideInUp,
                );
              }
            },
            child: Container(
              margin: const EdgeInsets.all(20),
              // padding: EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColors.primaryColor,
              ),
              child: const Center(
                child: Text(
                  AppTexts.apply,
                  style: TextStyle(
                    fontSize: 20,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
