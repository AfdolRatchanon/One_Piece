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
      drawer: /*testCheckAuth(context, 'character')*/ checkAuth(
          context, 'character'),
      appBar: AppBar(
        title: Text("Character"),
        backgroundColor: appBarC,
      ),
      body: FirebaseAnimatedList(
        query: dbFirebase.child(keyIn.key.toString()).child('character'),
        itemBuilder: (context, snapshot, animation, index) {
          return Column(
            children: [
              viewBtn('${snapshot.value['nameCharacter']}',
                  '${snapshot.value['urlPicture']}', size, 30, () {
                Navigator.pushNamed(context, 'detail',
                    arguments: send18Property(
                      snapshot.value['nameCharacter'],
                      snapshot.value['urlPicture'],
                      snapshot.value['nameEng'],
                      snapshot.value['debut'],
                      snapshot.value['affiliation'],
                      snapshot.value['occupation'],
                      snapshot.value['homeTown'],
                      snapshot.value['nickname'],
                      snapshot.value['birthDate'],
                      snapshot.value['oldYear'],
                      snapshot.value['hight'],
                      snapshot.value['gBlood'],
                      snapshot.value['bounty'],
                      snapshot.value['status'],
                      snapshot.value['dFruitEng'],
                      snapshot.value['dFruitTh'],
                      snapshot.value['powerFruit'],
                      snapshot.value['typeFruit'],
                    ));
              }),
            ],
          );
        },
      ),
    );
  }
}
