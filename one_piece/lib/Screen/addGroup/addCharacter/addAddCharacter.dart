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
  var nameCharacter,
      urlPicture,
      nameEng,
      debut,
      affiliation,
      occupation,
      homeTown,
      nickname,
      birthDate,
      oldYear,
      hight,
      gBlood,
      bounty,
      status,
      dFruitEng,
      dFruitTh,
      powerFruit,
      typeFruit;
  final formKey = GlobalKey<FormState>();
  final dbFirebase = FirebaseDatabase.instance.reference().child('Group');

  Future<void> createData(dynamic key) async {
    await dbFirebase.child(key).child('character').push().set({
      'nameCharacter': nameCharacter,
      'urlPicture': urlPicture,
      'debut': debut,
      'affiliation': affiliation,
      'nameEng': nameEng,
      'occupation': occupation,
      'homeTown': homeTown,
      'nickname': nickname,
      'birthDate': birthDate,
      'oldYear': oldYear,
      'hight': hight,
      'gBlood': gBlood,
      'bounty': bounty,
      'status': status,
      'dFruitEng': dFruitEng,
      'dFruitTh': dFruitTh,
      'powerFruit': powerFruit,
      'typeFruit': typeFruit,
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
                txtFmFd(
                  "ชื่อภาษาไทย",
                  Icon(Icons.account_circle_outlined),
                  "กรุณากรอกชื่อภาษาไทย",
                  (String? value) {
                    nameCharacter = value!.trim();
                  },
                ),
                txtFmFd(
                  "Url Picture",
                  Icon(Icons.image),
                  "กรุณากรอก Url Picture",
                  (String? value) {
                    urlPicture = value!.trim();
                  },
                ),
                txtFmFd(
                  "ชื่อภาษาอังกฤษ",
                  Icon(Icons.account_circle_outlined),
                  "กรุณากรอกชื่อชื่อภาษาอังกฤษ",
                  (String? value) {
                    nameEng = value!.trim();
                  },
                ),
                txtFmFd(
                  "วันเปิดตัว",
                  Icon(Icons.access_time),
                  "กรุณากรอกวันเปิดตัว",
                  (String? value) {
                    debut = value!.trim();
                  },
                ),
                txtFmFd(
                  "สังกัด",
                  Icon(Icons.account_tree_sharp),
                  "กรุณากรอกชื่อชื่อสังกัด",
                  (String? value) {
                    affiliation = value!.trim();
                  },
                ),
                txtFmFd(
                  "อาชีพ",
                  Icon(Icons.apartment_outlined),
                  "กรุณากรอกอาชีพ",
                  (String? value) {
                    occupation = value!.trim();
                  },
                ),
                txtFmFd(
                  "บ้านเกิด",
                  Icon(Icons.home),
                  "กรุณากรอกบ้านเกิด",
                  (String? value) {
                    homeTown = value!.trim();
                  },
                ),
                txtFmFd(
                  "ฉายา",
                  Icon(Icons.home),
                  "กรุณากรอกฉายา",
                  (String? value) {
                    nickname = value!.trim();
                  },
                ),
                txtFmFd(
                  "วันเกิด",
                  Icon(Icons.access_time_filled_outlined),
                  "กรุณากรอกวันเกิด",
                  (String? value) {
                    birthDate = value!.trim();
                  },
                ),
                txtFmFd(
                  "อายุ",
                  Icon(Icons.accessibility_sharp),
                  "กรุณากรอกอายุ",
                  (String? value) {
                    oldYear = value!.trim();
                  },
                ),
                txtFmFd(
                  "ส่วนสูง",
                  Icon(Icons.format_line_spacing_outlined),
                  "กรุณากรอกส่วนสูง",
                  (String? value) {
                    hight = value!.trim();
                  },
                ),
                txtFmFd(
                  "หมู่เลือด",
                  Icon(Icons.assignment_ind),
                  "กรุณากรอกหมู่เลือด",
                  (String? value) {
                    gBlood = value!.trim();
                  },
                ),
                txtFmFd(
                  "ค่าหัว",
                  Icon(Icons.attach_money),
                  "กรุณากรอกค่าหัว",
                  (String? value) {
                    bounty = value!.trim();
                  },
                ),
                txtFmFd(
                  "สถานะ",
                  Icon(Icons.badge_outlined),
                  "กรุณากรอกสถานะ",
                  (String? value) {
                    status = value!.trim();
                  },
                ),
                txtFmFd(
                  "ผลปีศาจ ภาษาอังกฤษ",
                  Icon(Icons.colorize),
                  "กรุณากรอกผลปีศาจ ภาษาอังกฤษ",
                  (String? value) {
                    dFruitEng = value!.trim();
                  },
                ),
                txtFmFd(
                  "ผลปีศาจ ภาษาไทย",
                  Icon(Icons.colorize),
                  "กรุณากรอกผลปีศาจ ภาษาไทย",
                  (String? value) {
                    dFruitTh = value!.trim();
                  },
                ),
                txtFmFd(
                  "พลังผลปีศาจ",
                  Icon(Icons.colorize),
                  "กรุณากรอกพลังผลปีศาจ",
                  (String? value) {
                    powerFruit = value!.trim();
                  },
                ),
                txtFmFd(
                  "สายผลปีศาจ",
                  Icon(Icons.flash_on),
                  "กรุณากรอกสายผลปีศาจ",
                  (String? value) {
                    typeFruit = value!.trim();
                  },
                ),
                btnSubmit(keyIn.key.toString()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget txtFmFd(String title, Icon icon, String hintText, dynamic varOnSave) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 20, 10, 10),
      child: TextFormField(
        style: TextStyle(
          fontSize: 24.0,
          color: pColor,
        ),
        decoration: InputDecoration(
          labelText: title,
          icon: icon,
          hintText: hintText,
        ),
        validator: (String? value) {
          if (value!.isEmpty) {
            return 'กรุณากรอกข้อมูล';
          } else if (value.length < 1) {
            return "กรุณากรอกข้อมูลมากกว่า 1 ตัวอักษร";
          }
        },
        onSaved: varOnSave,
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
