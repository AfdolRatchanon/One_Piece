import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:one_piece/Screen/View.dart';
import 'package:one_piece/Screen/addGroup.dart';
import 'package:one_piece/Screen/addGroup/addAddGroup.dart';
import 'package:one_piece/Screen/addGroup/addCharacter.dart';
import 'package:one_piece/Screen/addGroup/addCharacter/addAddCharacter.dart';
import 'package:one_piece/Screen/addGroup/addCharacter/editCharacter.dart';
import 'package:one_piece/Screen/addGroup/addCharacter/editPictureCharacter.dart';
import 'package:one_piece/Screen/addGroup/addCharacter/viewCharacter.dart';
import 'package:one_piece/Screen/addGroup/editGroup.dart';
import 'package:one_piece/Screen/addGroup/editPictureGroup.dart';
import 'package:one_piece/Screen/addGroup/viewGroup.dart';
import 'package:one_piece/Screen/charecter.dart';
import 'package:one_piece/Screen/detail.dart';
import 'package:one_piece/Screen/googleLogin.dart';
import 'package:one_piece/Screen/index.dart';

Future<void> main() async {
  // เปิด Connection ไปที่ Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // Run App
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: index(),
      routes: {
        'index': (context) => index(),
        'view': (context) => view(),
        'addGroup': (context) => addGroup(),
        'editGroup': (context) => editGroup(),
        'addAddGroup': (context) => addAddGroup(),
        'viewGroup': (context) => viewGroup(),
        'addCharacter': (context) => addCharacter(),
        'viewCharacter': (context) => viewCharacter(),
        'addAddCharacter': (context) => addAddCharacter(),
        'editCharacter': (context) => editCharecter(),
        'character': (context) => character(),
        'detail': (context) => detail(),
        'editPictureGroup': (context) => editPictureGroup(),
        'editPictureCharacter': (context) => editPictureCharacter(),
        'googleLogin': (context) => googleLogin(),
      },
    );
  }
}
