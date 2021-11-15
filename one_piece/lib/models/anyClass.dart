import 'package:flutter/material.dart';
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

Widget drawerAppBar() {
  return Drawer(
    child: ListView(
      children: [
        DrawerHeader(
          child: Text('User Picture'),
        ),
        ListTile(
          title: Text("Name"),
        ),
        ListTile(
          title: Text("Email"),
        ),
        ListTile(
          title: Text("Logout"),
          leading: Icon(
            Icons.logout,
            color: Colors.red,
          ),
        ),
      ],
    ),
  );
}

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
          Text(
            title,
            style: TextStyle(
              color: LabelWhC,
              fontSize: fontsize,
              //backgroundColor: Color.fromRGBO(0, 0, 0, 150),
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
