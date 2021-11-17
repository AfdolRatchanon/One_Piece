import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:one_piece/config/constant.dart';

class sendOneKey {
  final String key;
  const sendOneKey(this.key);
}

class sendTwoKey {
  final String pKey;
  final String sKey;
  const sendTwoKey(this.pKey, this.sKey);
}

class sendOneKeyTwoProperty {
  final String key;
  final String name;
  final String url;
  const sendOneKeyTwoProperty(this.key, this.name, this.url);
}

class sendTwoKeyTwoProperty {
  final String pKey;
  final String sKey;
  final String name;
  final String url;
  const sendTwoKeyTwoProperty(this.pKey, this.sKey, this.name, this.url);
}

class send18Property {
  final String nameCharacter,
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
  const send18Property(
    this.nameCharacter,
    this.urlPicture,
    this.nameEng,
    this.debut,
    this.affiliation,
    this.occupation,
    this.homeTown,
    this.nickname,
    this.birthDate,
    this.oldYear,
    this.hight,
    this.gBlood,
    this.bounty,
    this.status,
    this.dFruitEng,
    this.dFruitTh,
    this.powerFruit,
    this.typeFruit,
  );
}

class sendTwoKey18Property {
  final String pKey,
      sKey,
      nameCharacter,
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
  const sendTwoKey18Property(
    this.pKey,
    this.sKey,
    this.nameCharacter,
    this.urlPicture,
    this.nameEng,
    this.debut,
    this.affiliation,
    this.occupation,
    this.homeTown,
    this.nickname,
    this.birthDate,
    this.oldYear,
    this.hight,
    this.gBlood,
    this.bounty,
    this.status,
    this.dFruitEng,
    this.dFruitTh,
    this.powerFruit,
    this.typeFruit,
  );
}

class sendTwoKey17Property {
  final String pKey,
      sKey,
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
      typeFruit;
  const sendTwoKey17Property(
    this.pKey,
    this.sKey,
    this.nameCharacter,
    this.nameEng,
    this.debut,
    this.affiliation,
    this.occupation,
    this.homeTown,
    this.nickname,
    this.birthDate,
    this.oldYear,
    this.hight,
    this.gBlood,
    this.bounty,
    this.status,
    this.dFruitEng,
    this.dFruitTh,
    this.powerFruit,
    this.typeFruit,
  );
}
/*
Widget drawerAppBar() {
  return Drawer(
    child: ListView(
      children: [
        DrawerHeader(
          child: Text('User not login'),
        ),
        ListTile(
          leading: Icon(
            Icons.login,
            color: pColor,
          ),
          title: Text("Login"),
          onTap: () {
            print('go to login');
            signInwithGoogle();
          },
        ),
      ],
    ),
  );
}*/

//NOTE checkLogin
Widget checkAuth(context, String routeName) {
  if (FirebaseAuth.instance.currentUser == null) {
    return drawerAppBarNotLogin(context, routeName);
  } else {
    //Navigator.pushReplacement();
    return drawerAppBarLogin(context, routeName);
  }
}

Widget drawerAppBarNotLogin(context, String routeName) {
  return Drawer(
    child: ListView(
      children: [
        DrawerHeader(
          child: Text('User not login'),
        ),
        ListTile(
          leading: Icon(
            Icons.login,
            color: pColor,
          ),
          title: Text("Login"),
          onTap: () {
            print('go to login');
            signInwithGoogle(context, routeName);
          },
        ),
      ],
    ),
  );
}

Widget drawerAppBarLogin(context, String routeName) {
  return Drawer(
    child: ListView(
      children: [
        DrawerHeader(
          child: Column(
            children: [
              CircleAvatar(
                backgroundImage:
                    NetworkImage(FirebaseAuth.instance.currentUser!.photoURL!),
                radius: 30,
              ),
              Text(FirebaseAuth.instance.currentUser!.email!),
            ],
          ),
        ),
        ListTile(
          title: Text(FirebaseAuth.instance.currentUser!.displayName!),
        ),
        ListTile(
          title: Text(FirebaseAuth.instance.currentUser!.email!),
        ),
        ListTile(
          title: Text("แก้ไขข้อมูล"),
          onTap: () {
            Navigator.pushNamed(context, 'addGroup');
          },
        ),
        ListTile(
          title: Text("Logout"),
          leading: Icon(
            Icons.logout,
            color: Colors.red,
          ),
          onTap: () {
            signOutFromGoogle(context, routeName);
          },
        ),
      ],
    ),
  );
}

Future<String?> signInwithGoogle(context, String routeName) async {
  try {
    final GoogleSignInAccount? googleSignInAccount =
        await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
    await Navigator.pushNamedAndRemoveUntil(
        context, routeName, (route) => false);
    await Navigator.pushNamed(context, 'index');
  } on FirebaseAuthException catch (e) {
    print("Exception Firebase Auth");
    print(e.message);
    throw e;
  }
}

Future<void> signOutFromGoogle(context, String routeName) async {
  await GoogleSignIn().signOut();
  await FirebaseAuth.instance.signOut();
  await Navigator.pushNamedAndRemoveUntil(context, routeName, (route) => false);
  await Navigator.pushNamed(context, 'index');
}

/*
Future<String?> signInwithGoogle() async {
  try {
    final GoogleSignInAccount? googleSignInAccount =
        await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
  } on FirebaseAuthException catch (e) {
    print("Exception Firebase Auth");
    print(e.message);
    throw e;
  }
}

Future<void> signOutFromGoogle() async {
  await GoogleSignIn().signOut();
  await FirebaseAuth.instance.signOut();
}
*/

//NOTE Card กดได้
Widget viewBtn(
    String title, String url, Size size, double fontsize, dynamic on_pressed) {
  return InkWell(
    splashColor: appBarC,
    child: Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Image.network(
            url,
            fit: BoxFit.fitHeight,
            height: size.height * 0.30,
          ),
          Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(5),
            //color: Color.fromRGBO(0, 0, 0, 0.25),
            decoration: BoxDecoration(
              color: Color.fromRGBO(0, 0, 0, 0.35),
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: Text(
              title,
              style: TextStyle(
                color: LabelWhC,
                fontSize: fontsize,
                //backgroundColor: Color.fromRGBO(0, 0, 0, 150),
              ),
            ),
          ),
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 5,
      margin: EdgeInsets.all(15),
    ),
    onTap: () {
      on_pressed();
    },
  );
}

Widget cardImg(
  String url,
  Size size,
) {
  return Card(
    semanticContainer: true,
    clipBehavior: Clip.antiAliasWithSaveLayer,
    child: Stack(
      alignment: Alignment.bottomRight,
      children: [
        Image.network(
          url,
          fit: BoxFit.fitHeight,
          height: size.height * 0.45,
        ),
      ],
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    elevation: 5,
    margin: EdgeInsets.all(15),
  );
}

Widget containerAndText(String title, String data) {
  return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        title + data,
        style: TextStyle(fontSize: 16),
      ));
}

//NOTE Text fontSize 16
Widget textS16(String data) {
  return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        data,
        style: TextStyle(fontSize: 16),
      ));
}

//NOTE ปุม
Widget btnOther(color, dynamic onPress, String title) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      primary: color,
    ),
    onPressed: onPress,
    child: Text(title),
  );
}

Widget btnOtherSize(
    color, dynamic onPress, String title, double fontSize, double padding) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      padding: EdgeInsets.all(padding),
      primary: color,
    ),
    onPressed: onPress,
    child: Text(
      title,
      style: TextStyle(fontSize: fontSize),
    ),
  );
}

//NOTE textFormFild แบบกำหนดค่าเริ่มต้น
Widget txtFmFdIv(String title, Icon icon, String hintText, dynamic varOnSave,
    String initValue) {
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
        initialValue: initValue),
  );
}
