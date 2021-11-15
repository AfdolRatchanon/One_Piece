import 'package:flutter/material.dart';
import 'package:one_piece/Screen/addGroup/addAddGroup.dart';
import 'package:one_piece/Screen/addGroup/editGroup.dart';
import 'package:one_piece/Screen/addGroup/viewGroup.dart';
import 'package:one_piece/config/constant.dart';

class addGroup extends StatefulWidget {
  const addGroup({Key? key}) : super(key: key);

  @override
  _addGroupState createState() => _addGroupState();
}

class _addGroupState extends State<addGroup> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("AddGorup"),
          backgroundColor: appBarC,
        ),
        body: TabBarView(children: [
          viewGroup(),
          addAddGroup(),
        ]),
        bottomNavigationBar: Container(
          color: Colors.amber,
          child: TabBar(
            indicatorColor: Colors.black,
            labelColor: LabelWhC,
            tabs: [
              Tab(
                text: "View Group",
              ),
              Tab(
                text: "Add Group",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
