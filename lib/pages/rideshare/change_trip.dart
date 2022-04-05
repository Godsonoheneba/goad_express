import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:goad_express/utils/app_colors.dart';
import 'package:goad_express/utils/app_texts.dart';
import 'package:goad_express/utils/constants.dart';
import 'package:goad_express/widgets/buttons/app_button.dart';
import 'package:goad_express/widgets/cards/description_card.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker/google_maps_place_picker.dart';

class ChangeTrip extends StatefulWidget {
  ChangeTrip({Key? key}) : super(key: key);

  @override
  State<ChangeTrip> createState() => _ChangeTripState();
}

class _ChangeTripState extends State<ChangeTrip> {
  PickResult? _toLocationResult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        // automaticallyImplyLeading: !_isChooseLocation,
        backgroundColor: AppColors.white,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: AppColors.primaryColor,
        ),
        actions: [],
      ),
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: GoogleMap(
              mapType: MapType.normal,
              myLocationEnabled: true,
              myLocationButtonEnabled: false,
              initialCameraPosition: const CameraPosition(
                target: LatLng(37.42796133580664, -122.085749655962),
                zoom: 14.4746,
              ),
              onMapCreated: (GoogleMapController controller) {
                // _controller.complete(controller);
              },
            ),
          ),
          SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const DescriptionCard(
                    title: AppTexts.changeYourDestination,
                    subTitle: AppTexts.tellUsWhereToChangeYouWantToGo,
                    backColor: AppColors.primaryColor),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 15,
                  ),
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 0,
                        blurRadius: 20,
                        color: AppColors.black.withOpacity(0.25),
                        offset: const Offset(0.0, -3.0),
                      )
                    ],
                  ),
                  child: ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PlacePicker(
                                  selectInitialPosition: true,
                                  searchForInitialValue: true,
                                  apiKey:
                                      "AIzaSyBZg8hk6vdVHvrBq7aB42rNJpHMNZHluv4",
                                  onPlacePicked: (result) {
                                    setState(() {
                                      _toLocationResult = result;
                                    });
                                    print(result.formattedAddress);
                                    Navigator.of(context).pop();
                                  },
                                  initialPosition: const LatLng(
                                      37.42796133580664, -122.085749655962),
                                  useCurrentLocation: true,
                                ),
                              ),
                            );
                          },
                          child: Row(
                            children: [
                              Image.asset("assets/icons/LocationMarker.png"),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: Text(
                                  _toLocationResult?.adrAddress ??
                                      _toLocationResult?.formattedAddress ??
                                      "Enter your destination",
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: _toLocationResult != null,
                                child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _toLocationResult = null;
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.close,
                                      color: AppColors.primaryColor,
                                    )),
                              ),
                            ],
                          ),
                        );
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
                                  )
                                ],
                              ),
                              const SizedBox(
                                width: 32,
                              ),
                              const Expanded(
                                child: Divider(
                                  thickness: 1,
                                  color: Color(0xFFE5E7EB),
                                ),
                              ),
                              const SizedBox(
                                width: 32,
                              ),
                            ],
                          ),
                        );
                      },
                      itemCount: 1),
                ),
                AppButton(
                  title: AppTexts.confirm,
                  onTap: () {
                    if (_toLocationResult != null) {
                      CoolAlert.show(
                        context: context,
                        backgroundColor: AppColors.lightWhite2,
                        type: CoolAlertType.confirm,
                        confirmBtnText: "Confirm",
                        cancelBtnText: "Bcak",
                        confirmBtnColor: AppColors.primaryColor,
                        text: AppTexts.areYouToConfirm,
                        // confirmBtnTap: Navigator.pop(context),
                      );
                    } else {
                      CoolAlert.show(
                        context: context,
                        type: CoolAlertType.error,
                        text: AppTexts.fieldCannotBeEmpty,
                        barrierDismissible: false,
                        backgroundColor: AppColors.primaryColor,
                        animType: CoolAlertAnimType.slideInRight,
                      );
                    }
                  },
                  backgroudColor: AppColors.primaryColor,
                  textColor: AppColors.white,
                  borderColor: AppColors.grey1,
                  widthSize: 200,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
