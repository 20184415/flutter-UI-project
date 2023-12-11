import 'package:flutter/material.dart';
import 'TimerPage.dart';
import 'Stopwatchpage.dart';
import 'AlarmPage.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _index = 0;
  var _pages = [
   TimerPage(),
    Stopwatchpage(),
    AlarmPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
        Text(""),
        backgroundColor: Colors.black,
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {},
              icon: Icon(Icons.add))
        ],
      ),
      body: _pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        items: [
          BottomNavigationBarItem(
            label: '타이머',
            icon: Icon(Icons.timer),
          ),
          BottomNavigationBarItem(
            label: '스톱워치',
            icon: Icon(Icons.watch_later_rounded),
          ),
          BottomNavigationBarItem(
            label: '알람',
            icon: Icon(Icons.alarm_add_rounded),
          ),
        ],
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
      ),
    );
  }
}

