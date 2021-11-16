import 'package:flutter/material.dart';
import 'package:one_piece/config/constant.dart';
import 'package:one_piece/models/anyClass.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundC,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(size.height * 0.01),
          height: size.height,
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.05,
              ),
              Container(
                //margin: EdgeInsets.all(10),
                child: Image.network(
                    'https://logolook.net/wp-content/uploads/2021/08/One-Piece-Logo.png'),
              ),
              SizedBox(
                height: size.height * 0.45,
              ),
              btnOtherSize(pColor, () {
                Navigator.pushNamed(context, 'index');
              }, "เข้าสู่โลกของโจรสลัด", 20, 20),
            ],
          ),
        ),
      ),
    );
  }
}
