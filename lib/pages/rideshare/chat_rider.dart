import 'package:flutter/material.dart';
import 'package:goad_express/utils/app_colors.dart';

class ChatRiderPage extends StatefulWidget {
  ChatRiderPage({Key? key}) : super(key: key);

  @override
  State<ChatRiderPage> createState() => _ChatRiderPageState();
}

class _ChatRiderPageState extends State<ChatRiderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteF1,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.primaryColor,
        title: Column(
          children: [
            SizedBox(
              width: 30,
              height: 30,
              child: Image.asset("assets/images/driver.png"),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              "Kia Picanto - GN - 8787-21",
              style: TextStyle(
                fontSize: 10,
              ),
            ),
          ],
        ),
        actions: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                child: const Icon(Icons.call),
              ),
            ],
          )
        ],
      ),
      body: Stack(
        // alignment: AlignmentDirectional.bottomCenter,
        children: [
          Image.asset(
            "assets/images/chatback.png",
            fit: BoxFit.fill,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 100,
                width: double.infinity,
                color: AppColors.white,
                child: const TextField(
                  // controller: controllerName,
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    suffix: Icon(Icons.send),
                    // prefix: fieldIcon,
                    hintText: "Type your message",
                    hintStyle: TextStyle(
                      fontSize: 20,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
