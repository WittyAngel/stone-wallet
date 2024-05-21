import 'package:flutter/material.dart';
import 'package:stone_wallet/welcomPage.dart';

import '../models/coin_model.dart';

class MyWalletBalancePage extends StatefulWidget {
  // const MyWalletBalancePage({super.key});

  @override
  State<MyWalletBalancePage> createState() => _MyWalletBalancePageState();
}

class _MyWalletBalancePageState extends State<MyWalletBalancePage> {

  bool selectCoins = true;
  TextEditingController searchController = TextEditingController();
  List<CoinModel> coins = [
    CoinModel(name: "XMR", type: "Monero", icon: "assets/monero.png", amount: "4 XMR", usdAmount: "\$789.60"),
    CoinModel(name: "BTC", type: "Bitcoin", icon: "assets/bitcoin.png", amount: "0.1245 BTC", usdAmount: "\$10,504"),
    CoinModel(name: "ETH", type: "Ethereum", icon: "assets/ethereum.png", amount: "1 ETH", usdAmount: "\$4879.6"),
    CoinModel(name: "USDT", type: "TetherUS", icon: "assets/tetherUS.png", amount: "60 USDT", usdAmount: "\$60.60"),
    CoinModel(name: "XRP", type: "Ripple", icon: "assets/ripple.png", amount: "1000 XRP", usdAmount: "\$1240")
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
                SizedBox(height: height*0.02,),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'My Wallet',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF93BEFF),
                        fontSize: 15,
                        fontFamily: 'Archivo',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                    Icon(Icons.arrow_drop_down, color: Color(0xFF93BEFF),)
                  ],
                ),
                SizedBox(height: height*0.02,),
                const Text(
                  'Balance',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFDFDFDF),
                    fontSize: 14,
                    fontFamily: 'Archivo',
                    fontWeight: FontWeight.w300,
                    height: 0,
                  ),
                ),
                SizedBox(height: height*0.04,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      child: Column(
                        children: [
                          Container(
                            width: width*0.13,
                            height: width*0.13,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/receive.png"),
                                  fit: BoxFit.fill,
                                )
                            ),
                          ),
                          const SizedBox(height: 5,),
                          const Text("Receive", style: TextStyle(color: Colors.white),)
                        ],
                      ),
                    ),
                    GestureDetector(
                      child: Column(
                        children: [
                          Container(
                            width: width*0.13,
                            height: width*0.13,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/send.png"),
                                  fit: BoxFit.fill,
                                )
                            ),
                          ),
                          const SizedBox(height: 5,),
                          const Text("Send", style: TextStyle(color: Colors.white),)
                        ],
                      ),
                    ),
                    GestureDetector(
                      child: Column(
                        children: [
                          Container(
                            width: width*0.13,
                            height: width*0.13,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/buy.png"),
                                  fit: BoxFit.fill,
                                )
                            ),
                          ),
                          const SizedBox(height: 5,),
                          const Text("Buy", style: TextStyle(color: Colors.white),)
                        ],
                      ),
                    ),
                    GestureDetector(
                      child: Column(
                        children: [
                          Container(
                            width: width*0.13,
                            height: width*0.13,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/trade.png"),
                                  fit: BoxFit.fill,
                                )
                            ),
                          ),
                          const SizedBox(height: 5,),
                          const Text("Trade", style: TextStyle(color: Colors.white),)
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height*0.03,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 6, height: 6,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        color: Colors.white,
                        borderRadius: const BorderRadius.all(Radius.circular(8)),
                      ),
                    ),
                    const SizedBox(width: 5,),
                    Container(
                      width: 6, height: 6,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        color: Colors.white,
                        borderRadius: const BorderRadius.all(Radius.circular(8)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5,),
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
                      SizedBox(height: height*0.02,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            child: Column(
                              children: [
                                const Text("Coins", style: TextStyle(fontSize: 15, color: Colors.white),),
                                const SizedBox(height: 3,),
                                selectCoins ? Container(
                                  width: width*0.2, height: 3,
                                  color: const Color(0xff74ABFF),
                                ) : Container()
                              ],
                            ),
                            onTap: (){
                              setState(() {
                                selectCoins = true;
                              });
                            },
                          ),
                          SizedBox(width: width*0.2,),
                          GestureDetector(
                            child: Column(
                              children: [
                                const Text("Transactions", style: TextStyle(fontSize: 15, color: Colors.white),),
                                const SizedBox(height: 3,),
                                !selectCoins? Container(
                                  width: width*0.2, height: 3,
                                  color: const Color(0xff74ABFF),
                                ) : Container()
                              ],
                            ),
                            onTap: (){
                              setState(() {
                                selectCoins = false;
                              });
                            },
                          ),
                        ],
                      ),
                      Container(
                        width: width*0.9, height: 1,
                        color: const Color(0xff7A7F87),
                      ),
                      SizedBox(height: height*0.02,),
                      Container(
                        height: 40,
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
                              borderSide: BorderSide(color: Color(0xff25395B), width: 1.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(30)),
                              borderSide: BorderSide(color: Color(0xff25395B), width: 1.0),
                            ),
                            filled: true,
                            fillColor: Color(0xff25395B),
                            prefixIcon: Icon(Icons.search_rounded, color: Color(0xFFCACACA),),
                          ),
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                      SizedBox(height: height*0.02,),
                      Visibility(
                        visible: selectCoins,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: width*0.06),
                                  child: const Text(
                                    'Name',
                                    style: TextStyle(
                                      color: Color(0xFFD5D5D5),
                                      fontSize: 15,
                                      fontFamily: 'Arial',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: width*0.06),
                                  child: const Text(
                                    'Holdings',
                                    style: TextStyle(
                                      color: Color(0xFFD5D5D5),
                                      fontSize: 15,
                                      fontFamily: 'Arial',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5,),
                            SizedBox(
                              child: ListView.builder(
                                key: UniqueKey(),
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    margin: const EdgeInsets.only(bottom: 10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(width: width*0.05,),
                                            SizedBox(
                                              width: 40, height: 40,
                                              child: Image.asset(coins[index].icon,),
                                            ),
                                            const SizedBox(width: 10,),
                                            Text("${coins[index].name}\n${coins[index].type}",
                                              style: TextStyle(color: Colors.white),),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Column(
                                              children: [
                                                Text("${coins[index].amount}", style: TextStyle(color: Colors.white),),
                                                Text("${coins[index].usdAmount}", style: TextStyle(color: Colors.greenAccent),),
                                              ],
                                            ),
                                            SizedBox(width: width*0.05,)
                                          ],
                                        )
                                      ],
                                    ),
                                  );
                                },
                                itemCount: coins.length,
                              ),
                            )
                          ],
                        ),
                      ),
                      Visibility(
                        visible: !selectCoins,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: width*0.06),
                                  child: const Text(
                                    'Name',
                                    style: TextStyle(
                                      color: Color(0xFFD5D5D5),
                                      fontSize: 15,
                                      fontFamily: 'Arial',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: width*0.06),
                                  child: const Text(
                                    'Amount',
                                    style: TextStyle(
                                      color: Color(0xFFD5D5D5),
                                      fontSize: 15,
                                      fontFamily: 'Arial',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10,),
                            SizedBox(
                              height: height*0.4,
                              child: ListView.builder(
                                key: UniqueKey(),
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    margin: const EdgeInsets.only(bottom: 15),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(width: width*0.05,),
                                            Text("${coins[index].name}  (${coins[index].type})",
                                              style: const TextStyle(color: Colors.white),),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Column(
                                              children: [
                                                Text(coins[index].amount, style: const TextStyle(color: Colors.white),),
                                              ],
                                            ),
                                            SizedBox(width: width*0.05,)
                                          ],
                                        )
                                      ],
                                    ),
                                  );
                                },
                                itemCount: 2,
                              ),
                            )
                          ],
                        ),
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
