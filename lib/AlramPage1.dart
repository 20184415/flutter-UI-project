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
        title: const Text('알람 설정',
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
            ),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
              child: const Text('시간 추가'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: alarms.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(
                      DateFormat('hh:mm a').format(alarms[index].time),
                      style: const TextStyle(fontSize: 20),
                    ),
                    trailing: Switch(
                      value: alarms[index].isEnabled,
                      onChanged: (value) {
                        setState(() {
                          alarms[index].isEnabled = value;
                        });
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
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
