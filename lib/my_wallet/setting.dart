import 'package:flutter/material.dart';
import 'package:stone_wallet/models/portfolio_model.dart';
import 'package:stone_wallet/models/setting_model.dart';
import 'package:stone_wallet/welcomPage.dart';

import '../models/coin_model.dart';

class SettingPage extends StatefulWidget {
  // const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {

  List<SettingModel> settings = [
    SettingModel(name: "Account Settings", image: "assets/account.png"),
    SettingModel(name: "Connection and sync", image: "assets/sync.png"),
    SettingModel(name: "Address book", image: "assets/address.png"),
    SettingModel(name: "Privacy and sync", image: "assets/privacy.png"),
    SettingModel(name: "Security and backup", image: "assets/security.png"),
    SettingModel(name: "Display settings", image: "assets/display.png"),
    SettingModel(name: "Help & Support", image: "assets/help.png"),
    SettingModel(name: "Privacy settings", image: "assets/privacy_setting.png"),
    SettingModel(name: "Terms & Condition", image: "assets/terms.png"),
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
                  SizedBox(height: height*0.04,),
                  Container(
                    width: width,
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
                        const Text("Settings", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
                        const SizedBox(height: 8,),
                        Container(width: width*0.15, height: 2, color: const Color(0xff74ABFF),),
                        Container(width: width*0.9, height: 1, color: const Color(0xff7A7F87),),
                        SizedBox(height: height*0.03,),
                        Column(
                          children: [
                            SizedBox(height: height*0.03,),
                            ListView.builder(
                              key: UniqueKey(),
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  margin: const EdgeInsets.only(bottom: 30),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(width: width*0.05,),
                                          Image.asset(settings[index].image,),
                                          SizedBox(width: width*0.05,),
                                          Text(settings[index].name,
                                            style: const TextStyle(color: Color(0xffB9B9B9)),),
                                        ],
                                      ),
                                      SizedBox(height: 10,),
                                      Container(width: width, height: 1,
                                        color: Color(0xff314A71),
                                      )
                                    ],
                                  ),
                                );
                              },
                              itemCount: settings.length,
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
