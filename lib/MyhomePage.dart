import 'package:flutter/material.dart';
import 'Page1.dart';
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
    Page1(),
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
          IconButton(onPressed:(){},
              icon: Icon(Icons.add))
        ],
      ),
      body: _pages[_index],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index){
            setState(() {
              _index = index;
            });
          },
          currentIndex: _index,
          items:[
            BottomNavigationBarItem(
              label: '홈',
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: '스톱워치',
              icon: Icon(Icons.watch_later_rounded),

            ),BottomNavigationBarItem(
              label: '알람',
              icon: Icon(Icons.alarm_add_rounded),
            ),]
      ),
      //bottomNavigationBar: ,
    );
  }
}