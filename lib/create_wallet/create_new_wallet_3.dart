import 'dart:convert';
import 'dart:io';
import 'package:coingecko_api/coingecko_api.dart';
import 'package:crypto/crypto.dart';
import 'package:external_path/external_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stone_wallet/global.dart';
import 'package:stone_wallet/models/key_model.dart';
import 'package:web3dart/web3dart.dart';
import 'create_new_wallet_2.dart';
import 'create_new_wallet_4.dart';
import 'package:provider/provider.dart';
import 'package:bip39/bip39.dart' as bip39;
import 'package:hex/hex.dart';
import 'package:ed25519_hd_key/ed25519_hd_key.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class CreateNewWalletPage3 extends StatefulWidget {
  // const CreateNewWalletPage3({super.key});

  @override
  State<CreateNewWalletPage3> createState() => _CreateNewWalletPage3State();
}

class _CreateNewWalletPage3State extends State<CreateNewWalletPage3> {

  late TextEditingController searchController = TextEditingController();
  bool visibility = false;
  String? mnemonic;
  String? privateKey;
  String? publicKey;
  String? publicAddress;

  Web3Client? client;

  String generateMnemonic() {
    return bip39.generateMnemonic();
  }

  getPrivateKey(String mnemonic) async {
    final seed = bip39.mnemonicToSeed(mnemonic);
    final master = await ED25519_HD_KEY.getMasterKeyFromSeed(seed);
    privateKey = await HEX.encode(master.key);
    getPublicKey(privateKey!);
  }
  Future<Map<String, dynamic>> fetchMoneroInfo() async {
    final response = await http.get(
      Uri.parse('https://api.coinpaprika.com/v1/tickers/xmr-monero'),
    );

    print(response.statusCode);
    if (response.statusCode == 200) {
      print(response.body);
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load Monero information');
    }
  }
  getPublicKey(String privateKey) async{
    final private = EthPrivateKey.fromHex(privateKey);
    publicKey = await private.address.toString();
    print(publicKey);//rinkeby.infura.io/v3
    String rpcUrl = 'https://rpc.ankr.com/eth_goerli';
    final credentials = EthPrivateKey.fromHex(privateKey);
    final client = Web3Client(rpcUrl, http.Client());
    final address = credentials.address;
    print(address);
    final balance = await client.getBalance(address);
    debugPrint("Balance, ${balance}");
  }
  loadKeys() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    privateKey = prefs.getString('privateKey');
    publicKey = prefs.getString('publicKey');
    mnemonic = prefs.getString('mnemonic');
  }
  setKeys() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('privateKey', privateKey!);
    prefs.setString('publicKey', publicKey!);
    prefs.setString('mnemonic', mnemonic!);
  }
  getCoin() async {
    CoinGeckoApi api = CoinGeckoApi();
    final result = await api.coins.getCoinOHLC(
      id: 'monero',
      vsCurrency: 'usd',
      days: 7,
    );
    if (!result.isError) {
      print('getCoinOHLC method returned result');
      result.data.forEach(
            (item) => print(
          '${item.timestamp}: open = ${item.open}, high = ${item.high}, low = ${item.low}, close = ${item.close}',
        ),
      );
    } else {
      print('getCoinOHLC method returned error ${result.errorCode}: ${result.errorMessage}');
    }
  }
  getkeys() async {
    var url = Uri.parse("http://95.217.91.73:3000/create");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    http.get(url).then((http.Response response){
      if(response.statusCode == 200){
        final jsonResponse = json.decode(response.body);
        KeyModel resultData = KeyModel.fromJson(jsonResponse);
        setState(() {
          List<String> temp = resultData.privateKey.split(" ");
          print(temp.length);
          mnemonic = temp.take(12).join("  ");
          publicAddress = resultData.publicKey;
          prefs.setString('publicAddress', publicAddress!);
          prefs.setString('seed', mnemonic!);
          print(mnemonic);
          print(publicAddress);
        });
      }
    });
  }
  saveFile(String text) async {
    var paths = await ExternalPath.getExternalStorageDirectories();
    Directory dir = Directory(paths[0]);
    List<FileSystemEntity> lister = await dir.list(recursive: false).toList();

    final file = File('${lister.first.path}/seed.txt');
    file.writeAsString(text).then((value) {
      alert("your seed file saved to ${file.path}");
    });
  }
  copyFile() async {
    Clipboard.setData(ClipboardData(text: mnemonic!)).then((_){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("your seed copied to clipboard")));
    });  }
  @override
  void initState() {
    getkeys();
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
            // height: height,
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
                    margin: EdgeInsets.only(left: 30),
                    child: Icon(Icons.arrow_back_ios, color: Color(0xff94BFFF),),
                  ),
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)
                      => CreateNewWalletPage2()),
                    );
                  },
                ),
                Container(
                  width: width,
                  height: height,
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
                      SizedBox(height: height*0.04,),
                      Container(
                          width: width*0.2,
                          height: width*0.18,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/shield.png"),
                                fit: BoxFit.fill,
                              )
                          )
                      ),
                      SizedBox(height: height*0.05,),
                      const Text(
                        'Your Secret Phrase is this, keep it protected!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF93BEFF),
                          fontSize: 15,
                          fontFamily: 'Archivo',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                      SizedBox(height: height*0.07,),
                      Container(
                        width: width*0.8,
                        child: Text(
                          mnemonic == null ? "" : mnemonic!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: 'Archivo',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                      ),
                      SizedBox(height: height*0.05,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            child: Container(
                              width: width*0.35,
                              height: 60,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/copy_button.png"),
                                  fit: BoxFit.fill,
                                )
                              ),
                              alignment: Alignment.center,
                              child: const Text(
                                'Save',
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
                              // saveFile(mnemonic!);
                            },
                          ),
                          SizedBox(width: width*0.1,),
                          GestureDetector(
                            child: Container(
                              width: width*0.35,
                              height: 60,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/save_button.png"),
                                    fit: BoxFit.fill,
                                  )
                              ),
                              alignment: Alignment.center,
                              child: const Text(
                                'Copy',
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
                              // copyFile();
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: height*0.14,),
                      Container(
                        width: width*0.8,
                        child: const Text(
                          'On the Next Page you’ll see these 12 words scrambled arrange them in order to verify',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w300,
                            height: 0,
                            letterSpacing: 0.50,
                          ),
                        ),
                      ),
                      SizedBox(height: height*0.02,),
                      GestureDetector(
                        child: Container(
                          width: width*0.8,
                          height: height*0.09,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/next.png"),
                                fit: BoxFit.fill,
                              )
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            'Next',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'Archivo',
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ),
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context)
                            =>  CreateNewWalletPage4(seed: mnemonic!.split("  "),)),
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
