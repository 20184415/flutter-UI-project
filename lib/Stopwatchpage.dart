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
      backgroundColor: Colors.black,
    appBar: AppBar(
      title: Text(
      ""),
      backgroundColor: Colors.black,
      ),


      body:_buildBody(),
        floatingActionButton:Stack(
      children: [
          Positioned(
                  right: 0,
                  top: 210,
          child:ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            padding: EdgeInsets.all(37),
          ),
        onPressed: () {
          setState(() {
            _clickButton();
          });
        },
        child:Container(
          color:Colors.white,
          child:_isRunning ? Icon(Icons.pause) : Icon(Icons.play_arrow),
      ),),
        ),
      ],
        ),
    );
  }

  Widget _buildBody() {
    var formattedTime = _formatTime(_time);
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: 30),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  formattedTime,
                  style: TextStyle(
                    fontSize: 80,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20), // 알맞게 간격 조정

                Expanded(
                  child: ListView.separated(
                    itemCount: _lapTimes.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider(
                        color: Colors.white,
                        thickness: 1.0,
                        height: 1.0,
                      );
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(
                          _lapTimes[index],
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      );
                    },
                ),
                ),
              ],
            ),
            Positioned(
              left: 10,
              top: 110,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(35),
                ),
                onPressed: () {
                  if (_isRunning) {
                    _recodeLapTime(formattedTime);
                  } else {
                    _reset();
                  }
                },
                child: Container(
                  color: Colors.white,
                  child: _isRunning ? Text("랩타임") : Icon(Icons.rotate_right),
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
  void _clickButton2(){
    _isRunning = !_isRunning;
    if(_isRunning){
      _reset();}
      else{

 //   _recodeLapTime(f);
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
    _lapTimes.insert(0, '$_time  $time');
  }

  String _formatTime(int time) {
    final formatter = NumberFormat("00");
    final minutes = formatter.format(time ~/ 6000);
    final seconds = formatter.format(((time ~/ 100) % 60));
    final hundredth = formatter.format(time % 100);
    return '$minutes:$seconds.$hundredth';
  }
}
