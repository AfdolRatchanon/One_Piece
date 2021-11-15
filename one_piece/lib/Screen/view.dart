import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:one_piece/config/constant.dart';
import 'package:one_piece/models/anyClass.dart';

class view extends StatefulWidget {
  const view({Key? key}) : super(key: key);

  @override
  _viewState createState() => _viewState();
}

class _viewState extends State<view> {
  dynamic keyType;
  final dbFirebase = FirebaseDatabase.instance.reference().child("Group");
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundC,
      drawer: drawerAppBar(),
      appBar: AppBar(
        title: Text(""),
        backgroundColor: appBarC,
      ),
      body: FirebaseAnimatedList(
        query: dbFirebase,
        itemBuilder: (context, snapshot, animation, index) {
          return Column(
            children: [
              viewBtn('${snapshot.value['nameGroup']}',
                  '${snapshot.value['urlPicture']}', size, 30, () {
                Navigator.pushNamed(context, 'character',
                    arguments: sendOneKey(snapshot.key.toString()));
              }),
            ],
          );
        },
      ),
    );
  }
}
