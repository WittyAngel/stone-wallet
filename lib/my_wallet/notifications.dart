import 'package:flutter/material.dart';
import 'package:stone_wallet/NavigatorPage.dart';
import 'package:stone_wallet/models/notification_model.dart';
import 'package:stone_wallet/models/portfolio_model.dart';
import 'package:stone_wallet/models/setting_model.dart';
import 'package:stone_wallet/welcomPage.dart';

import '../models/coin_model.dart';

class NotificationPage extends StatefulWidget {
  // const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {

  List<NotificationModel> notifications = [
    NotificationModel(time: "4:00pm\n25 Dec 23", image: "assets/Ellipse 17.png"),
    NotificationModel(time: "7:00pm\n25 Dec 23", image: "assets/Ellipse 17.png"),
    NotificationModel(time: "9:00pm\n25 Dec 23", image: "assets/Ellipse 17.png"),
    NotificationModel(time: "4:00am\n25 Dec 23", image: "assets/Ellipse 17.png"),
    NotificationModel(time: "5:00pm\n25 Dec 23", image: "assets/Ellipse 17.png"),
  ];

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
              width: width,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/background_new_wallet.png"),
                    fit: BoxFit.fill,
                  )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: height*0.07,),
                  Container(
                    width: width,
                    height: height,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment(0.00, -1.00),
                          end: Alignment(0, 1),
                          colors: [Color(0xFF172C4C), Color(0xFF1A222F)],
                        ),
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: height*0.03,),
                        Row(
                          children: [
                            const SizedBox(width: 20,),
                            GestureDetector(
                              child: const Icon(Icons.close, color: Color(0xff91AFDB),),
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context)
                                  => const NavigatorPage(0)),
                                );
                              },
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Notifications", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
                            Container(
                              width: 5, height: 5,
                              decoration: BoxDecoration(
                                border: Border.all(color: const Color(0xffff0000)),
                                color: const Color(0xffff0000),
                                borderRadius: const BorderRadius.all(Radius.circular(8)),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 8,),
                        Container(width: width*0.15, height: 2, color: const Color(0xff74ABFF),),
                        Container(width: width*0.9, height: 1, color: const Color(0xff7A7F87),),
                        Column(
                          children: [
                            ListView.builder(
                              key: UniqueKey(),
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  margin: const EdgeInsets.only(bottom: 20),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.only(left: 30),
                                            child: Image.asset(notifications[index].image,),
                                          ),
                                          SizedBox(width: width*0.05,),
                                          Container(
                                            margin: const EdgeInsets.only(right: 30),
                                            child: Text(notifications[index].time,
                                              style: const TextStyle(color: Color(0xffB9B9B9)),),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                              itemCount: notifications.length,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              )
          ),
        )
    );
  }
}
