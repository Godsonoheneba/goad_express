import 'package:flutter/material.dart';
import 'package:goad_express/utils/app_colors.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker/google_maps_place_picker.dart';
import 'package:swipe_to/swipe_to.dart';

class RideShareHomePage extends StatefulWidget {
  const RideShareHomePage({Key? key}) : super(key: key);

  @override
  State<RideShareHomePage> createState() => _RideShareHomePageState();
}

class _RideShareHomePageState extends State<RideShareHomePage> {
  bool _isChooseLocation = false;
  bool _isConfirm = false;
  PickResult? fromLocationResult;
  PickResult? toLocationResult;

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
                    fromLocationResult == null ||
                    toLocationResult == null),
            child: IconButton(
              onPressed: () {
                fromLocationResult = null;
                toLocationResult = null;
                setState(() {
                  _isChooseLocation = false;
                });
              },
              icon: const Icon(
                Icons.close,
                color: AppColors.primaryColor,
              ),
            ),
          )
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
                                fontSize: 20,
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
                          print("object1");
                        },
                      ),
                      NavBtn(
                        image: "promo.png",
                        title: "Promo",
                        onTap: () {
                          print("object2");
                        },
                      ),
                      NavBtn(
                        image: "history.png",
                        title: "History",
                        onTap: () {
                          print("object3");
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
                  (fromLocationResult == null || toLocationResult == null),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 20,
                    ),
                    margin: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.myBblue,
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
                        Row(
                          children: const [
                            Text(
                              "Enter your destination",
                              style: TextStyle(
                                fontFamily: "Roboto",
                                fontSize: 17,
                                color: AppColors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Row(
                          children: const [
                            Text(
                              "Tell us whenever you to go.",
                              style: TextStyle(
                                fontFamily: "Roboto",
                                fontSize: 14,
                                color: AppColors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
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
                                      apiKey:
                                          "AIzaSyBZg8hk6vdVHvrBq7aB42rNJpHMNZHluv4",
                                      onPlacePicked: (result) {
                                        setState(() {
                                          _isConfirm = true;
                                          fromLocationResult = result;
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
                                      fromLocationResult?.adrAddress ??
                                          fromLocationResult
                                              ?.formattedAddress ??
                                          "Enter your address",
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  Visibility(
                                    visible: fromLocationResult != null,
                                    child: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _isConfirm = true;
                                            fromLocationResult = null;
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
                                          toLocationResult = result;
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
                                      toLocationResult?.adrAddress ??
                                          toLocationResult?.formattedAddress ??
                                          "Enter your destination",
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  Visibility(
                                    visible: toLocationResult != null,
                                    child: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            toLocationResult = null;
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
        ],
      ),
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
