import 'package:flutter/material.dart';
import 'package:goad_express/utils/app_colors.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RideShareHomePage extends StatefulWidget {
  const RideShareHomePage({Key? key}) : super(key: key);

  @override
  State<RideShareHomePage> createState() => _RideShareHomePageState();
}

class _RideShareHomePageState extends State<RideShareHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: AppColors.primaryColor,
        ),
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
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
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
  final String title;
  final Function() onTap;
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
