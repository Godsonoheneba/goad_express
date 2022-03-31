import 'package:flutter/material.dart';
import 'package:goad_express/utils/app_colors.dart';
import 'package:goad_express/utils/app_texts.dart';
import 'package:goad_express/widgets/divider/divider.dart';

class ViewCanceledTrip extends StatefulWidget {
  const ViewCanceledTrip({Key? key}) : super(key: key);

  @override
  State<ViewCanceledTrip> createState() => _ViewCanceledTripState();
}

class _ViewCanceledTripState extends State<ViewCanceledTrip> {
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
                          AppTexts.tripCancel,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                  ],
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
                const SizedBox(
                  height: 50,
                ),
                const AppDivider8(),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
