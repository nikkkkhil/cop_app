import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AccountSettings extends StatefulWidget {
  AccountSettings({Key key}) : super(key: key);

  @override
  _AccountSettingsState createState() => _AccountSettingsState();
}

class _AccountSettingsState extends State<AccountSettings> {
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

  @override
  Widget build(BuildContext context) {
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
          hintText: 'Enter a old Password',
          labelText: 'Enter a old Password',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        ),
        onChanged: (val) {
          pasword = val;
        },
      ),
    );
    final password1 = Theme(
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
          hintText: 'Enter a new Password',
          labelText: 'Enter a new Password',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        ),
        onChanged: (val) {
          pasword = val;
        },
      ),
    );

    final password2 = Theme(
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
          hintText: 'Confirm Password',
          labelText: 'Confirm Password',
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
                msg: 'Successfully password updated!',
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
              : Text('Update', style: TextStyle(color: Colors.white)),
        )
        //  Center(child: CircularProgressIndicator()),
        );

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("Profile Update"),
          backgroundColor: Colors.deepPurpleAccent,
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 10),
              Text("Change Password",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              SizedBox(height: 48.0),
              password,
              SizedBox(height: 24.0),
              password1,
              SizedBox(height: 24.0),
              password2,
              SizedBox(height: 24.0),
              addButton,
              SizedBox(height: 40.0),
              Text("Login History",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              SizedBox(height: 10.0),
              Container(
                width: 380,
                height: 50,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Center(
                  child: Text(
                    "3 times wrong password entered from jaipur",
                    textScaleFactor: 1.3,
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                width: 380,
                height: 50,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Center(
                  child: Text(
                    "last login at 2PM from BKN",
                    textScaleFactor: 1.3,
                  ),
                ),
              ),
              Text("Login Sessions",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              SizedBox(height: 10.0),
              Container(
                width: 380,
                height: 100,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Center(
                  child: Text(
                    " Active \n From BKN \n Login @ 6PM \n Samsung A41",
                    textScaleFactor: 1.3,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
