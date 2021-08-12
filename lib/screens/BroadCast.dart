import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:image_picker/image_picker.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:new_cop/screens/HomeScreen.dart';
import 'package:geolocator/geolocator.dart';

class BroadCast extends StatefulWidget {
  BroadCast({Key key}) : super(key: key);

  @override
  _BroadCastState createState() => _BroadCastState();
}

class _BroadCastState extends State<BroadCast> {
  File _image;
  bool _value1 = false;
  bool _value2 = false;
  bool _value3 = false;
  bool _value4 = false;
  bool _value5 = false;
  bool _value6 = false;
  bool _value7 = false;

  bool select_all = false;
  bool send_state = false;
  // _image != null;
  Future<void> getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  _imgFromCamera() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50);

    setState(() {
      _image = image;
    });
  }

  _imgFromGallery() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      // _image != null;
      _image = image;
    });
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    if (arguments['name'] == 'SHO') {
      send_state = true;
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text('Broadcast'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 32,
            ),
            Container(
              child: Theme(
                data: new ThemeData(
                  primaryColor: Colors.deepPurpleAccent,
                  primaryColorDark: Colors.red,
                ),
                child: TextField(
                  // maxLines: 10,
                  keyboardType: TextInputType.multiline,
                  maxLength: null,
                  maxLines: null,
                  decoration: InputDecoration(
                    border: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(50.0),
                      ),
                    ),
                    // contentPadding:
                    //     EdgeInsets.only(top: 20), // add padding to adjust text
                    isDense: true,
                    hintText: "Enter your message",
                    suffixIconConstraints:
                        BoxConstraints(minWidth: 32, minHeight: 32),
                    suffixIcon: Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween, // added line
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            _showPicker(context);
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: _image == null
                                ? Icon(Icons.camera_alt)
                                : Icon(Icons.camera_alt),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        new IconButton(
                          icon: new Icon(Icons.attach_file),
                          highlightColor: Colors.pink,
                          onPressed: () async {
                            print('cli');
                            FilePickerResult result =
                                await FilePicker.platform.pickFiles();

                            if (result != null) {
                              PlatformFile file = result.files.first;

                              print(file.name);
                              print(file.bytes);
                              print(file.size);
                              print(file.extension);
                              print(file.path);
                            } else {
                              // User canceled the picker
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
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
            send_state
                ? Row(
                    children: [
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              select_all = true;
                              setState(() {
                                _value1 = true;
                                _value2 = true;
                                _value3 = true;
                                _value4 = true;
                                _value5 = true;
                                // _value6 = true;
                                // _value7 = true;
                              });
                            },
                            child: Container(
                              width: 200,
                              child: Center(
                                child: Text(
                                  'Send to all SHO',
                                  textAlign: TextAlign.center,
                                  textScaleFactor: 2,
                                ),
                              ),
                              height: 50,
                              // color: Colors.blue,
                              decoration: BoxDecoration(
                                  color: Colors.deepPurpleAccent,
                                  border: Border.all(
                                    color: Colors.deepPurpleAccent,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                            ),
                          ),
                          SizedBox(height: 10),
                          InkWell(
                            onTap: () {
                              select_all = true;
                              setState(() {
                                _value1 = true;
                                _value2 = true;
                                _value3 = true;
                                _value4 = true;
                                _value5 = true;
                                _value6 = true;
                                _value7 = true;
                              });
                            },
                            child: Container(
                              width: 200,
                              child: Center(
                                child: Text(
                                  'Send to all Staff',
                                  textAlign: TextAlign.center,
                                  textScaleFactor: 2,
                                ),
                              ),
                              height: 50,
                              // color: Colors.blue,
                              decoration: BoxDecoration(
                                  color: Colors.deepPurpleAccent,
                                  border: Border.all(
                                    color: Colors.deepPurpleAccent,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          select_all = true;
                          setState(() {
                            _value1 = true;
                            _value2 = true;
                            _value3 = true;
                            _value4 = true;
                            _value5 = true;
                            _value6 = true;
                            _value7 = true;
                          });
                        },
                        child: Container(
                          width: 150, height: 100,
                          child: Center(
                            child: Text(
                              'Send to all ',
                              textAlign: TextAlign.center,
                              textScaleFactor: 2,
                            ),
                          ),
                          // height: 50,
                          // color: Colors.blue,
                          decoration: BoxDecoration(
                              color: Colors.deepPurpleAccent,
                              border: Border.all(
                                color: Colors.deepPurpleAccent,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                        ),
                      ),
                    ],
                  )
                : InkWell(
                    onTap: () {
                      select_all = true;
                      setState(() {
                        _value1 = true;
                        _value2 = true;
                        _value3 = true;
                        _value4 = true;
                        _value5 = true;
                        _value6 = true;
                        _value7 = true;
                      });
                    },
                    child: Container(
                      width: 300,
                      child: Center(
                        child: Text(
                          'Send to all Staff',
                          textAlign: TextAlign.center,
                          textScaleFactor: 2,
                        ),
                      ),
                      height: 50,
                      // color: Colors.blue,
                      decoration: BoxDecoration(
                          color: Colors.deepPurpleAccent,
                          border: Border.all(color: Colors.deepPurpleAccent),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                  ),
            SizedBox(height: 10),
            SizedBox(
              height: 1,
            ),
            Divider(
              color: Colors.black,
              endIndent: 10,
              indent: 10,
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(
                        backgroundColor: Colors.deepPurpleAccent,
                        radius: 20,
                        backgroundImage:
                            AssetImage("assets/profileavatar.png")),
                    title: Text(arguments['name']),
                    subtitle: Text("User -ID"),
                    trailing: InkWell(
                      onTap: () {
                        setState(() {
                          _value1 = !_value1;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle, color: Colors.blue),
                        child: Padding(
                          padding: const EdgeInsets.all(0.1),
                          child: _value1
                              ? Icon(
                                  Icons.check,
                                  size: 20.0,
                                  color: Colors.white,
                                )
                              : Icon(
                                  Icons.check_box_outline_blank,
                                  size: 20.0,
                                  color: Colors.blue,
                                ),
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.black,
                    endIndent: 10,
                    indent: 10,
                  ),
                  ListTile(
                    leading: CircleAvatar(
                        backgroundColor: Colors.deepPurpleAccent,
                        radius: 20,
                        backgroundImage:
                            AssetImage("assets/profileavatar.png")),
                    title: Text(arguments['name']),
                    subtitle: Text("User -ID"),
                    trailing: InkWell(
                      onTap: () {
                        setState(() {
                          _value2 = !_value2;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle, color: Colors.blue),
                        child: Padding(
                          padding: const EdgeInsets.all(0.1),
                          child: _value2
                              ? Icon(
                                  Icons.check,
                                  size: 20.0,
                                  color: Colors.white,
                                )
                              : Icon(
                                  Icons.check_box_outline_blank,
                                  size: 20.0,
                                  color: Colors.blue,
                                ),
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.black,
                    endIndent: 10,
                    indent: 10,
                  ),
                  ListTile(
                    leading: CircleAvatar(
                        backgroundColor: Colors.deepPurpleAccent,
                        radius: 20,
                        backgroundImage:
                            AssetImage("assets/profileavatar.png")),
                    title: Text(arguments['name']),
                    subtitle: Text("User -ID"),
                    trailing: InkWell(
                      onTap: () {
                        setState(() {
                          _value3 = !_value3;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle, color: Colors.blue),
                        child: Padding(
                          padding: const EdgeInsets.all(0.1),
                          child: _value3
                              ? Icon(
                                  Icons.check,
                                  size: 20.0,
                                  color: Colors.white,
                                )
                              : Icon(
                                  Icons.check_box_outline_blank,
                                  size: 20.0,
                                  color: Colors.blue,
                                ),
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.black,
                    endIndent: 10,
                    indent: 10,
                  ),
                  ListTile(
                    leading: CircleAvatar(
                        backgroundColor: Colors.deepPurpleAccent,
                        radius: 20,
                        backgroundImage:
                            AssetImage("assets/profileavatar.png")),
                    title: Text(arguments['name']),
                    subtitle: Text("User -ID"),
                    trailing: InkWell(
                      onTap: () {
                        setState(() {
                          _value4 = !_value4;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle, color: Colors.blue),
                        child: Padding(
                          padding: const EdgeInsets.all(0.1),
                          child: _value4
                              ? Icon(
                                  Icons.check,
                                  size: 20.0,
                                  color: Colors.white,
                                )
                              : Icon(
                                  Icons.check_box_outline_blank,
                                  size: 20.0,
                                  color: Colors.blue,
                                ),
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.black,
                    endIndent: 10,
                    indent: 10,
                  ),
                  ListTile(
                    leading: CircleAvatar(
                        backgroundColor: Colors.deepPurpleAccent,
                        radius: 20,
                        backgroundImage:
                            AssetImage("assets/profileavatar.png")),
                    title: Text(arguments['name']),
                    subtitle: Text("User -ID"),
                    trailing: InkWell(
                      onTap: () {
                        setState(() {
                          _value5 = !_value5;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle, color: Colors.blue),
                        child: Padding(
                          padding: const EdgeInsets.all(0.1),
                          child: _value5
                              ? Icon(
                                  Icons.check,
                                  size: 20.0,
                                  color: Colors.white,
                                )
                              : Icon(
                                  Icons.check_box_outline_blank,
                                  size: 20.0,
                                  color: Colors.blue,
                                ),
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.black,
                    endIndent: 10,
                    indent: 10,
                  ),
                  ListTile(
                    leading: CircleAvatar(
                        backgroundColor: Colors.deepPurpleAccent,
                        radius: 20,
                        backgroundImage: AssetImage("assets/groupavatar.png")),
                    title: Text('Team 1'),
                    subtitle: Text("User -ID"),
                    trailing: InkWell(
                      onTap: () {
                        setState(() {
                          _value6 = !_value6;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle, color: Colors.blue),
                        child: Padding(
                          padding: const EdgeInsets.all(0.1),
                          child: _value6
                              ? Icon(
                                  Icons.check,
                                  size: 20.0,
                                  color: Colors.white,
                                )
                              : Icon(
                                  Icons.check_box_outline_blank,
                                  size: 20.0,
                                  color: Colors.blue,
                                ),
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.black,
                    endIndent: 10,
                    indent: 10,
                  ),
                  ListTile(
                    leading: CircleAvatar(
                        backgroundColor: Colors.deepPurpleAccent,
                        radius: 20,
                        backgroundImage: AssetImage("assets/groupavatar.png")),
                    title: Text('Team 2'),
                    subtitle: Text("User -ID"),
                    trailing: InkWell(
                      onTap: () {
                        setState(() {
                          _value7 = !_value7;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle, color: Colors.blue),
                        child: Padding(
                          padding: const EdgeInsets.all(0.1),
                          child: _value7
                              ? Icon(
                                  Icons.check,
                                  size: 20.0,
                                  color: Colors.white,
                                )
                              : Icon(
                                  Icons.check_box_outline_blank,
                                  size: 20.0,
                                  color: Colors.blue,
                                ),
                        ),
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
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                // alignment: Alignment.bottomRight,
                decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.circular(10.0),
                  color: Colors.deepPurpleAccent,
                ),
                child: IconButton(
                  icon: Icon(Icons.send),
                  iconSize: 80,
                  onPressed: () {
                    Fluttertoast.showToast(
                        msg: "Message Broadcasted Successfully!!",
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.deepPurpleAccent,
                        webPosition: "right",
                        fontSize: 30);
                    Navigator.of(context).pop();
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (BuildContext context) => HomeScreen()));
                    // Navigator.of(context).pop();
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
