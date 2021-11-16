import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:one_piece/config/constant.dart';

class addAddGroup extends StatefulWidget {
  const addAddGroup({Key? key}) : super(key: key);

  @override
  _addAddGroupState createState() => _addAddGroupState();
}

class _addAddGroupState extends State<addAddGroup> {
  var nameGroup;
  var urlPicture;
  final formKey = GlobalKey<FormState>();
  final dbFirebase = FirebaseDatabase.instance.reference().child('Group');

  Future<void> createData() async {
    await dbFirebase.push().set({
      'nameGroup': nameGroup,
      'urlPicture': 'null',
    }).then((dynamic value) {
      print(value);
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Add Type Success'),
          content: const Text('You add Data Success'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context, 'OK');
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }).catchError((onError) {
      print(onError.code);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Container(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: Column(
              children: [
                txtNameGroup(),
                //txtUrlPicture(),
                btnSubmit(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget txtNameGroup() {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 20, 10, 10),
      child: TextFormField(
        style: TextStyle(
          fontSize: 24.0,
          color: pColor,
        ),
        decoration: InputDecoration(
          labelText: 'Name Group:',
          icon: Icon(Icons.account_circle_outlined),
          hintText: 'Input your Name Group',
        ),
        validator: (String? value) {
          if (value!.isEmpty) {
            return 'กรุณากรอกชื่อปรเเภท';
          } else if (value.length < 2) {
            return "กรุณากรอกข้อมูลมากกว่า 2 ตัวอักษร";
          }
        },
        onSaved: (String? value) {
          nameGroup = value!.trim();
        },
      ),
    );
  }

  Widget txtUrlPicture() {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 20, 10, 10),
      child: TextFormField(
        style: TextStyle(
          fontSize: 24.0,
          color: pColor,
        ),
        decoration: InputDecoration(
          labelText: 'Url Picture:',
          icon: Icon(Icons.account_circle_outlined),
          hintText: 'Input your Url Picture',
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
      ),
    );
  }

  Widget btnSubmit() => ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: pColor,
        ),
        onPressed: () {
          if (formKey.currentState!.validate()) {
            formKey.currentState!.save();
            createData();
            formKey.currentState!.reset();
          }
        },
        child: Text('ADD'),
      );
}
