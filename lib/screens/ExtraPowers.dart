import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class ExtraPowers extends StatefulWidget {
  ExtraPowers({Key key}) : super(key: key);

  @override
  _ExtraPowersState createState() => _ExtraPowersState();
}

class _ExtraPowersState extends State<ExtraPowers>
    with TickerProviderStateMixin {
  List<Map<String, String>> users = [
    {
      "name": "Staff 1",
      "userid": "User-ID",
      "profile": "assets/profileavatar.png",
      "statuscolor": "4286695300",
      "status": "Online",
      "rout": "/chatscreen",
      "locprofile": "assets/pin.png",
    },
    {
      "name": "Staff 2",
      "userid": "User-ID",
      "profile": "assets/profileavatar.png",
      "statuscolor": "4286695300",
      "status": "Online",
      "rout": "/chatscreen",
      "locprofile": "assets/pin.png",
    },
    {
      "name": "Staff 3",
      "userid": "User-ID",
      "profile": "assets/profileavatar.png",
      "statuscolor": "4293874512",
      "status": "Offline",
      "rout": "/chatscreen",
      "locprofile": "assets/pin.png",
    },
    {
      "name": "Police Station",
      "userid": "ID- , Assigned Admin-",
      "profile": "assets/station.png",
      "statuscolor": "4293874512",
      "status": "",
      "rout": "/chatscreen",
      "locprofile": "assets/station.png",
    },
    {
      "name": "SHO 1",
      "userid": "User-ID",
      "profile": "assets/sho.png",
      "statuscolor": "4286695300",
      "status": "Online",
      "rout": "/chatscreen",
      "locprofile": "assets/pin.png"
    },
    {
      "name": "SHO 2",
      "userid": "User-ID",
      "profile": "assets/sho.png",
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
      "locprofile": "assets/car.png",
    },
    {
      "name": "Vehicle 2",
      "userid": "regno- ,assignedstaff-",
      "profile": "assets/car.png",
      "statuscolor": "4293874512",
      "status": "Unavailable",
      "rout": "/vehiclescreen",
      "locprofile": "assets/car.png",
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
  List<Map<String, String>> sho = [
    {
      "name": "SHO 1",
      "userid": "User-ID",
      "profile": "assets/sho.png",
      "statuscolor": "4286695300",
      "status": "Online",
      "rout": "/chatscreen",
      "locprofile": "assets/pin.png"
    },
    {
      "name": "SHO 2",
      "userid": "User-ID",
      "profile": "assets/sho.png",
      "statuscolor": "4286695300",
      "status": "Online",
      "rout": "/chatscreen",
      "locprofile": "assets/pin.png"
    },
    {
      "name": "SHO 3",
      "userid": "User-ID",
      "profile": "assets/sho.png",
      "statuscolor": "4293874512",
      "status": "Offline",
      "rout": "/chatscreen",
      "locprofile": "assets/pin.png"
    },
    {
      "name": "SHO 4",
      "userid": "User-ID",
      "profile": "assets/sho.png",
      "statuscolor": "4286695300",
      "status": "Online",
      "rout": "/chatscreen",
      "locprofile": "assets/pin.png"
    },
    {
      "name": "SHO 5",
      "userid": "User-ID",
      "profile": "assets/sho.png",
      "statuscolor": "4293874512",
      "status": "Offline",
      "rout": "/chatscreen",
      "locprofile": "assets/pin.png"
    },
    {
      "name": "SHO 6",
      "userid": "User-ID",
      "profile": "assets/sho.png",
      "statuscolor": "4286695300",
      "status": "Online",
      "rout": "/chatscreen",
      "locprofile": "assets/pin.png"
    },
  ];
  List<Map<String, String>> teams = [
    {
      "name": "Team 1",
      "userid": "team-ID",
      "profile": "assets/groupavatar.png",
      "statuscolor": "4286695300",
      "status": "Online",
      "rout": "/chatscreen",
      "locprofile": "assets/pin1.png"
    },
    {
      "name": "Team 2",
      "userid": "team-ID",
      "profile": "assets/groupavatar.png",
      "statuscolor": "4286695300",
      "status": "Online",
      "rout": "/chatscreen",
      "locprofile": "assets/pin1.png"
    },
    {
      "name": "Team 3",
      "userid": "team-ID",
      "profile": "assets/groupavatar.png",
      "statuscolor": "4293874512",
      "status": "Offline",
      "rout": "/chatscreen",
      "locprofile": "assets/pin1.png"
    },
    {
      "name": "Team 4",
      "userid": "team-ID",
      "profile": "assets/groupavatar.png",
      "statuscolor": "4286695300",
      "status": "Online",
      "rout": "/chatscreen",
      "locprofile": "assets/pin1.png"
    },
    {
      "name": "Team 5",
      "userid": "team-ID",
      "profile": "assets/groupavatar.png",
      "statuscolor": "4293874512",
      "status": "Offline",
      "rout": "/chatscreen",
      "locprofile": "assets/pin1.png"
    },
    {
      "name": "Team 6",
      "userid": "team-ID",
      "profile": "assets/groupavatar.png",
      "statuscolor": "4286695300",
      "status": "Online",
      "rout": "/chatscreen",
      "locprofile": "assets/pin1.png"
    },
  ];
  List<Map<String, String>> vehicle = [
    {
      "name": "Vehicle 1",
      "userid": "Regno-,assignedID-",
      "profile": "assets/car.png",
      "statuscolor": "4286695300",
      "status": "Available",
      "rout": "/vehiclescreen",
      "locprofile": "assets/car.png",
    },
    {
      "name": "Vehicle 2",
      "userid": "Regno-,assignedID-",
      "profile": "assets/car.png",
      "statuscolor": "4286695300",
      "status": "Available",
      "rout": "/vehiclescreen",
      "locprofile": "assets/car.png",
    },
    {
      "name": "Vehicle 3",
      "userid": "Regno-,assignedID-",
      "profile": "assets/car.png",
      "statuscolor": "4293874512",
      "status": "Not Available",
      "rout": "/vehiclescreen",
      "locprofile": "assets/car.png",
    },
    {
      "name": "Vehicle 4",
      "userid": "Regno-,assignedID-",
      "profile": "assets/car.png",
      "statuscolor": "4286695300",
      "status": "Available",
      "rout": "/vehiclescreen",
      "locprofile": "assets/car.png",
    },
    {
      "name": "Vehicle 5",
      "userid": "Regno-,assignedID-",
      "profile": "assets/car.png",
      "statuscolor": "4293874512",
      "status": "Not Available",
      "rout": "/vehiclescreen",
      "locprofile": "assets/car.png",
    },
    {
      "name": "Vehicle 6",
      "userid": "Regno-,assignedID-",
      "profile": "assets/car.png",
      "statuscolor": "4286695300",
      "status": "Available",
      "rout": "/vehiclescreen",
      "locprofile": "assets/car.png",
    },
  ];
  List<Map<String, String>> staff = [
    {
      "name": "Staff 1",
      "userid": "Staff-ID",
      "profile": "assets/profileavatar.png",
      "statuscolor": "4286695300",
      "status": "Online",
      "rout": "/chatscreen",
      "locprofile": "assets/pin.png",
    },
    {
      "name": "Staff 2",
      "userid": "Staff-ID",
      "profile": "assets/profileavatar.png",
      "statuscolor": "4286695300",
      "status": "Online",
      "rout": "/chatscreen",
      "locprofile": "assets/pin.png",
    },
    {
      "name": "Staff 3",
      "userid": "Staff-ID",
      "profile": "assets/profileavatar.png",
      "statuscolor": "4293874512",
      "status": "Offline",
      "rout": "/chatscreen",
      "locprofile": "assets/pin.png",
    },
    {
      "name": "Staff 4",
      "userid": "Staff-ID",
      "profile": "assets/profileavatar.png",
      "statuscolor": "4286695300",
      "status": "Online",
      "rout": "/chatscreen",
      "locprofile": "assets/pin.png",
    },
    {
      "name": "Staff 5",
      "userid": "Staff-ID",
      "profile": "assets/profileavatar.png",
      "statuscolor": "4293874512",
      "status": "Offline",
      "rout": "/chatscreen",
      "locprofile": "assets/pin.png",
    },
    {
      "name": "Staff 6",
      "userid": "Staff-ID",
      "profile": "assets/profileavatar.png",
      "statuscolor": "4286695300",
      "status": "Online",
      "rout": "/chatscreen",
      "locprofile": "assets/pin.png",
    },
  ];
  List<Map<String, String>> places = [
    {
      "name": "Check Post",
      "userid": "ID- , Assigned admin -",
      "profile": "assets/station.png",
      "statuscolor": "4286695300",
      "status": " ",
      "rout": "/checkpost",
      "locprofile": "assets/station.png",
    },
    {
      "name": "Toll-Naka",
      "userid": "ID- , Assigned admin -",
      "profile": "assets/station.png",
      "statuscolor": "4286695300",
      "status": " ",
      "rout": "/checkpost",
      "locprofile": "assets/station.png",
    },
    {
      "name": "Police Station",
      "userid": "ID- , Assigned admin -",
      "profile": "assets/station.png",
      "statuscolor": "4293874512",
      "status": " ",
      "rout": "/checkpost",
      "locprofile": "assets/station.png",
    },
  ];

  // TickerProviderStateMixin allows the fade out/fade in animation when changing the active button

  // this will control the button clicks and tab changing
  TabController _controller;

  // this will control the animation when a button changes from an off state to an on state
  AnimationController _animationControllerOn;

  // this will control the animation when a button changes from an on state to an off state
  AnimationController _animationControllerOff;

  // this will give the background color values of a button when it changes to an on state
  Animation _colorTweenBackgroundOn;
  Animation _colorTweenBackgroundOff;

  // this will give the foreground color values of a button when it changes to an on state
  Animation _colorTweenForegroundOn;
  Animation _colorTweenForegroundOff;

  // when swiping, the _controller.index value only changes after the animation, therefore, we need this to trigger the animations and save the current index
  int _currentIndex = 0;

  // saves the previous active tab
  int _prevControllerIndex = 0;

  // saves the value of the tab animation. For example, if one is between the 1st and the 2nd tab, this value will be 0.5
  double _aniValue = 0.0;

  // saves the previous value of the tab animation. It's used to figure the direction of the animation
  double _prevAniValue = 0.0;

  // these will be our tab icons. You can use whatever you like for the content of your buttons
  List _icons = ["All", "SHO", "Teams", "Vehicle", "Staff", "Places"];

  // active button's foreground color
  Color _foregroundOn = Colors.white;
  Color _foregroundOff = Colors.black;

  // active button's background color
  Color _backgroundOn = Colors.deepPurpleAccent;
  Color _backgroundOff = Colors.grey[300];

  // scroll controller for the TabBar
  ScrollController _scrollController = new ScrollController();

  // this will save the keys for each Tab in the Tab Bar, so we can retrieve their position and size for the scroll controller
  List _keys = [];

  // regist if the the button was tapped
  bool _buttonTap = false;

  @override
  void initState() {
    super.initState();

    for (int index = 0; index < _icons.length; index++) {
      // create a GlobalKey for each Tab
      _keys.add(new GlobalKey());
    }

    // this creates the controller with 6 tabs (in our case)
    _controller = TabController(vsync: this, length: _icons.length);
    // this will execute the function every time there's a swipe animation
    _controller.animation.addListener(_handleTabAnimation);
    // this will execute the function every time the _controller.index value changes
    _controller.addListener(_handleTabChange);

    _animationControllerOff =
        AnimationController(vsync: this, duration: Duration(milliseconds: 75));
    // so the inactive buttons start in their "final" state (color)
    _animationControllerOff.value = 1.0;
    _colorTweenBackgroundOff =
        ColorTween(begin: _backgroundOn, end: _backgroundOff)
            .animate(_animationControllerOff);
    _colorTweenForegroundOff =
        ColorTween(begin: _foregroundOn, end: _foregroundOff)
            .animate(_animationControllerOff);

    _animationControllerOn =
        AnimationController(vsync: this, duration: Duration(milliseconds: 150));
    // so the inactive buttons start in their "final" state (color)
    _animationControllerOn.value = 1.0;
    _colorTweenBackgroundOn =
        ColorTween(begin: _backgroundOff, end: _backgroundOn)
            .animate(_animationControllerOn);
    _colorTweenForegroundOn =
        ColorTween(begin: _foregroundOff, end: _foregroundOn)
            .animate(_animationControllerOn);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.deepPurpleAccent,
          actions: [
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
                    arguments: {'name': 'SHO'});
              },
            ),
          ],
          title: Text("Extra Powers"),
        ),
        body: Column(children: <Widget>[
          // this is the TabBar
          Container(
              height: 49.0,
              // this generates our tabs buttons
              child: ListView.builder(
                  // this gives the TabBar a bounce effect when scrolling farther than it's size
                  physics: BouncingScrollPhysics(),
                  controller: _scrollController,
                  // make the list horizontal
                  scrollDirection: Axis.horizontal,
                  // number of tabs
                  itemCount: _icons.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                        // each button's key
                        key: _keys[index],
                        // padding for the buttons
                        padding: EdgeInsets.all(6.0),
                        child: ButtonTheme(
                            child: AnimatedBuilder(
                          animation: _colorTweenBackgroundOn,
                          builder: (context, child) => FlatButton(
                              // get the color of the button's background (dependent of its state)
                              color: _getBackgroundColor(index),
                              // make the button a rectangle with round corners
                              shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(7.0)),
                              onPressed: () {
                                setState(() {
                                  _buttonTap = true;
                                  // trigger the controller to change between Tab Views
                                  _controller.animateTo(index);
                                  // set the current index
                                  _setCurrentIndex(index);
                                  // scroll to the tapped button (needed if we tap the active button and it's not on its position)
                                  _scrollTo(index);
                                });
                              },
                              child: Text(
                                // get the icon
                                _icons[index],
                                // get the color of the icon (dependent of its state)
                                style: TextStyle(
                                    // backgroundColor: Colors.blue,
                                    color: Colors.black),
                              )),
                        )));
                  })),
          Flexible(
              // this will host our Tab Views
              child: TabBarView(
            // and it is controlled by the controller
            controller: _controller,
            children: <Widget>[
              // our Tab Views
              ListViewBuilder(),
              ListViewBuilder1(),
              ListViewBuilder2(),
              ListViewBuilder3(),
              ListViewBuilder4(),
              ListViewBuilder5(),
              // Text(_icons[6])
            ],
          )),
        ]));
  }

  // runs during the switching tabs animation
  _handleTabAnimation() {
    // gets the value of the animation. For example, if one is between the 1st and the 2nd tab, this value will be 0.5
    _aniValue = _controller.animation.value;

    // if the button wasn't pressed, which means the user is swiping, and the amount swipped is less than 1 (this means that we're swiping through neighbor Tab Views)
    if (!_buttonTap && ((_aniValue - _prevAniValue).abs() < 1)) {
      // set the current tab index
      _setCurrentIndex(_aniValue.round());
    }

    // save the previous Animation Value
    _prevAniValue = _aniValue;
  }

  // runs when the displayed tab changes
  _handleTabChange() {
    // if a button was tapped, change the current index
    if (_buttonTap) _setCurrentIndex(_controller.index);

    // this resets the button tap
    if ((_controller.index == _prevControllerIndex) ||
        (_controller.index == _aniValue.round())) _buttonTap = false;

    // save the previous controller index
    _prevControllerIndex = _controller.index;
  }

  _setCurrentIndex(int index) {
    // if we're actually changing the index
    if (index != _currentIndex) {
      setState(() {
        // change the index
        _currentIndex = index;
      });

      // trigger the button animation
      _triggerAnimation();
      // scroll the TabBar to the correct position (if we have a scrollable bar)
      _scrollTo(index);
    }
  }

  _triggerAnimation() {
    // reset the animations so they're ready to go
    _animationControllerOn.reset();
    _animationControllerOff.reset();

    // run the animations!
    _animationControllerOn.forward();
    _animationControllerOff.forward();
  }

  _scrollTo(int index) {
    // get the screen width. This is used to check if we have an element off screen
    double screenWidth = MediaQuery.of(context).size.width;

    // get the button we want to scroll to
    RenderBox renderBox = _keys[index].currentContext.findRenderObject();
    // get its size
    double size = renderBox.size.width;
    // and position
    double position = renderBox.localToGlobal(Offset.zero).dx;

    // this is how much the button is away from the center of the screen and how much we must scroll to get it into place
    double offset = (position + size / 2) - screenWidth / 2;

    // if the button is to the left of the middle
    if (offset < 0) {
      // get the first button
      renderBox = _keys[0].currentContext.findRenderObject();
      // get the position of the first button of the TabBar
      position = renderBox.localToGlobal(Offset.zero).dx;

      // if the offset pulls the first button away from the left side, we limit that movement so the first button is stuck to the left side
      if (position > offset) offset = position;
    } else {
      // if the button is to the right of the middle

      // get the last button
      renderBox = _keys[_icons.length - 1].currentContext.findRenderObject();
      // get its position
      position = renderBox.localToGlobal(Offset.zero).dx;
      // and size
      size = renderBox.size.width;

      // if the last button doesn't reach the right side, use it's right side as the limit of the screen for the TabBar
      if (position + size < screenWidth) screenWidth = position + size;

      // if the offset pulls the last button away from the right side limit, we reduce that movement so the last button is stuck to the right side limit
      if (position + size - offset < screenWidth) {
        offset = position + size - screenWidth;
      }
    }

    // scroll the calculated ammount
    _scrollController.animateTo(offset + _scrollController.offset,
        duration: new Duration(milliseconds: 150), curve: Curves.easeInOut);
  }

  _getBackgroundColor(int index) {
    if (index == _currentIndex) {
      // if it's active button
      return _colorTweenBackgroundOn.value;
    } else if (index == _prevControllerIndex) {
      // if it's the previous active button
      return _colorTweenBackgroundOff.value;
    } else {
      // if the button is inactive
      return _backgroundOff;
    }
  }

  _getForegroundColor(int index) {
    // the same as the above
    if (index == _currentIndex) {
      return _colorTweenForegroundOn.value;
    } else if (index == _prevControllerIndex) {
      return _colorTweenForegroundOff.value;
    } else {
      return _foregroundOff;
    }
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

  Widget ListViewBuilder1() {
    return Expanded(
      child: ListView(
        children: <Widget>[
          ...sho
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

  Widget ListViewBuilder2() {
    return Expanded(
      child: ListView(
        children: <Widget>[
          ...teams
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

  Widget ListViewBuilder3() {
    return Expanded(
      child: ListView(
        children: <Widget>[
          ...vehicle
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

  Widget ListViewBuilder5() {
    return Expanded(
      child: ListView(
        children: <Widget>[
          ...places
              .map((u) => <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/checkpost',
                        );

                        //  {
                        // 'name': u['name'],
                        // 'profile': u['profile']
                        // });
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
