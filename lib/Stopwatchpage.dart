import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Stopwatchpage extends StatefulWidget {
  const Stopwatchpage({Key? key}) : super(key: key);

  @override
  State<Stopwatchpage> createState() => _StopwatchpageState();
}

class _StopwatchpageState extends State<Stopwatchpage> {
  Timer? _timer;
  var _time = 0;
  var _isRunning = false;
  List<String> _lapTimes = [];
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Text(
      ""),
      backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: _buildBody(),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          color: Colors.black,
          height: 50,
      ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _clickButton();
          });
        },
        child:Container(
          color:Colors.white,
          child:_isRunning ? Icon(Icons.pause) : Icon(Icons.play_arrow),
      ),),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildBody() {
    var formattedTime = _formatTime(_time);
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: 150),
        child: Stack(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      formattedTime,
                      style: TextStyle(
                        fontSize: 80,
                        color: Colors.white,//
                                      ),
                    ),
                  ],
                ),
                Container(
                  width: 100,
                  height: 200,
                  color: Colors.black,//

                  child: ListView(
                    children: _lapTimes.map((time) => Text(time)).toList(),
                  ),
                )
              ],
            ),
            Positioned(
              left: 10,
              bottom: 30,
              child: FloatingActionButton(
                onPressed: () {
                  _reset();
                },
                child: Icon(Icons.rotate_left),
              ),
            ),
            Positioned(
              right: 10,
              bottom: 20,
              child: ElevatedButton(

                onPressed: () {
                  setState(() {
                    _recodeLapTime(formattedTime);
                  });
                },
                child:Row(
                  children:[
                    Icon(Icons.add),
                  Text("랩타임"),
              ],
            ),
              ),
        ),
      ],
      ),
    ),
    );
  }

  void _clickButton() {
    _isRunning = !_isRunning;

    if (_isRunning) {
      _start();
    } else {
      _pause();
    }
  }

  void _start() {
    _timer = Timer.periodic(Duration(milliseconds: 10), (timer) {
      setState(() {
        _time++;
      });
    });
  }

  void _pause() {
    _timer?.cancel();
  }

  void _reset() {
    setState(() {
      _isRunning = false;
      _timer?.cancel();
      _lapTimes.clear();
      _time = 0;
    });
  }

  void _recodeLapTime(String time) {
    _lapTimes.insert(0, '$_time 순위 $time');
  }

  String _formatTime(int time) {
    final formatter = NumberFormat("00");
    final minutes = formatter.format(time ~/ 6000);
    final seconds = formatter.format(((time ~/ 100) % 60));
    final hundredth = formatter.format(time % 100);
    return '$minutes:$seconds.$hundredth';
  }
}
