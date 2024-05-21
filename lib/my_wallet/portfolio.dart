import 'package:flutter/material.dart';
import 'package:stone_wallet/models/portfolio_model.dart';
import 'package:stone_wallet/welcomPage.dart';

import '../models/coin_model.dart';

class PortfolioPage extends StatefulWidget {
  // const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {

  late TextEditingController searchController = TextEditingController();

  List<PortfolioModel> portfolios = [
    PortfolioModel(name: "Cash", image: "assets/cash.png", amount: "\$200.89"),
    PortfolioModel(name: "Gold", image: "assets/gold stack.png", amount: "\$26000.99"),
    PortfolioModel(name: "Cars", image: "assets/car.png", amount: "\$3000.89"),
    PortfolioModel(name: "Watches", image: "assets/watch.png", amount: "\$10.00"),
    PortfolioModel(name: "Diamonds", image: "assets/diamond.png", amount: "\$0.50"),
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 20,),
                      Text(
                        'Portfolio Worth',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontFamily: 'Archivo',
                          fontWeight: FontWeight.w300,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const SizedBox(width: 20,),
                      const Text(
                        '\$97,876.67',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontFamily: 'Archivo',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Image.asset("assets/Group 82.png")
                    ],
                  ),
                  SizedBox(height: height*0.04,),
                  Image.asset("assets/Group 81.png"),
                  SizedBox(height: height*0.03,),
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
                        const Text("Portfolio", style: TextStyle(color: Colors.white),),
                        const SizedBox(height: 8,),
                        Container(width: width*0.15, height: 2, color: const Color(0xff74ABFF),),
                        Container(width: width*0.9, height: 1, color: const Color(0xff7A7F87),),
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
                                borderSide: BorderSide(color: Color(0xff25395B), width: 1.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(30)),
                                borderSide: BorderSide(color: Color(0xff25395B), width: 1.0),
                              ),
                              hintText: "Browse",
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
                                  margin: const EdgeInsets.only(bottom: 30),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(width: width*0.05,),
                                          Image.asset(portfolios[index].image,),
                                          SizedBox(width: width*0.05,),
                                          Text(portfolios[index].name,
                                            style: const TextStyle(color: Color(0xffB9B9B9)),),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(portfolios[index].amount, style: const TextStyle(
                                              color: Colors.white),),
                                          SizedBox(width: width*0.05,)
                                        ],
                                      )
                                    ],
                                  ),
                                );
                              },
                              itemCount: portfolios.length,
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
