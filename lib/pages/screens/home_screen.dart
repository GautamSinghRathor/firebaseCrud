import 'package:firebaseCrud/pages/screens/screens.dart';
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
  List<Color> colors = [Colors.orange, Colors.pink, Colors.blue, Colors.red];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Firebase CRUD'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ...List.generate(4, (index) {
            return RaisedButton(
              color: colors[index],
              onPressed: () {
                switch (index) {
                  case 0:
                    write();
                    break;
                  case 1:
                    read();
                    break;
                  case 2:
                    update();
                    break;
                  case 3:
                    delete();
                }
              },
              child: Text(
                methodName[index],
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            );
          }),
        ],
      ),
    );
  }

  read() async {
    DataSnapshot snapshot = await firebaseReference.once();
    debugPrint('snapshot : ${snapshot.value}');
  }

  write() async {
    await firebaseReference.push().set({'key': 'value'});
    debugPrint('added');
  }

  update() async{
    // firebaseReference.update();
  }
  delete() {}
}
