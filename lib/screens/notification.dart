import 'package:flutter/material.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class NotificationPage extends StatefulWidget {
  NotificationPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text("Notification"),
      ),
      body: DefaultTabController(
        length: 3,
        initialIndex: 0,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Text("RectangularIndicator Indicator: fill"),
                // ),
                SizedBox(
                  height: 10,
                ),
                Material(
                  child: TabBar(
                      indicatorColor: Colors.deepPurpleAccent,
                      tabs: [
                        Tab(
                          text: "All",
                        ),
                        Tab(
                          text: "Important",
                        ),
                        Tab(
                          text: "Logged",
                        ),
                      ],
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.black,
                      indicator: BoxDecoration(
                          color: Colors.deepPurpleAccent,
                          shape: BoxShape.rectangle)),
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      // first tab bar view widget
                      Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 510,
                            height: 80,
                            // color: Colors.blue[100],
                            child: Text(
                              'Staff1 requested for Profile',
                              textScaleFactor: 1.5,
                              textAlign: TextAlign.center,
                            ),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.blueAccent),
                                color: Colors.blue[50]),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 510,
                            height: 80,
                            // color: Colors.blue[100],
                            child: Text(
                              'Vehicle1 Successfully assigned',
                              textScaleFactor: 1.5,
                              textAlign: TextAlign.center,
                            ),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.blueAccent),
                                color: Colors.blue[50]),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                '/accidentreport',
                              );
                            },
                            child: Container(
                              width: 510,
                              height: 80,
                              // color: Colors.blue[100],
                              child: Text(
                                'Staff2 reported a Accident',
                                textScaleFactor: 1.5,
                                textAlign: TextAlign.center,
                              ),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent),
                                  color: Colors.white),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 510,
                            height: 80,
                            // color: Colors.blue[100],
                            child: Text(
                              'Staff2 is stucked at one point from last 30 mins',
                              textScaleFactor: 1.5,
                              textAlign: TextAlign.center,
                            ),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.blueAccent),
                                color: Colors.white),
                          ),
                        ],
                      ),

                      Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                '/accidentreport',
                              );
                            },
                            child: Container(
                              width: 510,
                              height: 80,
                              // color: Colors.blue[100],
                              child: Text(
                                'Staff2 reported a Accident',
                                textScaleFactor: 1.5,
                                textAlign: TextAlign.center,
                              ),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent),
                                  color: Colors.blue[50]),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 510,
                            height: 80,
                            // color: Colors.blue[100],
                            child: Text(
                              'Staff1 is out of area',
                              textScaleFactor: 1.5,
                              textAlign: TextAlign.center,
                            ),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.blueAccent),
                                color: Colors.white),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 510,
                            height: 80,
                            // color: Colors.blue[100],
                            child: Text(
                              'Staff2 is stucked at one point from last 30 mins',
                              textScaleFactor: 1.5,
                              textAlign: TextAlign.center,
                            ),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.blueAccent),
                                color: Colors.white),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                '/accidentreport',
                              );
                            },
                            child: Container(
                              width: 510,
                              height: 80,
                              // color: Colors.blue[100],
                              child: Text(
                                'Staff2 reported a Accident',
                                textScaleFactor: 1.5,
                                textAlign: TextAlign.center,
                              ),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent),
                                  color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
