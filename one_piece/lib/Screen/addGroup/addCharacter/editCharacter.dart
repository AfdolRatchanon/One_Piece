import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:one_piece/config/constant.dart';
import 'package:one_piece/models/anyClass.dart';

class editCharecter extends StatefulWidget {
  const editCharecter({Key? key}) : super(key: key);

  @override
  _editCharecterState createState() => _editCharecterState();
}

class _editCharecterState extends State<editCharecter> {
  Future<void> updateData(String pKey, String sKey, dynamic db,
      String nameCharacter, String urlPicture) async {
    //print(nameCharacter);
    //print(urlPicture);
    try {
      await db.child(pKey).child('character').child(sKey).update({
        'nameCharacter': nameCharacter,
        'urlPicture': urlPicture,
      }).then((value) {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Edit Group Success'),
            content: const Text('You Edit Data Success'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context, 'OK');
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }).catchError((onError) {
        print(onError.code);
        print(onError.massage);
      });
    } catch (e) {
      print(e);
    }
  }

  var nameCharacter;
  var urlPicture;
  final addTypeKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final keyIn =
        ModalRoute.of(context)!.settings.arguments as sendTwoKeyTwoProperty;
    final dbFirebase = FirebaseDatabase.instance.reference().child('Group');
    return Scaffold(
      backgroundColor: backgroundC,
      drawer: drawerAppBar(),
      appBar: AppBar(
        title: Text(""),
        backgroundColor: appBarC,
      ),
      body: Column(
        children: [
          Form(
            key: addTypeKey,
            child: Container(
              child: Container(
                padding: EdgeInsets.all(5.0),
                margin: EdgeInsets.all(5.0),
                color: LabelWhC,
                child: Column(
                  children: [
                    TextFormField(
                      style: TextStyle(
                        fontSize: 24.0,
                        color: pColor,
                      ),
                      decoration: InputDecoration(
                        labelText: 'Character Name',
                        icon: Icon(Icons.edit_attributes_outlined),
                        hintText: 'Input your nameCharacter',
                      ),
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'กรุณากรอกชื่อปรเเภท';
                        } else if (value.length < 1) {
                          return "กรุณากรอกข้อมูลมากกว่า 1 ตัวอักษร";
                        }
                      },
                      onSaved: (String? value) {
                        nameCharacter = value!.trim();
                      },
                      initialValue: keyIn.name.toString(),
                    ),
                    TextFormField(
                      style: TextStyle(
                        fontSize: 24.0,
                        color: pColor,
                      ),
                      decoration: InputDecoration(
                        labelText: 'Url Picture',
                        icon: Icon(Icons.edit_attributes_outlined),
                        hintText: 'Input your urlPicture',
                      ),
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'กรุณากรอกชื่อปรเเภท';
                        } else if (value.length < 1) {
                          return "กรุณากรอกข้อมูลมากกว่า 1 ตัวอักษร";
                        }
                      },
                      onSaved: (String? value) {
                        urlPicture = value!.trim();
                      },
                      initialValue: keyIn.url.toString(),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: pColor,
                      ),
                      onPressed: () {
                        print(keyIn.pKey.toString());
                        if (addTypeKey.currentState!.validate()) {
                          addTypeKey.currentState!.save();
                          updateData(
                              keyIn.pKey.toString(),
                              keyIn.sKey.toString(),
                              dbFirebase,
                              nameCharacter,
                              urlPicture);
                          //addTypeKey.currentState!.reset();
                          //addTypeKey.currentState!.toString();
                        }
                      },
                      child: Text('Update'),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
