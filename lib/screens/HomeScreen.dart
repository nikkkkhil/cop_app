import 'dart:typed_data';
import 'package:flutter/gestures.dart';
import 'package:flutter/scheduler.dart';
// import 'package:flutter_icons/flutter_icons.dart';
// import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:new_cop/screens/LoginScreen.dart';
import 'package:new_cop/screens/MapView.dart';
import 'package:new_cop/screens/ViewLocation.dart';
import 'package:new_cop/services/authoservice.dart';
import 'dart:ui' as ui;
import 'package:geocoder/geocoder.dart';
import 'package:intl/intl.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:fluttericon/brandico_icons.dart';
import 'package:fluttericon/elusive_icons.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:fluttericon/fontelico_icons.dart';
import 'package:fluttericon/iconic_icons.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:fluttericon/linecons_icons.dart';
import 'package:fluttericon/maki_icons.dart';
import 'package:fluttericon/meteocons_icons.dart';
import 'package:fluttericon/mfg_labs_icons.dart';
import 'package:fluttericon/modern_pictograms_icons.dart';
import 'package:fluttericon/octicons_icons.dart';
import 'package:fluttericon/rpg_awesome_icons.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:fluttericon/web_symbols_icons.dart';
import 'package:fluttericon/zocial_icons.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class Item {
  const Item(this.name, this.icon);
  final String name;
  final Image icon;
}

class _HomeScreenState extends State<HomeScreen> {
  LatLng _center;
  Position currentLocation;
  bool searchstate = false;
  bool sortstate = false;
  var user_id;
  var name;
  var password;
  var phoneno;
  var uploadid;
  var user_type;
  bool pagestate = true;
  bool searchdisplay = false;
  bool sortdisplay = false;
  bool floatingstate = false;
  var lat, long;
  int currentPage = 0;
  // Position userLocation;
  final center = LatLng(13.034922356585376, 77.52705922370333);
  final streetStyle = "mapbox://styles/nikhil14/cklj77py206ed17o8tqwfzih1";
  final navigationStyle = "mapbox://styles/nikhil14/ckljnixcf0nmc17k8czbg27ik";
  String selectedStyle = "mapbox://styles/nikhil14/cklj77py206ed17o8tqwfzih1";
  MapboxMapController mapController;
  Item selectedUser;
  List<Item> endusers = <Item>[
    const Item(
        'Staff',
        Image(
            image: AssetImage("assets/profileavatar.png"),
            height: 10,
            width: 10)),
    const Item(
        'Team',
        Image(
          image: AssetImage("assets/groupavatar.png"),
        )),
    const Item(
        'Vehicle',
        Image(
          image: AssetImage("assets/car.png"),
        )),
    // const Item(
    //     'iOS',
    //     Icon(
    //       Icons.mobile_screen_share,
    //       color: const Color(0xFF167F67),
    //     )),
  ];
  List<Map<String, String>> names = [];
  List<Map<String, String>> sortusers = [];
  List<Map<String, String>> users = [
    {
      "name": "Staff 1",
      "userid": "User-ID",
      "profile": "assets/profileavatar.png",
      "statuscolor": "4286695300",
      "status": "Online",
      "rout": "/chatscreen",
      "locprofile": "assets/pin.png"
    },
    {
      "name": "Staff 2",
      "userid": "User-ID",
      "profile": "assets/profileavatar.png",
      "statuscolor": "4286695300",
      "status": "Online",
      "rout": "/chatscreen",
      "locprofile": "assets/pin.png"
    },
    {
      "name": "Staff 3",
      "userid": "User-ID",
      "profile": "assets/profileavatar.png",
      "statuscolor": "4293874512",
      "status": "Offline",
      "rout": "/chatscreen",
      "locprofile": "assets/pin.png"
    },
    {
      "name": "Vehicle 1",
      "userid": "regno- ,assignedstaff-",
      "profile": "assets/car.png",
      "statuscolor": "4286695300",
      "status": "Available",
      "rout": "/vehiclescreen",
      "locprofile": "assets/car.png"
    },
    {
      "name": "Vehicle 2",
      "userid": "regno- ,assignedstaff-",
      "profile": "assets/car.png",
      "statuscolor": "4293874512",
      "status": "Unavailable",
      "rout": "/vehiclescreen",
      "locprofile": "assets/car.png"
    },
    {
      "name": "Team 1",
      "userid": "Team-ID-,Investigationcase-accident",
      "profile": "assets/groupavatar.png",
      "statuscolor": "4286695300",
      "status": "Active",
      "rout": "/chatscreen",
      "locprofile": "assets/pin1.png"
    },
    {
      "name": "Team 2",
      "userid": "Team-ID-,Investigationcase-accident",
      "profile": "assets/groupavatar.png",
      "statuscolor": "4293874512",
      "status": "Not Active",
      "rout": "/chatscreen",
      "locprofile": "assets/pin1.png"
    },
  ];

  void _onMapCreated(MapboxMapController controller) {
    mapController = controller;
    _onStyleLoaded();
  }

  void _onStyleLoaded() {
    addImageFromAsset("assetImage", "assets/pin.png");
    addImageFromUrl(
        "networkImage", Uri.parse("https://via.placeholder.com/50"));
  }

  /// Adds an asset image to the currently displayed style
  Future<void> addImageFromAsset(String name, String assetName) async {
    // Resize the image to a 120x? thumbnail (maintaining the aspect ratio).
    final ByteData bytes = await rootBundle.load(assetName);
    final Uint8List list = bytes.buffer.asUint8List();
    return mapController.addImage(name, list);
  }

  /// Adds a network image to the currently displayed style
  Future<void> addImageFromUrl(String name, Uri uri) async {
    var response = await http.get(uri);
    return mapController.addImage(name, response.bodyBytes);
  }

  GlobalKey bottomNavigationKey = GlobalKey();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserLocation();
    names = users;
    sortusers = users;
  }

  Column buttonsFloat() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        SizedBox(
          height: 5,
          width: 5,
        ),
        Image(
          image: AssetImage("assets/pin1.png"),
          width: 50,
          height: 50,
        ),
        Text(
          "Group",
          style: TextStyle(
              color: Colors.red, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        SizedBox(height: 5),
        Image(
          image: AssetImage("assets/car.png"),
          width: 50,
          height: 50,
        ),
        Text(
          "Vehicle",
          style: TextStyle(
              color: Colors.red, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        SizedBox(height: 5),
        Image(
          image: AssetImage("assets/pin.png"),
          width: 50,
          height: 50,
        ),
        Text(
          "Staff",
          style: TextStyle(
              color: Colors.red, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        SizedBox(height: 5),
        // FloatingActionButton(
        // child: Icon(Icons.location_city_sharp), onPressed: () {}
        // selectedStyle = _determinePosition() as String;
        // _getLocation().then(
        //   (value) {
        // setState(
        // () {
        // userLocation = value;
        // print(userLocation);
        // },
        // );
        // },
        // );
        // },
        // ),
        // SizedBox(
        //   height: 5,
        // ),
        // FloatingActionButton(
        //   child: Icon(Icons.sentiment_very_dissatisfied),
        //   onPressed: () {
        //     print('pressed sad');
        //     _onStyleLoaded();
        //     mapController.addSymbol(
        //       SymbolOptions(
        //         geometry: center,
        //         iconSize: 0.3,
        //         iconImage: 'assetImage',
        //         textField: 'Pinged place',
        //         textOffset: Offset(0, 3),
        //       ),
        //     );
        //   },
        // ),
        SizedBox(
          height: 5,
        ),
        FloatingActionButton(
          child: Icon(Icons.zoom_in),
          onPressed: () {
            mapController.animateCamera(CameraUpdate.zoomIn());
          },
        ),
        SizedBox(height: 5),
        FloatingActionButton(
          child: Icon(Icons.zoom_out),
          onPressed: () {
            mapController.animateCamera(CameraUpdate.zoomOut());
          },
        ),
        SizedBox(height: 5),
        FloatingActionButton(
            child: Icon(Icons.add_to_home_screen),
            onPressed: () {
              if (selectedStyle == streetStyle) {
                selectedStyle = navigationStyle;
                print(selectedStyle);
              } else {
                selectedStyle = streetStyle;
                print(selectedStyle);
              }
              setState(() {});
            })
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: floatingstate ? buttonsFloat() : null,
      appBar: new AppBar(
        // title: new Text(widget.title),
        automaticallyImplyLeading: false,

        title: Text("Home Page"),
        titleSpacing: 1,
        centerTitle: false,
        elevation: 0.0,
        backgroundColor: Colors.deepPurpleAccent,
        actions: [
          sortstate
              ? new IconButton(
                  icon: Icon(FontAwesome5.sort_amount_up),
                  highlightColor: Colors.pink,
                  onPressed: () {
                    setState(() {
                      sortdisplay = true;
                    });
                    // Navigator.pushNamed(
                    //   context,
                    //   '/notification',
                    // );
                  },
                )
              : Text(" "),
          SizedBox(width: 10),
          searchstate
              ? new IconButton(
                  icon: Icon(
                    Octicons.search,
                  ),
                  highlightColor: Colors.pink,
                  onPressed: () {
                    setState(() {
                      searchdisplay = true;
                      sortdisplay = false;
                      sortusers = users;
                    });
                    // Navigator.pushNamed(
                    //   context,
                    //   '/notification',
                    // );
                  },
                )
              : Text(" "),
          SizedBox(width: 10),
          new IconButton(
            icon: Icon(
              Icons.notification_important,
            ),
            highlightColor: Colors.pink,
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/notification',
              );
            },
          ),
          SizedBox(width: 30),
          InkWell(
            child: Image(
              image: AssetImage('assets/brocast.png'),
              color: Colors.white,
              width: 30,
              height: 30,
            ),
            highlightColor: Colors.pink,
            onTap: () {
              Navigator.pushNamed(context, '/broadcast',
                  arguments: {'name': 'staff'});
            },
          ),
          SizedBox(width: 20),
        ],
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: pagestate
            ? _getPage(currentPage)
            : Container(
                color: Colors.transparent,
                child: Center(
                  child: CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Colors.deepPurpleAccent),
                  ),
                ),
              ),
      ),
      bottomNavigationBar: FancyBottomNavigation(
        barBackgroundColor: Colors.deepPurpleAccent,
        activeIconColor: Colors.deepPurpleAccent,
        circleColor: Colors.white,
        inactiveIconColor: Colors.white,
        textColor: Colors.white,
        tabs: [
          TabData(
              iconData: Icons.home,
              title: "Home",
              onclick: () {
                final FancyBottomNavigationState fState = bottomNavigationKey
                    .currentState as FancyBottomNavigationState;
                fState.setPage(0);
              }),
          TabData(
              iconData: Icons.account_circle,
              title: "Staff",
              onclick: () {
                final FancyBottomNavigationState fState = bottomNavigationKey
                    .currentState as FancyBottomNavigationState;
                fState.setPage(1);
              }),
          TabData(
              iconData: Icons.add_location_alt_outlined,
              title: "Map View",
              onclick: () {
                // print('cliecker');
                // Navigator.pushNamed(
                //   context,
                //   '/mapview',
                // );}
                // setState(() {
                //   floatingstate = true;
                // });
                final FancyBottomNavigationState fState = bottomNavigationKey
                    .currentState as FancyBottomNavigationState;
                fState.setPage(2);
              }),
          TabData(
            iconData: Icons.settings,
            title: "Settings",
            // onclick: () => Navigator.of(context)
            //     .push(MaterialPageRoute(builder: (context) => SecondPage()))
          ),
          // TabData(iconData: Icons.shopping_cart, title: "Basket")
        ],
        initialSelection: 0,
        key: bottomNavigationKey,
        onTabChangedListener: (position) {
          setState(() {
            currentPage = position;
            print(currentPage);
          });
          if (position == 2) {
            setState(() {
              floatingstate = true;
              searchstate = true;
            });
          } else if (position == 1) {
            setState(() {
              floatingstate = false;
              searchstate = true;
              sortstate = true;
            });
          } else {
            setState(() {
              floatingstate = false;
              searchstate = false;
              sortstate = false;
            });
          }
        },
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[Text("Hello"), Text("World")],
        ),
      ),
    );
  }

  //   return new Stack(children: <Widget>[get_value()]);
  _getPage(int page) {
    switch (page) {
      case 0:
        setState(() {
          floatingstate = false;
        });
        return Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch, // add this

                children: [
                  Container(
                    width: 300,
                    height: 200,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Center(
                      child: Text(
                        "Task Discription",
                        textScaleFactor: 2,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 300,
                    height: 200,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Center(
                      child: Text(
                        "Your Role \nYour Team \nTeam Leader",
                        textScaleFactor: 2,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 300,
                    height: 200,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: lat == null
                        ? Container(
                            color: Colors.transparent,
                            child: Center(
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.deepPurpleAccent),
                              ),
                            ),
                          )
                        : createMap1(),
                  ),
                ],
              ),
            )
          ],
        );
      case 1:
        setState(() {
          floatingstate = false;
        });
        return
            // Column(
            //   mainAxisSize: MainAxisSize.min,
            //   children: <Widget>[
            _searchBar();
      //   ],
      // );
      case 2:
        // final controller = Get.put(Controller());
        setState(() {
          floatingstate = true;
        });

        return createMap();
      case 3:
        setState(() {
          floatingstate = false;
        });
        return Center(
          child: Column(
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.deepPurpleAccent,
                radius: 100,
                backgroundImage: AssetImage("assets/profileavatar.png"),
              ),
              Text("Station House Officer", style: TextStyle(fontSize: 30)),
              SizedBox(height: 10),
              Container(
                width: 350,
                height: 50,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Center(
                  child: Text(
                    "Precmchand \nPremchand@gmail.com",
                    textScaleFactor: 1.5,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: 350,
                height: 360,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "/nearadmin");
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment
                            .start, //Center Row contents horizontally,
                        crossAxisAlignment: CrossAxisAlignment
                            .start, //Center Row contents vertically,
                        children: <Widget>[
                          SizedBox(
                            width: 25,
                          ),
                          Icon(
                            Elusive.location_circled,
                            color: Colors.deepPurpleAccent,
                            size: 30,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Nearby Admin',
                            textScaleFactor: 1.5,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "/extrapowers");
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment
                            .start, //Center Row contents horizontally,
                        crossAxisAlignment: CrossAxisAlignment
                            .start, //Center Row contents vertically,
                        children: <Widget>[
                          SizedBox(
                            width: 25,
                          ),
                          Icon(
                            FontAwesome5.hand_rock,
                            color: Colors.deepPurpleAccent,
                            size: 30,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Extra Powers',
                            textScaleFactor: 1.5,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "/reportcard");
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment
                            .start, //Center Row contents horizontally,
                        crossAxisAlignment: CrossAxisAlignment
                            .start, //Center Row contents vertically,
                        children: <Widget>[
                          SizedBox(
                            width: 25,
                          ),
                          Icon(
                            Linecons.doc,
                            color: Colors.deepPurpleAccent,
                            size: 30,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'My Report Card',
                            textScaleFactor: 1.5,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "/profileupdate");
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment
                            .start, //Center Row contents horizontally,
                        crossAxisAlignment: CrossAxisAlignment
                            .start, //Center Row contents vertically,
                        children: <Widget>[
                          SizedBox(
                            width: 25,
                          ),
                          Icon(
                            FontAwesome5.user_edit,
                            color: Colors.deepPurpleAccent,
                            size: 30,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Request for Profile Update',
                            textScaleFactor: 1.5,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "/logreport");
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment
                            .start, //Center Row contents horizontally,
                        crossAxisAlignment: CrossAxisAlignment
                            .start, //Center Row contents vertically,
                        children: <Widget>[
                          SizedBox(
                            width: 25,
                          ),
                          Icon(
                            FontAwesome5.blog,
                            color: Colors.deepPurpleAccent,
                            size: 30,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Log Report',
                            textScaleFactor: 1.5,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "/commonsettings");
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment
                            .start, //Center Row contents horizontally,
                        crossAxisAlignment: CrossAxisAlignment
                            .start, //Center Row contents vertically,
                        children: <Widget>[
                          SizedBox(
                            width: 25,
                          ),
                          Icon(
                            Octicons.settings,
                            color: Colors.deepPurpleAccent,
                            size: 30,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Common settings',
                            textScaleFactor: 1.5,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "/chatscreen", arguments: {
                          'name': "SP",
                          'profile': "assets/sho.png",
                          'status': 'online'
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment
                            .start, //Center Row contents horizontally,
                        crossAxisAlignment: CrossAxisAlignment
                            .start, //Center Row contents vertically,
                        children: <Widget>[
                          SizedBox(
                            width: 25,
                          ),
                          Icon(
                            Linecons.user,
                            color: Colors.deepPurpleAccent,
                            size: 30,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Connect to SHO',
                            textScaleFactor: 1.5,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "/accountsettings");
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment
                            .start, //Center Row contents horizontally,
                        crossAxisAlignment: CrossAxisAlignment
                            .start, //Center Row contents vertically,
                        children: <Widget>[
                          SizedBox(
                            width: 25,
                          ),
                          Icon(
                            ModernPictograms.wrench,
                            color: Colors.deepPurpleAccent,
                            size: 30,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Account Settings',
                            textScaleFactor: 1.5,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    LoginScreen()));
                        // Navigator.of(context).pop();
                        // Navigator.of(context).pushReplacement(MaterialPageRoute(
                        //     builder: (BuildContext context) => LoginScreen()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment
                            .start, //Center Row contents horizontally,
                        crossAxisAlignment: CrossAxisAlignment
                            .start, //Center Row contents vertically,
                        children: <Widget>[
                          SizedBox(
                            width: 25,
                          ),
                          Icon(
                            Entypo.logout,
                            color: Colors.deepPurpleAccent,
                            size: 30,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Log Out',
                            textScaleFactor: 1.5,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      default:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("This is the basket page"),
            RaisedButton(
              child: Text(
                "Start new page",
                style: TextStyle(color: Colors.white),
              ),
              color: Theme.of(context).primaryColor,
              onPressed: () {},
            )
          ],
        );
    }
  }

  Widget get_value() {
    final String imgUrl =
        'https://i.pinimg.com/originals/18/fd/64/18fd644e9cdf81ab785d606584a384fb.jpg';
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    if (arguments != null) {
      user_id = arguments['user_id'];
    }
    AuthService().readStaff("staff", "uploadid", user_id).then((val) {
      print('val $val');

      setState(() {
        name = val.data[0]['Name'];
        password = val.data[0]['password'].toString();
        phoneno = val.data[0]['phoneno'];
        uploadid = val.data[0]['uploadid'];
        user_type = val.data[0]['user_type'];
        pagestate = false;
      });
    });
  }

  Future<Position> locateUser() async {
    return Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  getUserLocation() async {
    currentLocation = await locateUser();
    setState(() {
      _center = LatLng(currentLocation.latitude, currentLocation.longitude);
      lat = currentLocation.latitude;
      long = currentLocation.longitude;
    });
    print('center $_center');
  }

  MapboxMap createMap() {
    return MapboxMap(
      styleString: selectedStyle,
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(target: center, zoom: 14),
      onStyleLoadedCallback: () => addSymbol(mapController),
    );
  }

  MapboxMap createMap1() {
    return MapboxMap(
      styleString: selectedStyle,
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(target: center, zoom: 14),
      onStyleLoadedCallback: () => addSymbol1(mapController),
    );
  }

  Map loc = {
    13.03784708994858: 77.52744181918773,
    13.02923055788236: 77.5290197821749,
    13.03675935706378: 77.5307231765962,
    13.036886228560691: 77.52995657302692,
    13.033712512993592: 77.52267776212373,
    13.042712799956888: 77.52864059337409,
    13.037280346095988: 77.52493895818728,
    13.02853936747364: 77.52824868993412,
    13.030287074475588: 77.52509647269537,
    13.036505503868325: 77.52453730411614,
    13.028245864645154: 77.52898068603696,
    13.029088819781085: 77.52706180047262,
    13.032802978875312: 77.53019603369692,
    13.041962756125011: 77.52782172432984,
    13.04090012275526: 77.52856673206998,
    13.03129263169677: 77.52487058635903,
    13.033884510816083: 77.52934290227692,
    13.028402010355135: 77.52668236168873,
    13.032291173138347: 77.52675285298474
  };
  Map loc1 = {
    13.03504556353943: 77.52733158459901,
    13.037232870366811: 77.52341777890524,
    13.038506271335814: 77.52138110503512,
    13.02853874928908: 77.52116002260898,
    13.028339028085579: 77.52310934593928,
    13.0285243728005: 77.52424303140067,
    13.038978625252684: 77.52137593508564,
    13.027236834810468: 77.52398384810279,
    13.035515548225584: 77.52462014290062,
    13.029980864279391: 77.52018182408999,
    13.042174035458507: 77.5212713398583,
    13.037313208736: 77.5244641730287,
    13.038772921522726: 77.52279263825376,
    13.035367057377256: 77.51971334955293,
    13.0342078852597: 77.52010159068261,
    13.032075816532947: 77.51967746685229,
    13.033014567510916: 77.52445817489517,
    13.041988915216033: 77.521302663872,
    13.028539501591654: 77.5226542236981
  };
  Map loc2 = {
    13.027950958045832: 77.52018426811813,
    13.041552408172324: 77.52167403649689,
    13.035361923773968: 77.51620060564387,
    13.04034450429879: 77.51781467509782,
    13.042965259899931: 77.5208716927105,
    13.03126251645751: 77.51884759774066,
    13.036511694297998: 77.51960368924577,
    13.033659351622017: 77.52209796413186,
    13.033551433614559: 77.52221146506719,
    13.043047575121982: 77.51962051614913,
    13.036936253618812: 77.52299333417466,
    13.03973301767295: 77.5175145496105,
    13.041748330494741: 77.52202600298034,
    13.037792667015735: 77.51996315807614,
    13.028115255046128: 77.51780302189614,
    13.038336733851226: 77.52338811285209,
    13.04011848163699: 77.51717138287125,
    13.030696508018808: 77.51861095073787,
    13.037783267726915: 77.52224752782264
  };
  void addSymbol1(MapboxMapController mapBoxController) {
    // for (dynamic l in loc.entries) {
    // print(l);

    mapBoxController.addSymbol(
      SymbolOptions(
        geometry: LatLng(lat, long),
        iconImage: "assets/pin.png",
        iconSize: 0.3,
        textField: 'Target',
        textSize: 25,
        // textRotate:
      ),
    );
  }

  void addSymbol(MapboxMapController mapBoxController) {
    // for (dynamic l in loc.entries) {
    // print(l);

    loc.forEach((k, v) => mapBoxController.addSymbol(
          SymbolOptions(
            geometry: LatLng(k, v),
            iconImage: "assets/car.png",
            iconSize: 0.3,
            textField: 'Vehicle',
          ),
        ));
    loc1.forEach((k, v) => mapBoxController.addSymbol(
          SymbolOptions(
            geometry: LatLng(k, v),
            iconImage: "assets/pin.png",
            iconSize: 0.3,
            textField: 'Staff',
          ),
        ));
    loc2.forEach((k, v) => mapBoxController.addSymbol(
          SymbolOptions(
            geometry: LatLng(k, v),
            iconImage: "assets/pin1.png",
            iconColor: "4282557941",
            iconSize: 0.3,
            textField: 'Group',
          ),
        ));
    // }
  }

  _callNumber() async {
    const number = '08592119XXXX'; //set the number here
    bool res = await FlutterPhoneDirectCaller.callNumber(number);
  }

  Widget getTextWidgets(List<String> strings) {
    List<Widget> list = new List<Widget>();
    for (var i = 0; i < strings.length; i++) {
      list.add(new Text(strings[i]));
    }
    return new Row(children: list);
  }

  _sortBar() {
    DropdownButton<Item>(
      iconEnabledColor: Colors.deepPurpleAccent,
      focusColor: Colors.deepPurpleAccent,
      hint: Text("Select item"),
      value: selectedUser,
      onChanged: (Item Value) {
        setState(() {
          selectedUser = Value;
        });
      },
      items: endusers.map((Item user) {
        return DropdownMenuItem<Item>(
          value: user,
          child: Row(
            children: <Widget>[
              user.icon,
              SizedBox(
                width: 300,
              ),
              Text(
                user.name,
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  _searchBar() {
    return Column(children: [
      searchdisplay
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(hintText: "Search...."),
                onChanged: (text) {
                  text = text.toLowerCase();
                  setState(() {
                    sortusers = names.where((note) {
                      print('note $note');
                      var noteTitle = note['name'].toLowerCase();
                      return noteTitle.contains(text);
                    }).toList();
                  });
                },
              ),
            )
          : Container(
              width: 0,
              height: 0,
            ),
      sortdisplay
          ? DropdownButton<Item>(
              hint: Text("Select "),
              value: selectedUser,
              onChanged: (Item Value) {
                print('Value ${Value.name}');
                setState(() {
                  selectedUser = Value;
                  if (Value.name == "Staff") {
                    sortusers = [];
                    sortusers = [users[0]] + [users[1]] + [users[2]];
                  }
                  if (Value.name == "Vehicle") {
                    sortusers = [];
                    sortusers = [users[3]] + [users[4]];
                  }
                  if (Value.name == "Team") {
                    sortusers = [];
                    sortusers = [users[5]] + [users[6]];
                  }
                });
              },
              items: endusers.map((Item user) {
                return DropdownMenuItem<Item>(
                  value: user,
                  child: Row(
                    children: <Widget>[
                      Container(width: 50, height: 50, child: user.icon),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        user.name,
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                );
              }).toList(),
            )
          : Container(
              width: 0,
              height: 0,
            ),
      Expanded(
        child: ListView(
          children: <Widget>[
            ...sortusers
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
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween, // added line
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
                                        bool res =
                                            await FlutterPhoneDirectCaller
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
      )
    ]);
  }

  Widget ListViewBuilder() {
    return Expanded(
      child: ListView(
        children: <Widget>[
          ...users
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
