import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(MaterialApp(
    home: TimerPage(),
  ));
}

class TimerPage extends StatefulWidget {
  const TimerPage({Key? key}) : super(key: key);

  @override
  TimerPageState createState() => TimerPageState();
}

class TimerPageState extends State<TimerPage> {
  int _timeInSeconds = 0;
  late Timer _timer;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("타이머",
            style: TextStyle(
              color: Colors.white,
                  fontSize: 30,
              fontWeight: FontWeight.bold,
        )),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _formattedTime(),
              style: const TextStyle(fontSize: 80, color: Colors.white),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                _showTimePicker(context);
              },
              child: const Text('타이머 설정'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _resetTimer();
        },
        child: Icon(Icons.rotate_right),
        backgroundColor: Colors.white,
      ),
    );
  }

  void _showTimePicker(BuildContext context) async {
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: 0, minute: 1),
    );

    if (pickedTime != null) {
      setState(() {
        _timeInSeconds = pickedTime.hour * 3600 + pickedTime.minute * 60;
      });
      _startTimer();
    }
  }

  void _startTimer() {  //감소
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_timeInSeconds > 0) {
          _timeInSeconds--;
        } else {
          _timer.cancel();
        }
      });
    });
  }


  void _resetTimer() {
    setState(() {
      _timeInSeconds = 0;
    });
  }

  String _formattedTime() { //변환
    final minutes = (_timeInSeconds ~/ 60).toString().padLeft(2, '0');
    final seconds = (_timeInSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }
}
