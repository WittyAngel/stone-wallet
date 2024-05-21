import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stone_wallet/termsPage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stone Wallet',
      home: TermsOfPage(),
      routes: <String, WidgetBuilder>{
        '/Home': (BuildContext context) => TermsOfPage(),
      },
      theme: ThemeData(
        primaryColor: Colors.white,
        // Add the line below to get horizontal sliding transitions for routes.
        pageTransitionsTheme: const PageTransitionsTheme(builders: {TargetPlatform.android: CupertinoPageTransitionsBuilder(),}),
      ),
    );
  }
}