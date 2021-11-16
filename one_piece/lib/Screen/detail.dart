import 'package:flutter/material.dart';
import 'package:one_piece/config/constant.dart';
import 'package:one_piece/models/anyClass.dart';

class detail extends StatefulWidget {
  const detail({Key? key}) : super(key: key);

  @override
  _detailState createState() => _detailState();
}

class _detailState extends State<detail> {
  @override
  Widget build(BuildContext context) {
    final dataIn = ModalRoute.of(context)!.settings.arguments as send18Property;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundC,
      drawer: /*testCheckAuth(context, 'detail')*/ checkAuth(
          context, 'homePage'),
      appBar: AppBar(
        title: Text("Detail"),
        backgroundColor: appBarC,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //NOTE ส่วนรูปภาพ
            Container(
              margin: EdgeInsets.all(10),
              alignment: Alignment.topCenter,
              child: Container(
                width: size.width * 0.97,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: Image.network(dataIn.urlPicture),
              ),
            ),
            //NOTE ส่วนข้อมูล
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.all(10),
              child: Container(
                alignment: Alignment.topLeft,
                width: size.width * 0.97,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 0.80),
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      alignment: Alignment.topLeft,
                      child: Text(
                        'ข้อมูล',
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: Column(
                        children: [
                          DataTable(
                            dividerThickness: 0,
                            columns: [
                              DataColumn(
                                label: textS16('ชื่อภาษาอักกฤษ'),
                              ),
                              DataColumn(
                                label: textS16(dataIn.nameEng),
                              ),
                            ],
                            rows: [
                              DataRow(
                                cells: [
                                  DataCell(textS16('ชื่อภาษาไทย')),
                                  DataCell(textS16(dataIn.nameCharacter)),
                                ],
                              ),
                              DataRow(
                                cells: [
                                  DataCell(textS16('เปิดตัว')),
                                  DataCell(textS16(dataIn.debut)),
                                ],
                              ),
                              DataRow(
                                cells: [
                                  DataCell(textS16('สังกัด')),
                                  DataCell(textS16(dataIn.affiliation)),
                                ],
                              ),
                              DataRow(
                                cells: [
                                  DataCell(textS16('อาชีพ')),
                                  DataCell(textS16(dataIn.occupation)),
                                ],
                              ),
                              DataRow(
                                cells: [
                                  DataCell(textS16('บ้านเกิด')),
                                  DataCell(textS16(dataIn.homeTown)),
                                ],
                              ),
                              DataRow(
                                cells: [
                                  DataCell(textS16('ฉายา')),
                                  DataCell(textS16(dataIn.nickname)),
                                ],
                              ),
                              DataRow(
                                cells: [
                                  DataCell(textS16('วันเกิด')),
                                  DataCell(textS16(dataIn.birthDate)),
                                ],
                              ),
                              DataRow(
                                cells: [
                                  DataCell(textS16('อายุ')),
                                  DataCell(textS16(dataIn.oldYear)),
                                ],
                              ),
                              DataRow(
                                cells: [
                                  DataCell(textS16('ส่วนสูง')),
                                  DataCell(textS16(dataIn.hight)),
                                ],
                              ),
                              DataRow(
                                cells: [
                                  DataCell(textS16('หมู่เลือด')),
                                  DataCell(textS16(dataIn.gBlood)),
                                ],
                              ),
                              DataRow(
                                cells: [
                                  DataCell(textS16('ค่าหัว')),
                                  DataCell(textS16(dataIn.bounty)),
                                ],
                              ),
                              DataRow(
                                cells: [
                                  DataCell(textS16('สถานะ')),
                                  DataCell(textS16(dataIn.status)),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.all(10),
              child: Container(
                alignment: Alignment.topLeft,
                width: size.width * 0.97,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 0.80),
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      alignment: Alignment.topLeft,
                      child: Text(
                        'ผลปีศาจ',
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: Column(
                        children: [
                          DataTable(
                            dividerThickness: 0,
                            columns: [
                              DataColumn(
                                label: textS16('ชื่อภาษาอังกฤษ'),
                              ),
                              DataColumn(
                                label: textS16(dataIn.dFruitEng),
                              ),
                            ],
                            rows: [
                              DataRow(
                                cells: [
                                  DataCell(textS16('ชื่อภาษาไทย')),
                                  DataCell(textS16(dataIn.dFruitTh)),
                                ],
                              ),
                              DataRow(
                                cells: [
                                  DataCell(textS16('พลัง')),
                                  DataCell(textS16(dataIn.powerFruit)),
                                ],
                              ),
                              DataRow(
                                cells: [
                                  DataCell(textS16('สาย')),
                                  DataCell(textS16(dataIn.typeFruit)),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
