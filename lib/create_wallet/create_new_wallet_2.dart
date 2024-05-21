import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:stone_wallet/create_wallet/create_new_wallet_1.dart';
import 'package:stone_wallet/welcomPage.dart';
import 'package:url_launcher/url_launcher.dart';

import 'create_new_wallet_3.dart';

class CreateNewWalletPage2 extends StatefulWidget {
  // const CreateNewWalletPage2({super.key});

  @override
  State<CreateNewWalletPage2> createState() => _CreateNewWalletPage2State();
}

class _CreateNewWalletPage2State extends State<CreateNewWalletPage2> {

  late TextEditingController searchController = TextEditingController();
  bool visibility = false;

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
                  image: AssetImage("assets/background_new_wallet.png"),
                  fit: BoxFit.fill,
                )
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height*0.05,),
                GestureDetector(
                  child: Container(
                    margin: const EdgeInsets.only(left: 30),
                    child: const Icon(Icons.arrow_back_ios, color: Color(0xff94BFFF),),
                  ),
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)
                      =>  CreateNewWalletPage()),
                    );
                  },
                ),
                Container(
                  width: width,
                  height: height*0.88,
                  margin: EdgeInsets.only(top: height*0.02),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/background_new_wallet1.png"),
                        fit: BoxFit.fill,
                      )
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: height*0.02,),
                      const Text("Create New Wallet", style: TextStyle(
                          color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500
                      ),),
                      SizedBox(height: height*0.08,),
                      const Text("Username", style: TextStyle(
                          color: Color(0xFF93BEFF), fontSize: 15, fontWeight: FontWeight.w700
                      ),),
                      SizedBox(height: height*0.01,),
                      Container(
                        height: 45,
                        padding: EdgeInsets.only(left: width*0.15, right: width*0.15),
                        alignment: Alignment.center,
                        child: TextField(
                          // autofocus: true,
                          cursorColor: Colors.blue,
                          controller: searchController,
                          textAlign: TextAlign.start,
                          textAlignVertical: TextAlignVertical.center,
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                            focusedBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(30)),
                              borderSide: BorderSide(color: Color(0xff08101D), width: 1.0),
                            ),
                            fillColor: const Color(0xff050A12),
                            filled: true,
                            enabledBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(30)),
                              borderSide: BorderSide(color: Color(0xff08101D), width: 1.0),
                            ),
                            contentPadding: EdgeInsets.only(left: 20),
                            suffixIcon: GestureDetector(
                              child: !visibility? Container() :
                              const Icon(Icons.close, color: Color(0xFF93BEFF),),
                              onTap: (){
                                setState(() {
                                  searchController.clear();
                                });
                              },
                            ),
                          ),
                          textInputAction: TextInputAction.next,
                          onChanged: (text) {
                            setState(() {
                              visibility = true;
                            });
                          },
                        ),
                      ),
                      SizedBox(height: height*0.3,),
                      Container(
                        alignment: Alignment.center,
                        width: width*0.75,
                        child: const Text(
                          "On the Next Page you’ll see a series of 12 words This is your unique and private seed and it is the ONLY way to recover your wallet in case of loss or malfunction. It is YOUR responsibility to write it down and store it in a safe place outside of the Stone Wallet app.",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: height*0.03,),
                      GestureDetector(
                        child: Container(
                          width: width*0.9,
                          height: height*0.09,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/understand.png"),
                                fit: BoxFit.fill,
                              )
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            'I Understand. Show me my seed',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: 'Archivo',
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ),
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context)
                            =>  CreateNewWalletPage3()),
                          );
                        },
                      )
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
