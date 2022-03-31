import 'package:flutter/material.dart';
import 'package:goad_express/utils/app_colors.dart';
import 'package:goad_express/utils/app_texts.dart';
import 'package:goad_express/widgets/divider/divider.dart';

class ViewTripHistory extends StatefulWidget {
  const ViewTripHistory({Key? key}) : super(key: key);

  @override
  State<ViewTripHistory> createState() => _ViewTripHistoryState();
}

class _ViewTripHistoryState extends State<ViewTripHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.primaryColor,
        shadowColor: AppColors.white,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(25),
                        child: const Text(
                          AppTexts.tripWith + ' Nana Addo',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: AppColors.whiteF1,
                      ),
                      margin: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Image.asset(
                        "assets/images/driver.png",
                        // width: 100,
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    children: const [
                      Expanded(
                        child: Text(
                          '0548157455',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Text(
                        '6,690 trips',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  decoration: BoxDecoration(
                    // color: AppColors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return Row(
                            children: [
                              Image.asset("assets/icons/yourlocation.png"),
                              const SizedBox(
                                width: 20,
                              ),
                              const Expanded(
                                child: Text(
                                  "Agogba",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              const Text(
                                "07:45 am",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            ],
                          );
                        } else {
                          return Row(
                            children: [
                              Image.asset("assets/icons/LocationMarker.png"),
                              const SizedBox(
                                width: 20,
                              ),
                              const Expanded(
                                child: Text(
                                  "VIP Bus Terminal - Accra",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              const Text(
                                "12:45pm",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            ],
                          );
                        }
                      },
                      separatorBuilder: (context, index) {
                        return Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  ...List.generate(
                                    5,
                                    (index) {
                                      return Container(
                                        margin: const EdgeInsets.only(
                                          left: 12,
                                          top: 1,
                                          bottom: 1,
                                        ),
                                        width: 2,
                                        height: 4,
                                        decoration: const BoxDecoration(
                                            color: Color(0xFF6B7280)),
                                      );
                                    },
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 32,
                              ),
                            ],
                          ),
                        );
                      },
                      itemCount: 2),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 100),
                  width: double.infinity,
                  height: 55,
                  decoration: const BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      AppTexts.viewChat,
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                const AppDivider8(),
                const SizedBox(
                  height: 50,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(
                        20,
                      ),
                      child: const Text(
                        AppTexts.payment,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            child: const Text(
                              AppTexts.fare,
                              style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        const Text(
                          "GHC 17.00",
                          style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const AppDivider1(),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            child: const Text(
                              AppTexts.cash,
                              style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        const Text(
                          "GHC 17.00",
                          style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const AppDivider1(),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
