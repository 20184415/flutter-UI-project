// Page1.dart

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  int hour = TimeOfDay.now().hour;
  int minute = TimeOfDay.now().minute;

  void _selectTime(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200.0,
          child: CupertinoPicker(
            itemExtent: 40.0,
            onSelectedItemChanged: (int index) {
              setState(() {
                if (index < 24) {
                  hour = index;
                } else {
                  minute = index - 24;
                }
              });
            },
            children: List<Widget>.generate(60, (int index) {
              if (index < 24) {
                return Center(child: Text('$index'));
              } else {
                return Center(child: Text('${index - 24}'));
              }
            }),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
        '알람 ',style:
        TextStyle(
          fontSize: 30,
        )
      ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Selected Time: ${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _selectTime(context);
              },
              child: Text('시간 선택'),
            ),
          ],
        ),
      ),
    );
  }
}
