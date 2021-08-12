import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:fluttericon/elusive_icons.dart';

class CheckPost extends StatefulWidget {
  CheckPost({Key key}) : super(key: key);

  @override
  _CheckPostState createState() => _CheckPostState();
}

class _CheckPostState extends State<CheckPost> {
  List<Map<String, String>> staff = [
    {
      "name": "Staff 1",
      "userid": "Staff-ID",
      "profile": "assets/profileavatar.png",
      "locprofile": "assets/pin.png",
      "statuscolor": "4286695300",
      "status": "Online",
      "rout": "/chatscreen"
    },
    {
      "name": "Staff 2",
      "userid": "Staff-ID",
      "profile": "assets/profileavatar.png",
      "locprofile": "assets/pin.png",
      "statuscolor": "4286695300",
      "status": "Online",
      "rout": "/chatscreen"
    },
    {
      "name": "Staff 3",
      "userid": "Staff-ID",
      "profile": "assets/profileavatar.png",
      "locprofile": "assets/pin.png",
      "statuscolor": "4293874512",
      "status": "Offline",
      "rout": "/chatscreen"
    },
    {
      "name": "Staff 4",
      "userid": "Staff-ID",
      "profile": "assets/profileavatar.png",
      "locprofile": "assets/pin.png",
      "statuscolor": "4286695300",
      "status": "Online",
      "rout": "/chatscreen"
    },
    {
      "name": "Staff 5",
      "userid": "Staff-ID",
      "profile": "assets/profileavatar.png",
      "locprofile": "assets/pin.png",
      "statuscolor": "4293874512",
      "status": "Offline",
      "rout": "/chatscreen"
    },
    {
      "name": "Staff 6",
      "userid": "Staff-ID",
      "profile": "assets/profileavatar.png",
      "locprofile": "assets/pin.png",
      "statuscolor": "4286695300",
      "status": "Online",
      "rout": "/chatscreen"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Row(
          children: [
            Icon(
              Elusive.location_circled,
              color: Colors.white,
              size: 30,
            ),
            SizedBox(width: 10),
            Text('Check Post'),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            width: 300,
            height: 100,
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Center(
              child: Text(
                """Information about Check-post""",
                textScaleFactor: 1.3,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Divider(
            color: Colors.black,
            endIndent: 10,
            indent: 10,
          ),
          Text(
            "Check-Post Officer",
            // textAlign: TextAlign.left,
          ),
          Container(
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  "/chatscreen",
                );
              },
              child: ListTile(
                leading: CircleAvatar(
                    backgroundColor: Colors.deepPurpleAccent,
                    radius: 20,
                    backgroundImage: AssetImage('assets/sho.png')),
                title: Text("Staff1"),
                subtitle: Text("UserID"),
                trailing: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween, // added line
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/viewlocation',
                            arguments: {'locprofile': 'assets/pin.png'});
                      },
                      child: Icon(
                        Icons.add_location,
                        color: Colors.green,
                        size: 40,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.green,
                          border: Border.all(
                            color: Colors.green,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: InkWell(
                        onTap: () async {
                          const number = '08592119XXXX'; //set the number here
                          bool res =
                              await FlutterPhoneDirectCaller.callNumber(number);
                        },
                        child: Icon(
                          Icons.call,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.black,
                      endIndent: 10,
                      indent: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Divider(
            color: Colors.black,
            endIndent: 10,
            indent: 10,
          ),
          Text(
            "Staff Members", style: TextStyle(fontSize: 20),
            // textAlign: TextAlign.left,
          ),
          SizedBox(
            width: 10,
          ),
          ListViewBuilder4()
        ],
      ),
    );
  }

  Widget ListViewBuilder4() {
    return Expanded(
      child: ListView(
        children: <Widget>[
          ...staff
              .map((u) => <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, u['rout'], arguments: {
                          'name': u['name'],
                          'profile': u['profile'],
                          'status': u['status']
                        });
                      },
                      child: ListTile(
                          leading: CircleAvatar(
                              backgroundColor: Colors.deepPurpleAccent,
                              radius: 20,
                              backgroundImage: AssetImage(u['profile'])),
                          title: Text(u['name']),
                          subtitle: Text(u['userid']),
                          trailing: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween, // added line
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  u['status'],
                                  style: TextStyle(
                                    color: Color(int.parse(u['statuscolor'])),
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, '/viewlocation', arguments: {
                                      'locprofile': u['locprofile'],
                                      'name': u['name']
                                    });
                                  },
                                  child: Icon(
                                    Icons.add_location,
                                    color: Colors.green,
                                    size: 40,
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      border: Border.all(
                                        color: Colors.green,
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  child: InkWell(
                                    onTap: () async {
                                      const number =
                                          '08592119XXXX'; //set the number here
                                      bool res = await FlutterPhoneDirectCaller
                                          .callNumber(number);
                                    },
                                    child: Icon(
                                      Icons.call,
                                      color: Colors.white,
                                      size: 40,
                                    ),
                                  ),
                                )
                              ])),
                    ),
                    Divider(
                      color: Colors.black,
                      endIndent: 10,
                      indent: 10,
                    )
                  ])
              .expand((element) => element)
              .toList(),
        ],
      ),
    );
  }
}
