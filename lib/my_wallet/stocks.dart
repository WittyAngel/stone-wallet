import 'package:flutter/material.dart';
import 'package:stone_wallet/models/stocks_model.dart';
import 'package:stone_wallet/welcomPage.dart';

import '../models/coin_model.dart';

class StocksPage extends StatefulWidget {
  // const StocksPage({super.key});

  @override
  State<StocksPage> createState() => _StocksPageState();
}

class _StocksPageState extends State<StocksPage> {

  bool selectCoins = true;
  TextEditingController searchController = TextEditingController();
  List<StocksModel> stocks = [
    StocksModel(name: "Dow Jones", description: "Dow Jones Industrial Average", image: "assets/Group 79.png", amount: "34,396.63", add_minus_amount: "+135.21"),
    StocksModel(name: "S&P 500", description: "Standard & Poor’s 500", image: "assets/Group 78.png", amount: "4,478.52", add_minus_amount: "+39.25"),
    StocksModel(name: "AXP", description: "American Express Company", image: "assets/Group 77.png", amount: "34,396.63", add_minus_amount: "+135.21"),
    StocksModel(name: "GE", description: "General Electric Company", image: "assets/Group 76.png", amount: "111.24", add_minus_amount: "-1.21"),
    StocksModel(name: "IBM", description: "Dow Jones Industrial Average", image: "assets/Group 75.png", amount: "133.23", add_minus_amount: "+0.02"),
    StocksModel(name: "NKE", description: "NIKE. Inc.", image: "assets/Group 74.png", amount: "108.08", add_minus_amount: "+0.02"),
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
            height: height,
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
                      'Stocks',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF93BEFF),
                        fontSize: 15,
                        fontFamily: 'Archivo',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height*0.01,),
                Container(
                  height: 2, width: width*0.2,
                  color: const Color(0xff74ABFF),
                ),
                Container(
                  height: 1, width: width*0.9,
                  color: const Color(0xff7A7F87),
                ),
                SizedBox(height: height*0.04,),
                Container(
                  height: height*0.8,
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
                              borderSide: BorderSide(color: Color(0xff25395B), width: 1.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(30)),
                              borderSide: BorderSide(color: Color(0xff25395B), width: 1.0),
                            ),
                            hintText: "Stocks",
                            hintStyle: TextStyle(color: Colors.white),
                            filled: true,
                            fillColor: Color(0xff25395B),
                            prefixIcon: Icon(Icons.search_rounded, color: Color(0xFFCACACA),),
                          ),
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                      SizedBox(height: height*0.02,),
                      Column(
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
                                  'Sep 26',
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
                          SizedBox(height: height*0.03,),
                          ListView.builder(
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
                                        const SizedBox(width: 10,),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("${stocks[index].name}}",
                                              style: const TextStyle(color: Colors.white),),
                                            Text(stocks[index].description,
                                              style: const TextStyle(color: Colors.white, fontSize: 12),),
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      width: width*0.15, height: 60,
                                      child: Image.asset(stocks[index].image,),
                                    ),
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            Text(stocks[index].amount, style: const TextStyle(
                                                color: Colors.white),),
                                            Container(
                                              decoration: BoxDecoration(
                                                color: stocks[index].add_minus_amount.contains("+")? const Color(0xff00ff00) : Colors.red,
                                                borderRadius: const BorderRadius.all(Radius.circular(8)),
                                              ),
                                              padding: const EdgeInsets.all(3),
                                              child:  Text(stocks[index].add_minus_amount,
                                                style: const TextStyle(color: Colors.white),),
                                            )
                                          ],
                                        ),
                                        SizedBox(width: width*0.05,)
                                      ],
                                    )
                                  ],
                                ),
                              );
                            },
                            itemCount: stocks.length,
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
