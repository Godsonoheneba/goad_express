import 'package:flutter/material.dart';
import 'package:goad_express/utils/app_colors.dart';
import 'package:goad_express/widgets/divider/divider.dart';

class TripHistoryList extends StatelessWidget {
  const TripHistoryList(
      {Key? key,
      // required this.image,
      required this.location,
      required this.amount,
      required this.date,
      required this.cancel,
      required this.onTap})
      : super(key: key);

  // final String image;
  final String location;
  final String amount;
  final String date;
  final String cancel;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Row(
            children: [
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
                  "assets/icons/trip_his_car.png",
                  // width: 100,
                ),
              ),
              Expanded(
                child: Text(
                  location,
                  style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 14,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
              Text(
                "GHC $amount",
                style: const TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontSize: 14,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(
                width: 30,
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 90),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    date,
                    style: const TextStyle(
                      // overflow: TextOverflow.ellipsis,
                      fontSize: 12,
                      color: AppColors.grey1,
                    ),
                  ),
                ),
                Text(
                  cancel,
                  style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const AppDivider1(),
        ],
      ),
    );
  }
}
