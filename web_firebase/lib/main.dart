import 'package:flutter/material.dart';
import 'package:firebase/firebase.dart' as fireBase;
import 'package:firebase/firestore.dart' as fs;

void main() async{
  if (fireBase.apps.isEmpty) {
    print(fireBase.apps);
    fireBase.initializeApp(
      apiKey: "AIzaSyAseqVYOb2bombg-M-r0Z55B56No_BK_5w",
      authDomain: "grievboard-d1fc0.firebaseapp.com",
      databaseURL: "https://grievboard-d1fc0.firebaseio.com",
      projectId: "grievboard-d1fc0",
      storageBucket: "grievboard-d1fc0.appspot.com",
      messagingSenderId: "99869646234",
      appId: "1:99869646234:web:c95d936e8a83a6cccd2e23",
    );
  }
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final fs.Firestore firestore = fireBase.firestore();
  var data = ['Problem1', 'Problem2', 'Problem3'];

  Future getData() async{
    var data1 = await firestore.collection('data').get().then((value) => value.forEach((val) => val.));
    //print(data1.getString())
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Row(
            children: <Widget>[
              Container(
                  color: Color(0xFF4A83B7),
                  height: 500.0,
                  width: 500.0,
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: data.length,
                      itemBuilder: (context, index){
                        return Card(
                          color: Colors.white,
                          margin: EdgeInsets.all(10.0),
                          child: Text('${data[index]}'),
                        );
                      }
                  )
              ),
              RaisedButton(
                onPressed: (){
                  setState(() {
                    //print(getData());
                    getData();
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

