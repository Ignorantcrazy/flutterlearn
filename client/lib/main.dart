import 'package:flutter/material.dart';
import 'FormTestRoute.dart';
import 'calcpage.dart';
import 'listview.dart';
import 'tcpipwrite.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
          iconTheme: IconThemeData(color: Colors.blue[50])),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: new Text(title),
          actions: <Widget>[
            new IconButton(
              icon: new Icon(Icons.add_box),
              onPressed: () {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) {
                  return new CalcPage();
                }));
              },
            ),
            new IconButton(
              icon: new Icon(Icons.search),
              onPressed: () {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) {
                  return new FormTestRoute();
                }));
              },
            ),
            new IconButton(
              icon: new Icon(Icons.list),
              onPressed: () {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) {
                  return new ListViewFormApi();
                }));
              },
            ),
            new IconButton(
              icon: new Icon(Icons.portrait),
              onPressed: () {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) {
                  return new TCPIPWritePage(
                    host: '',
                    port: 200,
                  );
                }));
              },
            ),
          ],
        ),
        body: new CalcPage(),
      ),
    );
  }
}
