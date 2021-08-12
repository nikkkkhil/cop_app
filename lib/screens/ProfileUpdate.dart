import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class ProfileUpdate extends StatefulWidget {
  ProfileUpdate({Key key}) : super(key: key);

  @override
  _ProfileUpdateState createState() => _ProfileUpdateState();
}

class _ProfileUpdateState extends State<ProfileUpdate> {
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
      _image = image;
    });
  }

  final _formKey = GlobalKey<FormState>();
  var new_name,
      phno,
      uid,
      pasword,
      token,
      email1,
      description1,
      other1,
      address1;
  bool circleIndicator = false;
  File _image;

  @override
  Widget build(BuildContext context) {
    final name = Theme(
      data: new ThemeData(
        primaryColor: Colors.deepPurpleAccent,
        primaryColorDark: Colors.red,
      ),
      child: TextFormField(
        validator: (value) {
          if (value.isEmpty) {
            return "name can't be empty!";
          }
          if (value.length < 3) {
            return "name must be more than 3";
          }
        },

        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        // initialValue: 'john',
        decoration: InputDecoration(
          labelText: "Enter a name",
          hintText: 'Enter a name',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        ),
        onChanged: (val) {
          new_name = val;
        },
      ),
    );
    final email = Theme(
      data: new ThemeData(
        primaryColor: Colors.deepPurpleAccent,
        primaryColorDark: Colors.red,
      ),
      child: TextFormField(
        validator: (value) {
          if (value.isEmpty) {
            return "name can't be empty!";
          }
          if (value.length < 3) {
            return "name must be more than 3";
          }
        },

        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        // initialValue: 'john',
        decoration: InputDecoration(
          labelText: "Enter a email",
          hintText: 'Enter a email',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        ),
        onChanged: (val) {
          email1 = val;
        },
      ),
    );
    final phoneno = Theme(
      data: new ThemeData(
        primaryColor: Colors.deepPurpleAccent,
        primaryColorDark: Colors.red,
      ),
      child: TextFormField(
        validator: (value) {
          if (value.length != 10) {
            return 'Mobile Number must be of 10 digit';
          } else {
            return null;
          }
        },
        keyboardType: TextInputType.phone,
        autofocus: false,
        // initialValue: 'john',
        decoration: InputDecoration(
          hintText: 'Enter a Phone No',
          labelText: 'Enter a Phone NO',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        ),
        onChanged: (val) {
          phno = val;
        },
      ),
    );
    final description = Theme(
      data: new ThemeData(
        primaryColor: Colors.deepPurpleAccent,
        primaryColorDark: Colors.red,
      ),
      child: TextFormField(
        validator: (value) {
          if (value.length == null) {
            return 'User id must be of to 5 values';
          }
          // else if (check_user(value) == 'notpresent') {
          //   return "User  exist's";
          // }
          else {
            return null;
          }
        },
        keyboardType: TextInputType.streetAddress,
        autofocus: false,
        // initialValue: 'john',
        decoration: InputDecoration(
          hintText: 'Enter a Description',
          labelText: 'Enter a Description',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        ),
        onChanged: (val) {
          description1 = val;
        },
      ),
    );
    final other = Theme(
      data: new ThemeData(
        primaryColor: Colors.deepPurpleAccent,
        primaryColorDark: Colors.red,
      ),
      child: TextFormField(
        validator: (value) {
          if (value.length == null) {
            return 'User id must be of to 5 values';
          }
          // else if (check_user(value) == 'notpresent') {
          //   return "User  exist's";
          // }
          else {
            return null;
          }
        },
        keyboardType: TextInputType.streetAddress,
        autofocus: false,
        // initialValue: 'john',
        decoration: InputDecoration(
          hintText: 'Other',
          labelText: 'Enter a other',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        ),
        onChanged: (val) {
          other1 = val;
        },
      ),
    );
    final address = Theme(
      data: new ThemeData(
        primaryColor: Colors.deepPurpleAccent,
        primaryColorDark: Colors.red,
      ),
      child: TextFormField(
        validator: (value) {
          if (value.length == null) {
            return 'User id must be of to 5 values';
          }
          // else if (check_user(value) == 'notpresent') {
          //   return "User  exist's";
          // }
          else {
            return null;
          }
        },
        keyboardType: TextInputType.streetAddress,
        autofocus: false,
        // initialValue: 'john',
        decoration: InputDecoration(
          hintText: 'Enter a Address',
          labelText: 'Enter a Address',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        ),
        onChanged: (val) {
          other1 = val;
        },
      ),
    );

    final password = Theme(
      data: new ThemeData(
        primaryColor: Colors.deepPurpleAccent,
        primaryColorDark: Colors.red,
      ),
      child: TextFormField(
        autofocus: false,
        validator: (value) {
          if (value.contains(new RegExp(r'[A-Z]')) &&
              value.contains(new RegExp(r'[0-9]')) &&
              value.contains(new RegExp(r'[a-z]'))) {
            return null;
          } else {
            return "password has to be hasDigits \nhasUppercase \n hasLowercase \nhasSpecialCharacters \nhasMinLength";
          }
        },
        // initialValue: 123,
        obscureText: true,
        decoration: InputDecoration(
          hintText: 'Enter a Password',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        ),
        onChanged: (val) {
          pasword = val;
        },
      ),
    );

    final addButton = Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          onPressed: ()
              // Navigator.of(context).pushNamed(HomePage.tag);

              {
            Fluttertoast.showToast(
                msg: 'Successfully Requested for update!',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                backgroundColor: Colors.deepPurpleAccent,
                textColor: Colors.white,
                fontSize: 16.0);
            Navigator.of(context).pop();
          },
          padding: EdgeInsets.all(12),
          color: Colors.deepPurpleAccent,
          child: circleIndicator
              ? CircularProgressIndicator()
              : Text('Request',
                  style: TextStyle(
                    color: Colors.white,
                  )),
        )
        //  Center(child: CircularProgressIndicator()),
        );

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.deepPurpleAccent,
          title: Text("Profile Update"),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    _showPicker(context);
                  },
                  child: CircleAvatar(
                    radius: 55,
                    backgroundColor: Colors.deepPurpleAccent,
                    child: _image != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.file(
                              _image,
                              // width: 100,
                              // height: 100,
                              fit: BoxFit.fitHeight,
                            ),
                          )
                        : Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(50)),
                            width: 100,
                            height: 100,
                            child: Icon(
                              Icons.camera_alt,
                              color: Colors.grey[800],
                            ),
                          ),
                  ),
                ),
                SizedBox(height: 10),
                Text("Profile Photo",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                SizedBox(height: 48.0),
                name,
                SizedBox(height: 8.0),
                phoneno,
                SizedBox(height: 8.0),
                description,
                SizedBox(height: 8.0),
                other,
                SizedBox(height: 8.0),
                address,
                SizedBox(height: 8.0),
                password,
                SizedBox(height: 24.0),
                addButton,
              ],
            ),
          ),
        ));
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
}
