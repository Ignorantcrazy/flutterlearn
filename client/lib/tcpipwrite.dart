import 'package:flutter/material.dart';
import 'dart:io';
import 'commonWidget.dart';

class TCPIPWritePage extends StatefulWidget {
  TCPIPWritePage({Key key, @required this.host, @required this.port})
      : super(key: key);
  final String host;
  final int port;
  @override
  _TCPIPWritePageState createState() => _TCPIPWritePageState();
}

class _TCPIPWritePageState extends State<TCPIPWritePage> {
  Socket socket;
  bool _isSelected;

  @override
  void initState() async {
    // TODO: implement initState
    super.initState();
    socket = await Socket.connect(widget.host, widget.port)
        .catchError((Exception e) {
      neverSatisfied(e.toString(), context);
    });
    socket.listen(_dataHandler, onError: _errorHandler, cancelOnError: true);
  }

  void _dataHandler(List<int> datas) {
    for (var data in datas) {
      if (data == 1) {
        setState(() {
          _isSelected = true;
        });
      } else {
        _isSelected = false;
      }
    }
  }

  void _errorHandler() {
    neverSatisfied('socket listen error', context);
  }

  void _switchValueChange(bool newValue) {
    setState(() {
      _isSelected = newValue;
    });
    socket.write(1);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      alignment: Alignment.center,
      child: new Switch(
        value: _isSelected,
        onChanged: _switchValueChange,
      ),
    );
  }

  @override
  void dispose() {
    socket.close();
    super.dispose();
  }
}
