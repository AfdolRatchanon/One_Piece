import 'package:flutter/material.dart';
import 'package:one_piece/config/constant.dart';
import 'package:one_piece/models/anyClass.dart';

class googleLogin extends StatefulWidget {
  const googleLogin({Key? key}) : super(key: key);

  @override
  _googleLoginState createState() => _googleLoginState();
}

class _googleLoginState extends State<googleLogin> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundC,
      appBar: AppBar(
        title: Text("Login"),
        backgroundColor: appBarC,
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              btnOtherSize(pColor, () {
                signInwithGoogle(context, 'homePage');
                //Navigator.pushNamed(context, routeName)
              }, "login Google Email ", 20, 20),
            ],
          ),
        ),
      ),
    );
  }
}
