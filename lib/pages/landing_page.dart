import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goad_express/pages/rideshare/rideshare_homepage.dart';
import 'package:goad_express/utils/app_colors.dart';
import 'package:goad_express/utils/app_texts.dart';
import 'package:goad_express/utils/utilities.dart';
import 'package:goad_express/widgets/cards/landing_page_card.dart';
import 'package:goad_express/widgets/navigations/landing_page_drawer.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      // backgroundColor: AppColors.black,
      drawer: const AppDrawer(),
      appBar: AppBar(
        backgroundColor: AppColors.foodColor,
        leading: InkWell(
          onTap: () {
            _key.currentState?.openDrawer();
          },
          child: Container(
            margin: const EdgeInsets.all(7.0),
            decoration: const BoxDecoration(
              color: AppColors.white,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.menu,
              color: AppColors.black,
            ),
          ),
        ),
        title: Text(
          "Accra - East Legon".toUpperCase(),
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: AppColors.white,
            fontSize: 14,
          ),
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                "Good ${Utils.greeting()}, Dacosta",
                style: const TextStyle(
                  color: AppColors.foodColor,
                  fontSize: 30,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                AppTexts.whatDYWTDToday,
                style: TextStyle(
                  color: AppColors.foodColor,
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: LandingPageCard(
                            title: AppTexts.driveHText,
                            subTitle: AppTexts.moveArounTheCity,
                            color: AppColors.lightWhite2,
                            image: "assets/images/ride.png",
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(50),
                            ),
                            onTab: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return const RideShareHomePage();
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: LandingPageCard(
                            title: AppTexts.deliveryHText,
                            subTitle: AppTexts.getYGAYDstep,
                            color: AppColors.lightWhite2,
                            image: "assets/images/delivery.png",
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(50),
                            ),
                            onTab: () {},
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: LandingPageCard(
                            title: AppTexts.foodHText,
                            subTitle: AppTexts.getYDFoodWease,
                            color: AppColors.lightWhite2,
                            image: "assets/images/food.png",
                            onTab: () {},
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: LandingPageCard(
                            title: AppTexts.shopHText,
                            subTitle: AppTexts.buyFOTVendors,
                            color: AppColors.lightWhite2,
                            image: "assets/images/shop.png",
                            onTab: () {},
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: LandingPageCard(
                            title: AppTexts.getAHseHText,
                            subTitle: AppTexts.rentORBuyYDHouse,
                            color: AppColors.lightWhite2,
                            image: "assets/images/rent.png",
                            onTab: () {},
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: LandingPageCard(
                            title: AppTexts.helpHText,
                            subTitle: AppTexts.checkOOTutorial,
                            color: AppColors.lightWhite2,
                            image: "assets/images/help.png",
                            onTab: () {},
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
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
