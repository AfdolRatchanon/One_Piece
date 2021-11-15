import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:one_piece/models/anyClass.dart';

class viewCharacter extends StatefulWidget {
  const viewCharacter({Key? key}) : super(key: key);

  @override
  _viewCharacterState createState() => _viewCharacterState();
}

class _viewCharacterState extends State<viewCharacter> {
  dynamic keycharacter;
  final dbFirebase = FirebaseDatabase.instance.reference().child("Group");
  @override
  Widget build(BuildContext context) {
    final keyIn = ModalRoute.of(context)!.settings.arguments as sendOneKey;
    Size size = MediaQuery.of(context).size;
    String snapKey;
    return Scaffold(
      body: FirebaseAnimatedList(
        query: dbFirebase.child(keyIn.key.toString()).child('character'),
        itemBuilder: (context, snapshot, animation, index) {
          return Container(
            // height: 100,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: InkWell(
                  child: Card(
                    elevation: 3,
                    child: Container(
                      alignment: Alignment.topCenter,
                      child: Column(
                        children: [
                          viewBtn('${snapshot.value['nameCharacter']}',
                              '${snapshot.value['urlPicture']}', size, 30, () {
                            Navigator.pushNamed(context, 'addCharacter',
                                arguments: sendOneKey('${snapshot.key}'));
                          }),
                          ListTile(
                            title: Text('character Name : ' +
                                '${snapshot.value['nameCharacter']}'),
                            subtitle: Row(
                              children: [
                                Expanded(
                                  child: IconButton(
                                    icon: Icon(Icons.mode_edit_outlined),
                                    onPressed: () {
                                      // print("แก้ไข");
                                      // print(snapshot.key!);
                                      // keycharacter = '${snapshot.key!}';
                                      // Navigator.pushNamed(
                                      //   context,
                                      //   'editCharacter',
                                      //   arguments: sendTwoKeyTwoProperty(
                                      //     keyIn.key.toString(),
                                      //     keycharacter,
                                      //     snapshot.value['nameCharacter'],
                                      //     snapshot.value['urlPicture'],
                                      //   ),
                                      // );
                                      //updateData(snapshot.key!);
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: IconButton(
                                    icon: Icon(Icons.delete),
                                    onPressed: () {
                                      // Dailog Dlete
                                      showDialog<String>(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            AlertDialog(
                                          title:
                                              const Text('Alert Delate Data'),
                                          content: const Text(
                                              'Do You Want Delate Data press Ok for Delate'),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  context, 'Cancel'),
                                              child: const Text('Cancel'),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                snapKey = '${snapshot.key}';
                                                Navigator.pop(context, 'OK');
                                                dbFirebase
                                                    .child(keyIn.key)
                                                    .child('character')
                                                    .child(snapKey)
                                                    .remove();
                                                print(snapKey);
                                              },
                                              child: const Text('OK'),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                            trailing: Column(
                              children: [],
                            ),
                          ),
                        ],
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onTap: () {
                    keycharacter = '${snapshot.key}';
                    // Navigator.pushNamed(
                    //   context,
                    //   'addGroup',
                    //   arguments: sendOneKeyTwoProperty(
                    //     keycharacter,
                    //     snapshot.value['nameCharacter'],
                    //     snapshot.value['urlPicture'],
                    //   ),
                    // );
                  }),
            ),
          );
        },
      ),
    );
  }
}
