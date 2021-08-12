import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class NearAdmin extends StatefulWidget {
  NearAdmin({Key key}) : super(key: key);

  @override
  _NearAdminState createState() => _NearAdminState();
}

class _NearAdminState extends State<NearAdmin> {
  List<Map<String, String>> users = [
    {
      "name": "SHO 1",
      "userid": "User-ID",
      "profile": "assets/profileavatar.png",
      "statuscolor": "4286695300",
      "status": "Online",
      "rout": "/chatscreen",
      "locprofile": "assets/pin.png"
    },
    {
      "name": "SHO 2",
      "userid": "User-ID",
      "profile": "assets/profileavatar.png",
      "statuscolor": "4286695300",
      "status": "Online",
      "rout": "/chatscreen",
      "locprofile": "assets/pin.png"
    },
    {
      "name": "SHO 3",
      "userid": "User-ID",
      "profile": "assets/profileavatar.png",
      "statuscolor": "4293874512",
      "status": "Offline",
      "rout": "/chatscreen",
      "locprofile": "assets/pin.png"
    },
    {
      "name": "SHO 4",
      "userid": "User-ID",
      "profile": "assets/profileavatar.png",
      "statuscolor": "4286695300",
      "status": "Available",
      "rout": "/chatscreen",
      "locprofile": "assets/pin.png"
    },
    {
      "name": "SHO 5",
      "userid": "User-ID",
      "profile": "assets/profileavatar.png",
      "statuscolor": "4293874512",
      "status": "Unavailable",
      "rout": "/chatscreen",
      "locprofile": "assets/pin.png"
    },
    {
      "name": "SHO 6",
      "userid": "User-ID",
      "profile": "assets/profileavatar.png",
      "statuscolor": "4286695300",
      "status": "Active",
      "rout": "/chatscreen",
      "locprofile": "assets/pin.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text("Nearby SHO"),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListViewBuilder(),
        ],
      ),
    );
  }

  Widget ListViewBuilder() {
    return Expanded(
      child: ListView(
        children: <Widget>[
          ...users
              .map((u) => <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          u['rout'],
                          arguments: {
                            'name': u['name'],
                            'profile': u['profile'],
                            'status': u['status']
                          },
                        );
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
                                      "locprofile": u['locprofile'],
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
