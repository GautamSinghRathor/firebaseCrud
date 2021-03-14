import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

final firebaseReference = FirebaseDatabase.instance.reference();

class _MyHomePageState extends State<MyHomePage> {
  List<String> methodName = ['Write', 'Read', 'Update', 'Delete'];
  int methodPressedIndex;
  var dataSnapshot;
  List<Color> colors = [Colors.orange, Colors.pink, Colors.blue, Colors.red];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Firebase CRUD'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ...List.generate(4, (index) {
              return RaisedButton(
                color: colors[index],
                onPressed: () {
                  setState(() {
                    switch (index) {
                      case 0:
                        methodPressedIndex = 0;
                        write();
                        break;
                      case 1:
                        methodPressedIndex = 1;

                        read();
                        break;
                      case 2:
                        methodPressedIndex = 2;

                        update();
                        break;
                      case 3:
                        methodPressedIndex = 3;
                        delete();
                    }
                  });
                },
                child: Text(
                  methodName[index],
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              );
            }),
            //show operations result over here

            methodPressedIndex == 0
                ? Text('write')
                : methodPressedIndex == 1
                    ? Text(dataSnapshot.value.toString() ?? 'read')
                    : methodPressedIndex == 2
                        ? Text('update')
                        : methodPressedIndex == 3
                            ? Text('delete')
                            : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }

  Future<void> read() async {
    DataSnapshot snapshot = await firebaseReference.child('deshbakhts').once();
    debugPrint('snapshot : ${snapshot.value}');
    dataSnapshot = snapshot;
  }

  Future<void> write() async {
    await firebaseReference.push().set({'key': 'value'});
    debugPrint('added');
  }

  Future<void> update() async {
    firebaseReference.child('des');
  }
  Future<void> delete() async {}
}
