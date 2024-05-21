import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stone_wallet/my_wallet/my_wallet_balance.dart';
import 'package:stone_wallet/my_wallet/notifications.dart';
import 'package:stone_wallet/my_wallet/portfolio.dart';
import 'package:stone_wallet/my_wallet/setting.dart';
import 'package:stone_wallet/my_wallet/stocks.dart';

import 'models/setting_model.dart';

class NavigatorPage extends StatefulWidget {

  final int index;
  const NavigatorPage(this.index, {Key? key}): super(key: key);

  @override
  NavigatorPageState createState() => NavigatorPageState();
}

class NavigatorPageState extends State<NavigatorPage> {

  GlobalKey bottomNavigationKey = GlobalKey();
  List<Widget> widgetList = [MyWalletBalancePage(), StocksPage(), PortfolioPage(), SettingPage(),];
  late int selectedPos ;
  bool _isClickedDrawer = false;
  List<SettingModel> settings = [
    SettingModel(name: "Connection and sync", image: "assets/sync.png"),
    SettingModel(name: "Address book", image: "assets/address.png"),
    SettingModel(name: "Privacy and sync", image: "assets/privacy.png"),
    SettingModel(name: "Security and backup", image: "assets/security.png"),
    SettingModel(name: "Display settings", image: "assets/display.png"),
    SettingModel(name: "Help & Support", image: "assets/help.png"),
    SettingModel(name: "Privacy settings", image: "assets/privacy_setting.png"),
  ];

  @override
  void initState() {
    setState(() {
      selectedPos = widget.index;
    });
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff1A2330),
        leading: GestureDetector(
          child: const Icon(Icons.list,color: Color(0xff91AFDB),size: 40,),
          onTap: (){
            setState(() {
              _isClickedDrawer = true;
            });
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.add_alert,
              color: Color(0xff91AFDB),
              size: 30,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context)
                => NotificationPage()),
              );
            },
          )
        ],
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/background_new_wallet.png"),
                fit: BoxFit.cover,
              ),
            ),
            width: width,
            height: height,
            child:  widgetList[selectedPos],
          ),
          Visibility(
            visible: _isClickedDrawer,
            child: Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: width*0.6,
                height: height*0.7,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/background_new_wallet1.png"),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                child: ListView(
                  children: [
                    SizedBox(height: height*0.01,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 20),
                          child: Icon(Icons.account_circle_rounded,
                            size: width*0.1,color: const Color(0xff91AFDB),),
                        ),
                        GestureDetector(
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            child: Icon(Icons.close,
                              color: const Color(0xff91AFDB), size: width*0.06,),
                          ),
                          onTap: (){
                            setState(() {
                              _isClickedDrawer = false;
                            });
                          },
                        )
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Container(width: width, height: 1,
                      color: const Color(0xff314A71),
                    ),
                    const SizedBox(height: 10,),
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
                              const SizedBox(height: 10,),
                              Container(width: width, height: 1,
                                color: const Color(0xff314A71),
                              )
                            ],
                          ),
                        );
                      },
                      itemCount: settings.length,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: buildMyNavBar(context),
    );
  }
  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
        color: Color(0xff212D3E),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                selectedPos = 0;
              });
            },
            icon: selectedPos == 0
                ? Image.asset("assets/selected_balance_icon.png")
                : Image.asset("assets/balance_icon.png"),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                selectedPos = 1;
              });
            },
            icon: selectedPos == 1
              ? SizedBox(
                  width: 35, height: 35,
                  child: Image.asset("assets/selected_stocks_icon.png"),
                )
              : SizedBox(
                  width: 35, height: 35,
                  child: Image.asset("assets/stocks_icon.png"),
                )
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                selectedPos = 2;
              });
            },
            icon: selectedPos == 2
                ? Image.asset("assets/selected_poto_icon.png")
                : Image.asset("assets/poto_icon.png"),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                selectedPos = 3;
              });
            },
            icon: selectedPos == 3
                ? Image.asset("assets/selected_setting_icon.png")
                : Image.asset("assets/setting_icon.png"),
          ),
        ],
      ),
    );
  }
}