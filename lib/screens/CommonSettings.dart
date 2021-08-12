import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonSettings extends StatefulWidget {
  CommonSettings({Key key}) : super(key: key);

  @override
  _CommonSettingsState createState() => _CommonSettingsState();
}

class _CommonSettingsState extends State<CommonSettings> {
  bool switchControl = false;
  bool switchControl1 = false;
  var textHolder = 'Switch is OFF';
  int _value = 1;

  void toggleSwitch(bool value) {
    if (switchControl == false) {
      setState(() {
        switchControl = true;
        // switchControl1 = true;

        textHolder = 'Switch is ON';
      });
      print('Switch is ON');
      // Put your code here which you want to execute on Switch ON event.

    } else {
      setState(() {
        switchControl = false;
        // switchControl1 = false;
        textHolder = 'Switch is OFF';
      });
      print('Switch is OFF');
      // Put your code here which you want to execute on Switch OFF event.
    }
  }

  void toggleSwitch1(bool value) {
    if (switchControl1 == false) {
      setState(() {
        // switchControl = true;
        switchControl1 = true;

        textHolder = 'Switch is ON';
      });
      print('Switch is ON');
      // Put your code here which you want to execute on Switch ON event.

    } else {
      setState(() {
        // switchControl = false;
        switchControl1 = false;
        textHolder = 'Switch is OFF';
      });
      print('Switch is OFF');
      // Put your code here which you want to execute on Switch OFF event.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text("Common Settings"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Theme',
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 25),
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            color: Colors.black,
            endIndent: 10,
            indent: 10,
          ),
          SizedBox(
            height: 1,
          ),
          Text(
            'Dark Mode',
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 25),
          ),
          SizedBox(
            height: 60,
          ),
          Divider(
            color: Colors.black,
            endIndent: 10,
            indent: 10,
          ),
          SizedBox(
            height: 60,
          ),
          Row(
            children: [
              SizedBox(width: 10),
              Text(
                'Recieve a calls',
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(width: 200),
              Transform.scale(
                  scale: 1.5,
                  child: Switch(
                    onChanged: toggleSwitch,
                    value: switchControl,
                    activeColor: Colors.deepPurpleAccent,
                    activeTrackColor: Colors.grey,
                    inactiveThumbColor: Colors.white,
                    inactiveTrackColor: Colors.grey,
                  )),
            ],
          ),
          SizedBox(
            height: 60,
          ),
          Row(
            children: [
              SizedBox(width: 10),
              Text(
                'Update Location for Every',
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(width: 110),
              DropdownButton(
                  value: _value,
                  items: [
                    DropdownMenuItem(
                      child: Text("5 min"),
                      value: 1,
                    ),
                    DropdownMenuItem(
                      child: Text("10 min"),
                      value: 2,
                    ),
                    DropdownMenuItem(child: Text("15 min"), value: 3),
                    DropdownMenuItem(child: Text("20 min"), value: 4)
                  ],
                  onChanged: (value) {
                    setState(() {
                      _value = value;
                    });
                  }),
            ],
          ),
          SizedBox(
            height: 60,
          ),
          Divider(
            color: Colors.black,
            endIndent: 10,
            indent: 10,
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            ' Notifications',
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(
            height: 30,
          ),
          Divider(
            color: Colors.black,
            endIndent: 10,
            indent: 10,
          ),
          Row(
            children: [
              SizedBox(width: 10),
              Text(
                'Show Notificatins',
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(width: 170),
              Transform.scale(
                  scale: 1.5,
                  child: Switch(
                    onChanged: toggleSwitch1,
                    value: switchControl1,
                    activeColor: Colors.deepPurpleAccent,
                    activeTrackColor: Colors.grey,
                    inactiveThumbColor: Colors.white,
                    inactiveTrackColor: Colors.grey,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
