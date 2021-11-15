import 'package:flutter/material.dart';
import 'package:one_piece/Screen/addGroup/addCharacter/addAddCharacter.dart';
import 'package:one_piece/Screen/addGroup/addCharacter/viewCharacter.dart';
import 'package:one_piece/config/constant.dart';

class addCharacter extends StatefulWidget {
  const addCharacter({Key? key}) : super(key: key);

  @override
  _addCharacterState createState() => _addCharacterState();
}

class _addCharacterState extends State<addCharacter> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("AddCharacter"),
          backgroundColor: appBarC,
        ),
        body: TabBarView(children: [
          viewCharacter(),
          addAddCharacter(),
        ]),
        bottomNavigationBar: Container(
          color: Colors.amber,
          child: TabBar(
            indicatorColor: Colors.black,
            labelColor: LabelWhC,
            tabs: [
              Tab(
                text: "View Charector",
              ),
              Tab(
                text: "Add Charector",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
