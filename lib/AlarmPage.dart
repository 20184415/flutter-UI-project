import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AlarmPage extends StatefulWidget {
  const AlarmPage({Key? key}) : super(key: key);

  @override
  _AlarmPageState createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  List<AlarmEntry> alarms = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       backgroundColor: Colors.black,
        title: const Text('알람',
        style: TextStyle(
          fontSize: 30,
          color: Colors.white,
          fontWeight: FontWeight.bold
        ),),
      ),
      body:Container(
    decoration: BoxDecoration(
    color: Colors.black,),
     child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ElevatedButton(
              onPressed: () async {
                final pickedTime = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (pickedTime != null) {
                  setState(() {
                    alarms.add(
                      AlarmEntry(
                          time: DateTime(
                          DateTime.now().year,
                          DateTime.now().month,
                          DateTime.now().day,
                          pickedTime.hour,
                          pickedTime.minute,
                        ),
                        isEnabled: false,
                      ),
                    );
                  });
                }
              },
       style: ElevatedButton.styleFrom(
           textStyle: TextStyle(
             color: Colors.white,
             fontSize: 20,
           )),     child: const Text('알람 추가'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.separated(
                itemCount: alarms.length,
                separatorBuilder: (BuildContext context, int index) => Divider( // 구분선 추가
                  color: Colors.white, // 구분선의 색상 설정
                  thickness: 0.5, // 구분선의 두께 설정
                ),
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(
                      DateFormat('hh:mm a').format(alarms[index].time),
                      style: const TextStyle(fontSize: 20,
                      color: Colors.white
                      ),
                    ),

                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Switch(
                          value: alarms[index].isEnabled,
                          onChanged: (value) {
                            setState(() {
                              alarms[index].isEnabled = value;
                            });
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            deleteAlarm(index); // 삭제 버튼을 누르면 해당 항목 삭제
                          },
                        ),
                      ],
                    ),
                  );

                },
              ),
            ),
          ],
        ),
      ),),
      );
  }
  void deleteAlarm(int index) {
    setState(() {
      alarms.removeAt(index);
    });
  }
}

class AlarmEntry {
  DateTime time;
  bool isEnabled;

  AlarmEntry({
    required this.time,
    required this.isEnabled,
  });
}

