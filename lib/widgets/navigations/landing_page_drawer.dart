import 'package:flutter/material.dart';
import 'package:goad_express/utils/app_colors.dart';
import 'package:goad_express/utils/app_texts.dart';
import 'package:goad_express/widgets/divider/divider.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          _drawerHeader(),
          _drawerItems(
            icon: Icons.payment,
            text: AppTexts.payment,
            onTap: () {
             
            },
          ),
          _drawerItems(
            icon: Icons.message_outlined,
            text: AppTexts.messaging,
            onTap: () {},
          ),
          _drawerItems(
            icon: Icons.notifications,
            text: AppTexts.notification,
            onTap: () {},
          ),
          _drawerItems(
            icon: Icons.policy_sharp,
            text: AppTexts.policyAndPrivacy,
            onTap: () {},
          ),
          _drawerItems(
            icon: Icons.support_agent_outlined,
            text: AppTexts.support,
            onTap: () {},
          ),
          _drawerItems(
            icon: Icons.info_outlined,
            text: AppTexts.about,
            onTap: () {},
          ),
          SizedBox(
            height: 50,
          ),
          const AppDivider8(),
          _drawerItems(
            icon: Icons.logout_outlined,
            text: AppTexts.logout,
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _drawerHeader() {
    return SizedBox(
      height: 150,
      child: DrawerHeader(
        child: Row(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Container(
                    // margin: const EdgeInsets.all(5),
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.lightWhite,
                    ),
                    child: const Icon(
                      Icons.person,
                      color: AppColors.rentColor,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                children: const [
                  Text(
                    "DACOSTA",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppTexts.editProfile,
                      style: TextStyle(
                          fontSize: 13,
                          color: AppColors.black,
                          fontWeight: FontWeight.normal),
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

  Widget _drawerItems(
      {required IconData icon,
      required String text,
      required GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: [
          Icon(
            icon,
            color: AppColors.lightBlack,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              text,
              style: const TextStyle(
                color: AppColors.lightBlack2,
                fontSize: 15,
                letterSpacing: 0.5,
              ),
            ),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}
