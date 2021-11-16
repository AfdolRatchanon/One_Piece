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
    return Scaffold(
      backgroundColor: backgroundC,
      drawer: checkAuth(),
      appBar: AppBar(
        title: Text(""),
        backgroundColor: appBarC,
      ),
      body: Container(
        child: Text("Google Login"),
      ),
    );
  }
}
