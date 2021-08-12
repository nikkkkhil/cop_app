import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AccidentReport extends StatefulWidget {
  AccidentReport({Key key}) : super(key: key);

  @override
  _AccidentReportState createState() => _AccidentReportState();
}

class _AccidentReportState extends State<AccidentReport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text("Report"),
      ),
      body: Column(
        children: [
          FadeInImage.assetNetwork(
            // here `bytes` is a Uint8List containing the bytes for the in-memory image
            placeholder: 'assets/Pinwheel.gif',
            image:
                ('https://upload.wikimedia.org/wikipedia/commons/thumb/e/e1/Car_crash_1.jpg/1024px-Car_crash_1.jpg'),
          ),
          Text(
              """PORTLAND, Ore. — More than 20 cars were involved in a crash on Interstate-5 near Wilsonville Saturday afternoon, according to Oregon State Police .

The traffic collision blocked all northbound lanes for roughly an hour before authorities were able to clear one lane to let other cars pass. In total, 21 cars were involved.

OSP said they believe only minor injuries were sustained. One person was taken by ambulance from the scene of the crash, however, OSP later said there were no serious injuries.

By 3 p.m., several tow trucks were on the way to help clear the scene. It was another hour before all lanes were cleared.

"Be patient and take it slow," said OSP via Twitter.


It is unclear at this time what caused the crash.

This is a developing story.

""")
        ],
      ),
    );
  }
}
