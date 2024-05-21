import 'package:flutter/material.dart';
import 'package:stone_wallet/NavigatorPage.dart';
import 'package:stone_wallet/create_wallet/create_new_wallet_1.dart';

import 'create_wallet/create_new_wallet_2.dart';

class WelcomePage extends StatefulWidget {
  // const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

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
            height: height,
            decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/background_welcome.png"),
                  fit: BoxFit.fill,
                )
            ),
            child: Column(
              children: [
                GestureDetector(
                  child: Container(
                    width: width*0.85,
                    height: height*0.09,
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: height*0.52),
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/button2.png"),
                          fit: BoxFit.fill,
                        )
                    ),
                    child: const Text(
                      '+ Create a New Wallet',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Archivo',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)
                      => CreateNewWalletPage()),
                    );
                  },
                ),
                SizedBox(height: height*0.015,),
                GestureDetector(
                  child: Container(
                    width: width*0.85,
                    height: height*0.09,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/button1.png"),
                          fit: BoxFit.fill,
                        )
                    ),
                    child: const Text(
                      'Login to Existing Wallet',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xff94BFFF),
                        fontSize: 20,
                        fontFamily: 'Archivo',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)
                      => const NavigatorPage(0)),
                    );
                  },
                ),
                const SizedBox(height: 10,),
                const Text("Please select below to Create or login to your wallet",
                  style: TextStyle(color: Colors.white, fontSize: 13),
                )
              ],
            ),
          ),
        )
    );
  }
}
