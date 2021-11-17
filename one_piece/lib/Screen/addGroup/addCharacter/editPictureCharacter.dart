import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:one_piece/config/constant.dart';
import 'package:one_piece/models/anyClass.dart';
import 'package:path/path.dart' as path;

class editPictureCharacter extends StatefulWidget {
  const editPictureCharacter({Key? key}) : super(key: key);

  @override
  _editPictureCharacterState createState() => _editPictureCharacterState();
}

class _editPictureCharacterState extends State<editPictureCharacter> {
  FirebaseStorage storage = FirebaseStorage.instance;
  String? name, imgURL;
  final formKey = GlobalKey<FormState>();
  var file;
  final picker = ImagePicker();
  File? imageFile;
  String? fileName;

  Future<void> updatePictureGroupStorage(String inputSource) async {
    PickedFile? pickedImage;
    try {
      // ignore: deprecated_member_use
      pickedImage = await picker.getImage(
          source: inputSource == 'Camera'
              ? ImageSource.camera
              : ImageSource.gallery);

      fileName = path.basename(pickedImage!.path);
      setState(() {
        file = File(pickedImage!.path);
      });
      imageFile = File(pickedImage.path);
    } catch (err) {
      print(err);
    }
  }

  Future<void> updatePictureGroup(
    dynamic keyIn,
    dynamic db,
  ) async {
    if (file != null) {
      if (keyIn.url != 'null') {
        FirebaseStorage.instance.refFromURL(keyIn.url).delete();
      }
      try {
        TaskSnapshot snapshot = await storage
            .ref()
            .child("pictureCharacter/${keyIn.name}")
            .putFile(file);
        if (snapshot.state == TaskState.success) {
          final String downloadUrl = await snapshot.ref.getDownloadURL();
          await db
              .child(keyIn.pKey)
              .child('character')
              .child(keyIn.sKey)
              .update({
            'urlPicture': downloadUrl,
          }).then((value) {
            print("Success");
            showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text('Update Picture Success'),
                content: const Text('You Update Picture Group Success'),
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
            print(onError.message);
            print("Error โว้ย");
          });

          //NOTE SnackBar ตัวแสดงโชว์ข้างล่าง

          /*final snackBar = SnackBar(content: Text('เพิ่มสำเร็จ'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        setState(() {});*/

        } else {
          print('Error from image repo ${snapshot.state.toString()}');
          throw ('This file is not an image');
        }
      } on FirebaseException catch (error) {
        print(error);
      }
    } else {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Update Picture Fail'),
          content: const Text('You Update Picture Group Fail'),
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
    }
  }

  Future<void> aftercheck(
    dynamic keyIn,
    dynamic db,
  ) async {}

  @override
  Widget build(BuildContext context) {
    final dbFirebase = FirebaseDatabase.instance.reference().child('Group');
    final keyIn =
        ModalRoute.of(context)!.settings.arguments as sendTwoKeyTwoProperty;
    return Scaffold(
      backgroundColor: backgroundC,
      //drawer: drawerAppBar(),
      appBar: AppBar(
        title: Text("Edit Picture Group"),
        backgroundColor: appBarC,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                btnOther(pColor, () {
                  print("Gallery");
                  updatePictureGroupStorage("Gallery");
                }, 'Gallery'),
                SizedBox(
                  width: 10,
                ),
                btnOther(sColor, () {
                  print("Camara");
                  updatePictureGroupStorage("Camera");
                }, 'Camera'),
              ],
            ),
            Center(
              child: file == null
                  ? Text('Not Found')
                  : Card(
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Image.file(
                            file,
                            //scale: 5,
                          ),
                        ],
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      elevation: 5,
                      margin: EdgeInsets.all(15),
                    ),
            ),
            btnOther(pColor, () {
              updatePictureGroup(keyIn, dbFirebase);
              print(keyIn.pKey);
              print(keyIn.sKey);
            }, "Save Picture")
          ],
        ),
      ),
    );
  }
}
