import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:one_piece/models/anyClass.dart';

class viewGroup extends StatefulWidget {
  const viewGroup({Key? key}) : super(key: key);

  @override
  _viewGroupState createState() => _viewGroupState();
}

class _viewGroupState extends State<viewGroup> {
  dynamic keyGroup;
  final dbFirebase = FirebaseDatabase.instance.reference().child("Group");
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: FirebaseAnimatedList(
        query: dbFirebase,
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
                          viewBtn('${snapshot.value['nameGroup']}',
                              '${snapshot.value['urlPicture']}', size, 30, () {
                            Navigator.pushNamed(context, 'addCharacter',
                                arguments: sendOneKey('${snapshot.key}'));
                          }),
                          ListTile(
                            title: Text('Group Name : ' +
                                '${snapshot.value['nameGroup']}'),
                            subtitle: Row(
                              children: [
                                Expanded(
                                  child: IconButton(
                                    icon: Icon(Icons.mode_edit_outlined),
                                    onPressed: () {
                                      print("แก้ไข");
                                      print(snapshot.key!);
                                      keyGroup = '${snapshot.key!}';
                                      Navigator.pushNamed(
                                        context,
                                        'editGroup',
                                        arguments: sendOneKeyTwoProperty(
                                          keyGroup,
                                          snapshot.value['nameGroup'],
                                          snapshot.value['urlPicture'],
                                        ),
                                      );
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
                                              onPressed: () => {
                                                if (snapshot
                                                        .value['urlPicture'] !=
                                                    'null')
                                                  {
                                                    FirebaseStorage.instance
                                                        .refFromURL(
                                                            snapshot.value[
                                                                'urlPicture'])
                                                        .delete(),
                                                    Navigator.pop(
                                                        context, 'OK'),
                                                    dbFirebase
                                                        .child(snapshot.key!)
                                                        .remove(),
                                                  }
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
                    keyGroup = '${snapshot.key}';
                    Navigator.pushNamed(
                      context,
                      'addGroup',
                      arguments: sendOneKeyTwoProperty(
                        keyGroup,
                        snapshot.value['nameGroup'],
                        snapshot.value['urlPicture'],
                      ),
                    );
                  }),
            ),
          );
        },
      ),
    );
  }
}
