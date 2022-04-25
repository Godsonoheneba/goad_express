import 'package:avatar_glow/avatar_glow.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:goad_express/pages/rideshare/chat_rider.dart';
import 'package:goad_express/pages/rideshare/ride_history.dart';
import 'package:goad_express/pages/rideshare/ride_promo.dart';
import 'package:goad_express/utils/app_colors.dart';
import 'package:goad_express/utils/app_texts.dart';
import 'package:goad_express/utils/constants.dart';
import 'package:goad_express/widgets/cards/description_card.dart';
import 'package:goad_express/widgets/cards/select_drive.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker/google_maps_place_picker.dart';

import 'package:swipe_to/swipe_to.dart';

class RideShareHomePage extends StatefulWidget {
  const RideShareHomePage({Key? key}) : super(key: key);

  @override
  State<RideShareHomePage> createState() => _RideShareHomePageState();
}

class _RideShareHomePageState extends State<RideShareHomePage> {
  PickResult? _fromLocationResult;
  bool _isChooseLocation = false;
  bool _isConfirm = false;
  bool _isSelectDrive = false;
  bool _isLookingForCar = false;
  bool _isConfirmDrive = false;
  bool _isBookConfirmByDriver = false;
  bool _isDrivingToDestinstion = false;
  bool isChatting = false;
  PickResult? _toLocationResult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        automaticallyImplyLeading: !_isChooseLocation,
        backgroundColor: AppColors.white,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: AppColors.primaryColor,
        ),
        actions: [
          Visibility(
            visible: _isChooseLocation &&
                (!_isConfirm ||
                    _fromLocationResult == null ||
                    _toLocationResult == null),
            child: IconButton(
              onPressed: () {
                _fromLocationResult = null;
                _toLocationResult = null;
                setState(() {
                  _isChooseLocation = false;
                  _isConfirm = false;
                });
              },
              icon: const Icon(
                Icons.close,
                color: AppColors.primaryColor,
              ),
            ),
          ),
          Visibility(
            visible: _isConfirm &&
                !_isSelectDrive &&
                _fromLocationResult != null &&
                _toLocationResult != null,
            child: IconButton(
              onPressed: () {
                // _fromLocationResult = null;
                // _toLocationResult = null;
                setState(() {
                  _isChooseLocation = true;
                  _isConfirm = false;
                });
              },
              icon: const Icon(
                Icons.close,
                color: AppColors.primaryColor,
              ),
            ),
          ),
          Visibility(
            visible: _isSelectDrive &&
                !_isConfirmDrive &&
                _fromLocationResult != null &&
                _toLocationResult != null,
            child: IconButton(
              onPressed: () {
                setState(() {
                  _isConfirm = true;
                  _isSelectDrive = false;
                });
              },
              icon: const Icon(
                Icons.close,
                color: AppColors.primaryColor,
              ),
            ),
          ),
          // Visibility(
          //   visible: _isConfirmDrive &&
          //       _fromLocationResult != null &&
          //       _toLocationResult != null,
          //   child: IconButton(
          //     onPressed: () {
          //       setState(() {
          //         _isSelectDrive = true;
          //         _isConfirmDrive = false;
          //       });
          //     },
          //     icon: const Icon(
          //       Icons.close,
          //       color: AppColors.primaryColor,
          //     ),
          //   ),
          // ),
        ],
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
          Visibility(
            visible: !_isChooseLocation,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SwipeTo(
                  onRightSwipe: () {
                    setState(() {
                      _isChooseLocation = true;
                    });
                  },
                  iconOnRightSwipe: Icons.arrow_forward_ios,
                  iconColor: AppColors.primaryColor,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _isChooseLocation = true;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      margin: const EdgeInsets.symmetric(
                        horizontal: 40,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 0,
                            blurRadius: 20,
                            color: AppColors.black.withOpacity(0.25),
                            offset: const Offset(0.0, 0.0),
                          )
                        ],
                      ),
                      child: Row(
                        children: [
                          const Expanded(
                            child: Text(
                              "Where to",
                              style: TextStyle(
                                fontFamily: "Roboto",
                                fontSize: 18,
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ),
                          Container(
                            height: 34,
                            width: 34,
                            margin: const EdgeInsets.all(5),
                            padding: const EdgeInsets.all(7),
                            decoration: const BoxDecoration(
                              color: AppColors.primaryColor,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.arrow_forward_ios,
                              color: AppColors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 80,
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
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      NavBtn(
                        image: "home.png",
                        title: "Home",
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => const RideShareHomePage(),
                          //   ),
                          // );
                        },
                      ),
                      NavBtn(
                        image: "promo.png",
                        title: "Promo",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RidePromo(),
                            ),
                          );
                        },
                      ),
                      NavBtn(
                        image: "history.png",
                        title: "History",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RideHistory(),
                            ),
                          );
                          ;
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SafeArea(
            child: Visibility(
              visible: _isChooseLocation &&
                  (!_isConfirm ||
                      _fromLocationResult == null ||
                      _toLocationResult == null),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const DescriptionCard(
                      title: AppTexts.enterYourDestination,
                      subTitle: AppTexts.tellUsWhereYouWantToGo,
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
                          if (index == 0) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PlacePicker(
                                      selectInitialPosition: true,
                                      searchForInitialValue: true,
                                      apiKey: mapApiKey,
                                      onPlacePicked: (result) {
                                        setState(() {
                                          _isConfirm = true;
                                          _fromLocationResult = result;
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
                                  Image.asset("assets/icons/yourlocation.png"),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    child: Text(
                                      _fromLocationResult?.adrAddress ??
                                          _fromLocationResult
                                              ?.formattedAddress ??
                                          "Enter your address",
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  Visibility(
                                    visible: _fromLocationResult != null,
                                    child: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _isConfirm = true;
                                            _fromLocationResult = null;
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
                          } else {
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
                                          _isConfirm = true;
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
                                  Image.asset(
                                      "assets/icons/LocationMarker.png"),
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
                        itemCount: 2),
                  ),
                ],
              ),
            ),
          ),
          SafeArea(
            child: Visibility(
              visible: _isConfirm &&
                  !_isSelectDrive &&
                  _fromLocationResult != null &&
                  _toLocationResult != null,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const DescriptionCard(
                    title: AppTexts.selectYourPreferDrive,
                    subTitle: AppTexts.fellFreeToExploreWHatYouWant,
                    backColor: AppColors.primaryColor,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        SelectDrive(
                          image: "assets/icons/goadx.png",
                          title: "GoadX",
                          subTitle: "Driveless car",
                          time: "4 mins",
                          amount: "GHC 100",
                          onTap: () {
                            setState(() {
                              _isSelectDrive = true;
                            });
                          },
                        ),
                        SelectDrive(
                          image: "assets/icons/goadY.png",
                          title: "GoadY",
                          subTitle: "Up to 4 seats",
                          time: "14 mins",
                          amount: "GHC 80",
                          onTap: () {
                            setState(() {
                              _isSelectDrive = true;
                            });
                          },
                        ),
                        SelectDrive(
                          image: "assets/icons/comfort.png",
                          title: "Comfort",
                          subTitle: "Up to 4 seats",
                          time: "24 mins",
                          amount: "GHC 60",
                          onTap: () {
                            setState(() {
                              _isSelectDrive = true;
                            });
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Visibility(
            visible: _isSelectDrive &&
                !_isConfirmDrive &&
                _fromLocationResult != null &&
                _toLocationResult != null,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: double.infinity,
                  height: 460,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 0,
                        blurRadius: 20,
                        color: AppColors.black.withOpacity(0.25),
                        offset: const Offset(0.0, 0.0),
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 220,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: 0,
                              blurRadius: 20,
                              color: AppColors.black.withOpacity(0.25),
                              offset: const Offset(0.0, 0.0),
                            )
                          ],
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 30,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "GoadX",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Driveless car",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: AppColors.grey1,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "4",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Seats",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: AppColors.grey1,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "5.0",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Car rating",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: AppColors.grey1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Container(
                                child: Image.asset(
                                  "assets/icons/ride_info_image.png",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
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
                              if (index == 0) {
                                return Row(
                                  children: [
                                    Image.asset(
                                        "assets/icons/yourlocation.png"),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                      child: Text(
                                        _fromLocationResult?.formattedAddress ??
                                            "".toString(),
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: AppColors.white,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    const Text(
                                      "2 mins",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: AppColors.white,
                                      ),
                                    ),
                                  ],
                                );
                              } else {
                                return Row(
                                  children: [
                                    Image.asset(
                                        "assets/icons/LocationMarker.png"),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                      child: Text(
                                        _toLocationResult?.formattedAddress ??
                                            "".toString(),
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: AppColors.white,
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
                                        fontSize: 16,
                                        color: AppColors.white,
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

                      // Container(
                      //   child: const Divider(
                      //     thickness: 1,
                      //     color: AppColors.white,
                      //   ),
                      // ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isConfirmDrive = true;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 30,
                          ),
                          width: double.infinity,
                          height: 60,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                spreadRadius: 0,
                                blurRadius: 20,
                                color: AppColors.black.withOpacity(0.25),
                                offset: const Offset(0.0, 0.0),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 25,
                                  vertical: 10,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      "Total",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "GHC 20",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 1,
                                height: 50,
                                color: AppColors.primaryColor,
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              Expanded(
                                child: Container(
                                  child: const Text(
                                    "Confirm",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  child: const Icon(
                                    Icons.east,
                                    size: 30,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Visibility(
            visible: _isConfirmDrive &&
                !_isLookingForCar &&
                _fromLocationResult != null &&
                _toLocationResult != null,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // AvatarGlow(
                //   animate: true,
                //   curve: Curves.fastOutSlowIn,
                //   glowColor: AppColors.primaryColor,
                //   endRadius: 150.0,
                //   duration: const Duration(milliseconds: 2000),
                //   repeat: true,
                //   showTwoGlows: true,
                //   repeatPauseDuration: const Duration(milliseconds: 20),
                //   child: Material(
                //     // Replace this child with your own
                //     elevation: 8.0,
                //     shape: const CircleBorder(),
                //     child: CircleAvatar(
                //       backgroundColor: AppColors.white,
                //       child: Image.asset(
                //         'assets/icons/searchingcar.png',
                //         height: 40,
                //       ),
                //       radius: 30.0,
                //     ),
                //   ),
                // ),

                Container(
                  width: double.infinity,
                  height: 320,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 0,
                        blurRadius: 20,
                        color: AppColors.black.withOpacity(0.25),
                        offset: const Offset(0.0, 0.0),
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.all(15),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _isLookingForCar = true;
                                });
                              },
                              child: const Text(
                                "Booking confirmed",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: const Text(
                              "We have accepted your booking, Finding you a driver",
                              style: TextStyle(
                                fontSize: 12,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          InkWell(
                            onTap: () {
                              cancelTrip();
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/icons/cancel_ride.png",
                                  width: 60,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  "Cancel trip",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: AppColors.grey1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Divider(
                            thickness: 1,
                          ),
                          GestureDetector(
                            onTap: () {
                              changeTrip();
                            },
                            child: Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 30,
                                    vertical: 10,
                                  ),
                                  child: Image.asset(
                                    "assets/icons/location_icon.png",
                                    width: 35,
                                    height: 35,
                                  ),
                                ),
                                // const SizedBox(
                                //   width: 5,
                                // ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        _toLocationResult?.formattedAddress ??
                                            "".toString(),
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color: AppColors.primaryColor,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text(
                                        "Change trip",
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: AppColors.grey1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 100,
                                ),
                                const Expanded(
                                  child: Icon(Icons.arrow_forward_ios),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Visibility(
            visible: _isLookingForCar &&
                !_isBookConfirmByDriver &&
                _fromLocationResult != null &&
                _toLocationResult != null,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: double.infinity,
                  height: 320,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 0,
                        blurRadius: 20,
                        color: AppColors.black.withOpacity(0.25),
                        offset: const Offset(0.0, 0.0),
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _isBookConfirmByDriver = true;
                              });
                            },
                            child: Container(
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.all(15),
                              child: const Text(
                                "Booking confirmed",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: const Text(
                              "We have accepted your booking, Finding you a driver",
                              style: TextStyle(
                                fontSize: 14,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Divider(
                            thickness: 1,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 30,
                                  ),
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        "assets/images/driver.png",
                                        fit: BoxFit.cover,
                                        width: 30,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      const Text(
                                        "Nana Addo",
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              Container(
                                width: 1,
                                height: 80,
                                margin: const EdgeInsets.only(
                                  left: 20,
                                ),
                                color: AppColors.primaryColor,
                              ),
                              const SizedBox(
                                width: 60,
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    cancelTrip();
                                  },
                                  child: Container(
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          "assets/icons/cancel_ride.png",
                                          fit: BoxFit.cover,
                                          width: 50,
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        const Text(
                                          "Cancel ride",
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                            ],
                          ),
                          const Divider(
                            thickness: 1,
                          ),
                          GestureDetector(
                            onTap: () {
                              changeTrip();
                            },
                            child: Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 30,
                                    vertical: 10,
                                  ),
                                  child: Image.asset(
                                    "assets/icons/location_icon.png",
                                    width: 35,
                                    height: 35,
                                  ),
                                ),
                                // const SizedBox(
                                //   width: 5,
                                // ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        _toLocationResult?.formattedAddress ??
                                            "".toString(),
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color: AppColors.primaryColor,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text(
                                        "Change trip",
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: AppColors.grey1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 100,
                                ),
                                const Expanded(
                                  child: Icon(Icons.arrow_forward_ios),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Visibility(
            visible: _isBookConfirmByDriver &&
                !_isDrivingToDestinstion &&
                _fromLocationResult != null &&
                _toLocationResult != null,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: double.infinity,
                  height: 380,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 0,
                        blurRadius: 20,
                        color: AppColors.black.withOpacity(0.25),
                        offset: const Offset(0.0, 0.0),
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _isDrivingToDestinstion = true;
                              });
                            },
                            child: Container(
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.all(15),
                              child: const Text(
                                "Arriving in 2 mins",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                child: const Text(
                                  "Hyundai i10",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Container(
                                width: 150,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      spreadRadius: 0,
                                      blurRadius: 20,
                                      color: AppColors.black.withOpacity(0.25),
                                      offset: const Offset(0.0, 0.0),
                                    )
                                  ],
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 11,
                                ),
                                child: const Text(
                                  "GN 7209 - 21",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Divider(
                            thickness: 1,
                          ),
                          Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 30,
                                  vertical: 10,
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      width: 55,
                                      height: 55,
                                      decoration: BoxDecoration(
                                        color: AppColors.whiteF1,
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 11,
                                      ),
                                      child: Image.asset(
                                        "assets/images/driver.png",
                                        fit: BoxFit.cover,
                                        width: 30,
                                      ),
                                    ),
                                    const Text(
                                      "Nana Addo",
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ChatRiderPage(),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      width: 55,
                                      height: 55,
                                      decoration: BoxDecoration(
                                        color: AppColors.whiteF1,
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 11,
                                      ),
                                      child: const Icon(
                                        Icons.chat_bubble,
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    "Chat",
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 60,
                              ),
                              Column(
                                children: [
                                  Container(
                                    width: 55,
                                    height: 55,
                                    decoration: BoxDecoration(
                                      color: AppColors.whiteF1,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 11,
                                    ),
                                    child: const Icon(
                                      Icons.call,
                                    ),
                                  ),
                                  const Text(
                                    "Call",
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                            ],
                          ),
                          const Divider(
                            thickness: 1,
                          ),
                          GestureDetector(
                            onTap: () {
                              changeTrip();
                            },
                            child: Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 30,
                                    vertical: 10,
                                  ),
                                  child: Image.asset(
                                    "assets/icons/location_icon.png",
                                    width: 35,
                                    height: 35,
                                  ),
                                ),
                                // const SizedBox(
                                //   width: 5,
                                // ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        _toLocationResult?.formattedAddress ??
                                            "".toString(),
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color: AppColors.primaryColor,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text(
                                        "Change trip",
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: AppColors.grey1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 100,
                                ),
                                const Expanded(
                                  child: Icon(Icons.arrow_forward_ios),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                      GestureDetector(
                        onTap: () {
                          cancelTrip();
                        },
                        child: Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 30,
                                vertical: 10,
                              ),
                              child: Image.asset(
                                "assets/icons/cancel_ride.png",
                                width: 35,
                                height: 35,
                              ),
                            ),
                            // const SizedBox(
                            //   width: 5,
                            // ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Cancel Trip",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 100,
                            ),
                            const Expanded(
                              child: Icon(Icons.arrow_forward_ios),
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
          Visibility(
            visible: _isDrivingToDestinstion &&
                _fromLocationResult != null &&
                _toLocationResult != null,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: double.infinity,
                  height: 320,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 0,
                        blurRadius: 20,
                        color: AppColors.black.withOpacity(0.25),
                        offset: const Offset(0.0, 0.0),
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.all(15),
                            child: const Text(
                              "Driving to destination",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                child: const Text(
                                  "Hyundai i10",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Container(
                                width: 150,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      spreadRadius: 0,
                                      blurRadius: 20,
                                      color: AppColors.black.withOpacity(0.25),
                                      offset: const Offset(0.0, 0.0),
                                    ),
                                  ],
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 11,
                                ),
                                child: const Text(
                                  "GN 7209 - 21",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Divider(
                            thickness: 1,
                          ),
                          Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 30,
                                  vertical: 10,
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      width: 55,
                                      height: 55,
                                      decoration: BoxDecoration(
                                        color: AppColors.whiteF1,
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 11,
                                      ),
                                      child: Image.asset(
                                        "assets/images/driver.png",
                                        fit: BoxFit.cover,
                                        width: 30,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text(
                                      "Nana Addo",
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Column(
                                children: [
                                  Container(
                                    width: 55,
                                    height: 55,
                                    decoration: BoxDecoration(
                                      color: AppColors.whiteF1,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 11,
                                    ),
                                    child: const Icon(
                                      Icons.insert_invitation_outlined,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    "Share my location",
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 40,
                              ),
                              Column(
                                children: [
                                  Container(
                                    width: 55,
                                    height: 55,
                                    decoration: BoxDecoration(
                                      color: AppColors.whiteF1,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 11,
                                    ),
                                    child: const Icon(
                                      Icons.call,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    "Call",
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                            ],
                          ),
                          const Divider(
                            thickness: 1,
                          ),
                          GestureDetector(
                            onTap: () {
                              changeTrip();
                            },
                            child: Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 30,
                                    vertical: 10,
                                  ),
                                  child: Image.asset(
                                    "assets/icons/location_icon.png",
                                    width: 35,
                                    height: 35,
                                  ),
                                ),
                                // const SizedBox(
                                //   width: 5,
                                // ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        _toLocationResult?.formattedAddress ??
                                            "".toString(),
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color: AppColors.primaryColor,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text(
                                        "Change trip",
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: AppColors.grey1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 100,
                                ),
                                const Expanded(
                                  child: Icon(Icons.arrow_forward_ios),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void changeTrip() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => PlacePicker(
          selectInitialPosition: true,
          searchForInitialValue: true,
          apiKey: "AIzaSyBZg8hk6vdVHvrBq7aB42rNJpHMNZHluv4",
          onPlacePicked: (result) {
            Navigator.of(ctx).pop();

            CoolAlert.show(
              context: context,
              backgroundColor: AppColors.lightWhite2,
              type: CoolAlertType.confirm,
              confirmBtnText: "Confirm",
              cancelBtnText: "Bcak",
              confirmBtnColor: AppColors.primaryColor,
              text: AppTexts.areYouToConfirm,
              onConfirmBtnTap: () {
                Navigator.pop(context);
                setState(() {
                  _toLocationResult = result;
                });
              },
            );
          },
          initialPosition: const LatLng(37.42796133580664, -122.085749655962),
          useCurrentLocation: true,
        ),
      ),
    );
  }

  void cancelTrip() {
    Navigator.pop(context);
    setState(
      () {
        _isChooseLocation = false;
        _isConfirm = false;
        _isSelectDrive = false;
        _isLookingForCar = false;
        _isConfirmDrive = false;
        _isBookConfirmByDriver = false;
        _isDrivingToDestinstion = false;
        isChatting = false;
        _fromLocationResult = null;
        _toLocationResult = null;
      },
    );
  }
}

class NavBtn extends StatelessWidget {
  const NavBtn({
    Key? key,
    required this.image,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final String image;
  final Function() onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 52,
        child: Column(
          children: [
            Image.asset(
              "assets/icons/$image",
              height: 34,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              title,
              style: const TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 11,
                  color: AppColors.primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
