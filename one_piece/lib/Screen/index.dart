import 'package:flutter/material.dart';
import 'package:one_piece/config/constant.dart';
import 'package:one_piece/models/anyClass.dart';

class index extends StatefulWidget {
  const index({Key? key}) : super(key: key);

  @override
  _indexState createState() => _indexState();
}

class _indexState extends State<index> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundC,
      drawer: drawerAppBar(),
      appBar: AppBar(
        title: Text(""),
        backgroundColor: appBarC,
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              viewBtn(
                "ตัวละคร",
                'https://images6.alphacoders.com/606/thumb-1920-606263.jpg',
                size,
                50,
                () {
                  Navigator.pushNamed(context, 'view');
                },
              ),
              viewBtn(
                "แก้ไข",
                'https://cdn.pixabay.com/photo/2016/08/24/16/20/books-1617327_960_720.jpg',
                size,
                50,
                () {
                  Navigator.pushNamed(context, 'addGroup');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}