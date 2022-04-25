import 'package:flutter/material.dart';
import 'package:goad_express/pages/rideshare/view_canceled_trip.dart';
import 'package:goad_express/pages/rideshare/view_trip_history.dart';
import 'package:goad_express/utils/app_colors.dart';
import 'package:goad_express/utils/app_texts.dart';
import 'package:goad_express/widgets/divider/divider.dart';
import 'package:goad_express/widgets/list/trip_history_list_widget.dart';

class RideHistory extends StatefulWidget {
  RideHistory({Key? key}) : super(key: key);

  @override
  State<RideHistory> createState() => _RideHistoryState();
}

class _RideHistoryState extends State<RideHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.primaryColor,
        shadowColor: AppColors.white,
        elevation: 1,
        title: const Text(
          AppTexts.tripHistory,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TripHistoryList(
                  location: 'Love to the nations church',
                  amount: '70',
                  date: '27 Mar, 22:42',
                  cancel: '',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ViewTripHistory(),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
