import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'constparam.dart';

class ListViewFormApi extends StatefulWidget {
  @override
  _ListViewFormApiState createState() => new _ListViewFormApiState();
}

class _ListViewFormApiState extends State<ListViewFormApi> {
  static const loadingTag = '##loading##';
  var _words = <String>[loadingTag];
  @override
  void initState() {
    _retrieveData();
  }

  @override
  Widget build(BuildContext context) {
    Widget divider1 = Divider(
      color: Colors.blue,
    );
    Widget divider2 = Divider(
      color: Colors.green,
    );
    return ListView.separated(
      itemCount: _words.length,
      itemBuilder: (context, index) {
        if (_words[index] == loadingTag) {
          _retrieveData();
          return Container(
            padding: const EdgeInsets.all(16.0),
            alignment: Alignment.center,
            child: SizedBox(
              width: 24.0,
              height: 24.0,
              child: CircularProgressIndicator(
                strokeWidth: 2.0,
              ),
            ),
          );
        }
        return ListTile(
          title: Text(_words[index]),
        );
      },
      separatorBuilder: (context, index) {
        return index % 2 == 0 ? divider1 : divider2;
      },
    );
  }

  Future _retrieveData() async {
    Dio dio = new Dio();
    Response res = await dio.get(APIBASEURL + "/api/values");
    setState(() {
      _words.insertAll(_words.length, res.data.toList());
    });
  }
}
