import 'package:flutter/material.dart';
import 'package:stone_wallet/welcomPage.dart';
import 'create_new_wallet_2.dart';

class CreateNewWalletPage extends StatefulWidget {
  // const CreateNewWalletPage({super.key});

  @override
  State<CreateNewWalletPage> createState() => _CreateNewWalletPageState();
}

class _CreateNewWalletPageState extends State<CreateNewWalletPage> {

  late TextEditingController searchController = TextEditingController();

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
                      => WelcomePage()),
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
                      SizedBox(height: height*0.05,),
                      const Text("Choose your wallet Currency", style: TextStyle(
                          color: Colors.white, fontSize: 15, fontWeight: FontWeight.w300
                      ),),
                      SizedBox(height: height*0.03,),
                      Container(
                        height: 50,
                        padding: EdgeInsets.only(left: width*0.05, right: width*0.05),
                        alignment: Alignment.center,
                        child: TextField(
                          controller: searchController,
                          textAlign: TextAlign.start,
                          textAlignVertical: TextAlignVertical.center,
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
                          decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(30)),
                              borderSide: BorderSide(color: Colors.white, width: 1.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(30)),
                              borderSide: BorderSide(color: Colors.white, width: 1.0),
                            ),
                            hintText: 'Browse Currency',
                            hintStyle: TextStyle(
                              color: Color(0xFFCACACA),
                              fontSize: 15,
                              fontFamily: 'Archivo',
                              fontWeight: FontWeight.w200,
                            ),
                            prefixIcon: Icon(Icons.search_rounded, color: Color(0xFFCACACA),),
                          ),
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                      SizedBox(height: height*0.05,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: width*0.45,
                            height: height*0.11,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/button_coin1.png"),
                                  fit: BoxFit.fill,
                                )
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    width: 43,
                                    height: 43,
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage("assets/xmr_logo.png"),
                                          fit: BoxFit.fill,
                                        )
                                    )
                                ),
                                const SizedBox(width: 20,),
                                const Text("XMR\nMonero", style: TextStyle(
                                    fontSize: 16, color: Colors.white , fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                          SizedBox(width: width*0.015,),
                          Container(
                              width: width*0.45,
                              height: height*0.11,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/button_coin2.png"),
                                    fit: BoxFit.fill,
                                  )
                              ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 43,
                                  height: 43,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage("assets/btc_logo.png"),
                                        fit: BoxFit.fill,
                                      )
                                  )
                                ),
                                const SizedBox(width: 20,),
                                const Text("BTC\nBitcoin", style: TextStyle(
                                    fontSize: 16, color: Colors.white , fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: height*0.02,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: width*0.45,
                            height: height*0.11,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/button_coin2.png"),
                                  fit: BoxFit.fill,
                                )
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    width: 43,
                                    height: 43,
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage("assets/eth_logo.png"),
                                          fit: BoxFit.fill,
                                        )
                                    )
                                ),
                                const SizedBox(width: 20,),
                                const Text("ETH\nEthereum", style: TextStyle(
                                    fontSize: 16, color: Colors.white , fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                          SizedBox(width: width*0.015,),
                          Container(
                            width: width*0.45,
                            height: height*0.11,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/button_coin2.png"),
                                  fit: BoxFit.fill,
                                )
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    width: 43,
                                    height: 43,
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage("assets/usdt_logo.png"),
                                          fit: BoxFit.fill,
                                        )
                                    )
                                ),
                                const SizedBox(width: 20,),
                                const Text("USDT\nTetherUS", style: TextStyle(
                                    fontSize: 16, color: Colors.white , fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: height*0.02,),
                      GestureDetector(
                        child: const Text(
                          "See More...", style: TextStyle(
                            color: Colors.white
                        ),
                        ),
                      ),
                      SizedBox(height: height*0.15,),
                      GestureDetector(
                        child: Container(
                          width: width*0.45,
                          height: height*0.09,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/select.png"),
                                fit: BoxFit.fill,
                              )
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            "Select", style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white ),
                          ),
                        ),
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context)
                            =>  CreateNewWalletPage2()),
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
