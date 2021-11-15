import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:one_piece/config/constant.dart';
import 'package:one_piece/models/anyClass.dart';

class addAddCharacter extends StatefulWidget {
  const addAddCharacter({Key? key}) : super(key: key);

  @override
  _addAddCharacterState createState() => _addAddCharacterState();
}

class _addAddCharacterState extends State<addAddCharacter> {
  var nameCharacter;
  var urlPicture;
  final formKey = GlobalKey<FormState>();
  final dbFirebase = FirebaseDatabase.instance.reference().child('Group');

  Future<void> createData(dynamic key) async {
    await dbFirebase.child(key).child('character').push().set({
      'nameCharacter': nameCharacter,
      'urlPicture': urlPicture,
    }).then((dynamic value) {
      print(value);
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Add Type Success'),
          content: const Text('You add Data Success'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
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
    final keyIn = ModalRoute.of(context)!.settings.arguments as sendOneKey;
    return Scaffold(
      body: Form(
        key: formKey,
        child: Container(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: Column(
              children: [
                txtnameCharacter(),
                txtUrlPicture(),
                btnSubmit(keyIn.key.toString()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget txtnameCharacter() {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 20, 10, 10),
      child: TextFormField(
        style: TextStyle(
          fontSize: 24.0,
          color: pColor,
        ),
        decoration: InputDecoration(
          labelText: 'character Group:',
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
          nameCharacter = value!.trim();
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

  Widget btnSubmit(dynamic key) => ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: pColor,
        ),
        onPressed: () {
          if (formKey.currentState!.validate()) {
            formKey.currentState!.save();
            createData(key);
            formKey.currentState!.reset();
          }
        },
        child: Text('ADD'),
      );
}
