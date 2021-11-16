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
  Future<void> updateData(
    String? pKey,
    String? sKey,
    dynamic db,
    String? nameCharacter,
    String? nameEng,
    String? debut,
    String? affiliation,
    String? occupation,
    String? homeTown,
    String? nickname,
    String? birthDate,
    String? oldYear,
    String? hight,
    String? gBlood,
    String? bounty,
    String? status,
    String? dFruitEng,
    String? dFruitTh,
    String? powerFruit,
    String? typeFruit,
  ) async {
    try {
      await db.child(pKey).child('character').child(sKey).update({
        'nameCharacter': nameCharacter,
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
  final addTypeKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final keyIn =
        ModalRoute.of(context)!.settings.arguments as sendTwoKey18Property;
    final dbFirebase = FirebaseDatabase.instance.reference().child('Group');
    return Scaffold(
      backgroundColor: backgroundC,
      drawer: drawerAppBar(),
      appBar: AppBar(
        title: Text(""),
        backgroundColor: appBarC,
      ),
      body: SingleChildScrollView(
        child: Column(
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
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: sColor,
                        ),
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            'editPictureCharacter',
                            arguments: sendTwoKeyTwoProperty(
                              keyIn.pKey,
                              keyIn.sKey,
                              keyIn.nameCharacter,
                              keyIn.urlPicture,
                            ),
                          );
                        },
                        child: Text('Upload Picture Character'),
                      ),
                      txtFmFdIv(
                          "ชื่อภาษาไทย",
                          Icon(Icons.account_circle_outlined),
                          "กรุณากรอกชื่อภาษาไทย", (String? value) {
                        nameCharacter = value!.trim();
                      }, keyIn.nameCharacter.toString()),
                      txtFmFdIv(
                          "ชื่อภาษาอังกฤษ",
                          Icon(Icons.account_circle_outlined),
                          "กรุณากรอกชื่อชื่อภาษาอังกฤษ", (String? value) {
                        nameEng = value!.trim();
                      }, keyIn.nameEng),
                      txtFmFdIv("วันเปิดตัว", Icon(Icons.access_time),
                          "กรุณากรอกวันเปิดตัว", (String? value) {
                        debut = value!.trim();
                      }, keyIn.debut),
                      txtFmFdIv("สังกัด", Icon(Icons.account_tree_sharp),
                          "กรุณากรอกชื่อชื่อสังกัด", (String? value) {
                        affiliation = value!.trim();
                      }, keyIn.affiliation),
                      txtFmFdIv("อาชีพ", Icon(Icons.apartment_outlined),
                          "กรุณากรอกอาชีพ", (String? value) {
                        occupation = value!.trim();
                      }, keyIn.occupation),
                      txtFmFdIv(
                          "บ้านเกิด", Icon(Icons.home), "กรุณากรอกบ้านเกิด",
                          (String? value) {
                        homeTown = value!.trim();
                      }, keyIn.homeTown),
                      txtFmFdIv("ฉายา", Icon(Icons.home), "กรุณากรอกฉายา",
                          (String? value) {
                        nickname = value!.trim();
                      }, keyIn.nickname),
                      txtFmFdIv(
                          "วันเกิด",
                          Icon(Icons.access_time_filled_outlined),
                          "กรุณากรอกวันเกิด", (String? value) {
                        birthDate = value!.trim();
                      }, keyIn.birthDate),
                      txtFmFdIv("อายุ", Icon(Icons.accessibility_sharp),
                          "กรุณากรอกอายุ", (String? value) {
                        oldYear = value!.trim();
                      }, keyIn.oldYear),
                      txtFmFdIv(
                          "ส่วนสูง",
                          Icon(Icons.format_line_spacing_outlined),
                          "กรุณากรอกส่วนสูง", (String? value) {
                        hight = value!.trim();
                      }, keyIn.hight),
                      txtFmFdIv("หมู่เลือด", Icon(Icons.assignment_ind),
                          "กรุณากรอกหมู่เลือด", (String? value) {
                        gBlood = value!.trim();
                      }, keyIn.gBlood),
                      txtFmFdIv(
                          "ค่าหัว", Icon(Icons.attach_money), "กรุณากรอกค่าหัว",
                          (String? value) {
                        bounty = value!.trim();
                      }, keyIn.bounty),
                      txtFmFdIv(
                          "สถานะ", Icon(Icons.badge_outlined), "กรุณากรอกสถานะ",
                          (String? value) {
                        status = value!.trim();
                      }, keyIn.status),
                      txtFmFdIv("ผลปีศาจ ภาษาอังกฤษ", Icon(Icons.colorize),
                          "กรุณากรอกผลปีศาจ ภาษาอังกฤษ", (String? value) {
                        dFruitEng = value!.trim();
                      }, keyIn.dFruitEng),
                      txtFmFdIv("ผลปีศาจ ภาษาไทย", Icon(Icons.colorize),
                          "กรุณากรอกผลปีศาจ ภาษาไทย", (String? value) {
                        dFruitTh = value!.trim();
                      }, keyIn.dFruitTh),
                      txtFmFdIv("พลังผลปีศาจ", Icon(Icons.colorize),
                          "กรุณากรอกพลังผลปีศาจ", (String? value) {
                        powerFruit = value!.trim();
                      }, keyIn.powerFruit),
                      txtFmFdIv("สายผลปีศาจ", Icon(Icons.flash_on),
                          "กรุณากรอกสายผลปีศาจ", (String? value) {
                        typeFruit = value!.trim();
                      }, keyIn.typeFruit),
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
                                typeFruit);
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
      ),
    );
  }
}
