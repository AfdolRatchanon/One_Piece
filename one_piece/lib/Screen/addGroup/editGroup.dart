import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:one_piece/config/constant.dart';
import 'package:one_piece/models/anyClass.dart';

class editGroup extends StatefulWidget {
  const editGroup({Key? key}) : super(key: key);

  @override
  _editGroupState createState() => _editGroupState();
}

class _editGroupState extends State<editGroup> {
  Future<void> updateData(
      String keyType, dynamic db, String nameGroup, String urlPicture) async {
    //print(nameGroup);
    //print(urlPicture);
    try {
      await db.child(keyType).update({
        'nameGroup': nameGroup,
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

  var nameGroup;
  var urlPicture;
  final addTypeKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final dataIn =
        ModalRoute.of(context)!.settings.arguments as sendOneKeyTwoProperty;
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
                        labelText: 'Group Name',
                        icon: Icon(Icons.edit_attributes_outlined),
                        hintText: 'Input your nameGroup',
                      ),
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'กรุณากรอกชื่อปรเเภท';
                        } else if (value.length < 1) {
                          return "กรุณากรอกข้อมูลมากกว่า 1 ตัวอักษร";
                        }
                      },
                      onSaved: (String? value) {
                        nameGroup = value!.trim();
                      },
                      initialValue: dataIn.name.toString(),
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
                      initialValue: dataIn.url.toString(),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: pColor,
                      ),
                      onPressed: () {
                        print(dataIn.key.toString());
                        if (addTypeKey.currentState!.validate()) {
                          addTypeKey.currentState!.save();
                          updateData(dataIn.key.toString(), dbFirebase,
                              nameGroup, urlPicture);
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
