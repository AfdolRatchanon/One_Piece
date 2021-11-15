import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:one_piece/config/constant.dart';
import 'package:one_piece/models/anyClass.dart';

class character extends StatefulWidget {
  const character({Key? key}) : super(key: key);

  @override
  _characterState createState() => _characterState();
}

class _characterState extends State<character> {
  dynamic keyType;
  final dbFirebase = FirebaseDatabase.instance.reference().child("Group");
  @override
  Widget build(BuildContext context) {
    final keyIn = ModalRoute.of(context)!.settings.arguments as sendOneKey;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundC,
      drawer: drawerAppBar(),
      appBar: AppBar(
        title: Text(""),
        backgroundColor: appBarC,
      ),
      body: FirebaseAnimatedList(
        query: dbFirebase.child(keyIn.key.toString()).child('character'),
        itemBuilder: (context, snapshot, animation, index) {
          return Column(
            children: [
              viewBtn('${snapshot.value['nameCharacter']}',
                  '${snapshot.value['urlPicture']}', size, 30, () {}),
            ],
          );
        },
      ),
    );
  }
}
