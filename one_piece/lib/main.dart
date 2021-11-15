import 'package:flutter/material.dart';
import 'package:one_piece/Screen/View.dart';
import 'package:one_piece/Screen/addGroup.dart';
import 'package:one_piece/Screen/addGroup/addAddGroup.dart';
import 'package:one_piece/Screen/addGroup/addCharacter.dart';
import 'package:one_piece/Screen/addGroup/addCharacter/addAddCharacter.dart';
import 'package:one_piece/Screen/addGroup/addCharacter/editCharacter.dart';
import 'package:one_piece/Screen/addGroup/addCharacter/viewCharacter.dart';
import 'package:one_piece/Screen/addGroup/editGroup.dart';
import 'package:one_piece/Screen/addGroup/viewGroup.dart';
import 'package:one_piece/Screen/charecter.dart';
import 'package:one_piece/Screen/index.dart';

void main() {
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
        'addAddGroup': (contex) => addAddGroup(),
        'viewGroup': (contex) => viewGroup(),
        'addCharacter': (contex) => addCharacter(),
        'viewCharacter': (contex) => viewCharacter(),
        'addAddCharacter': (contex) => addAddCharacter(),
        'editCharacter': (contex) => editCharecter(),
        'character': (contex) => character(),
      },
    );
  }
}
