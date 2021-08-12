import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_cop/screens/VehicleScree.dart';

class UpdateVehicle extends StatefulWidget {
  UpdateVehicle({Key key}) : super(key: key);

  @override
  _UpdateVehicleState createState() => _UpdateVehicleState();
}

class _UpdateVehicleState extends State<UpdateVehicle> {
  File _image;
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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        automaticallyImplyLeading: true,
        // leadingWidth: 500,

        title: Row(
          children: [
            Flexible(
              child: CircleAvatar(
                backgroundImage: ExactAssetImage('assets/car.png'),
                backgroundColor: Colors.deepPurpleAccent,
                // Optional as per your use case
                // minRadius: 30,
                // maxRadius: 70,
              ),
            ),
            SizedBox(
              width: 30,
            ),
            Text("Vehicle Info"),
          ],
        ),
        // centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 32,
            ),
            Container(
              // height: 150,
              width: 350,
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
                  hintText: "Attach Proff",
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
            SizedBox(
              height: 10,
            ),
            new Container(
              height: 150,
              width: 350,
              decoration: new BoxDecoration(
                shape: BoxShape.rectangle,
                border: new Border.all(
                  color: Colors.black,
                  width: 1.0,
                ),
              ),
              child: new TextField(
                textAlign: TextAlign.start,
                decoration: new InputDecoration(
                  hintText: 'Description',
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 100),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: ButtonTheme(
                minWidth: 350.0,
                height: 50.0,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  onPressed: () {
                    Fluttertoast.showToast(
                        msg: 'Updated Successfully!!',
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.white,
                        textColor: Colors.blue,
                        fontSize: 16.0);
                    Navigator.of(context).pop();
                    // Navigator.of(context).pop();

                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (BuildContext context) => VehicleScreen()));
                    // Navigator.of(context).pop();
                  },
                  padding: EdgeInsets.all(12),
                  color: Colors.deepPurpleAccent,
                  child: Text('Done', style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
