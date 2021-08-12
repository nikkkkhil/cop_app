import 'package:new_cop/services/authoservice.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var name, pasword, token;
  bool circleStatus = false;
  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        child: ClipOval(child: Image.asset("assets/profile.png")),
        backgroundColor: Colors.deepPurpleAccent,
        radius: 80.0,
        // backgroundImage: AssetImage("assets/profile.png"),
        // minRadius: 10,
        // maxRadius: 50,
      ),
    );
    final circleIndicator = Center(
        child: SizedBox(
            height: 50,
            width: 50,
            child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.deepPurpleAccent),
                strokeWidth: 5.0)));

    final email = Theme(
      data: new ThemeData(
        primaryColor: Colors.deepPurpleAccent,
        primaryColorDark: Colors.red,
      ),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        initialValue: 'john',
        cursorColor: Colors.deepPurpleAccent,
        decoration: InputDecoration(
          hintText: 'User ID',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          focusColor: Colors.deepPurpleAccent,
          hoverColor: Colors.deepPurpleAccent,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        ),
        onChanged: (val) {
          name = val;
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
        // initialValue: 123,
        obscureText: true,
        cursorColor: Colors.deepPurpleAccent,
        decoration: InputDecoration(
          hintText: 'Password',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          focusColor: Colors.deepPurpleAccent,
          hoverColor: Colors.deepPurpleAccent,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        ),
        onChanged: (val) {
          pasword = val;
        },
      ),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: ()
            // Navigator.of(context).pushNamed(HomePage.tag);
            {
          Navigator.pushReplacementNamed(
            context,
            '/homescreen',
            arguments: {'user_id': 'ganguly'},
          );
          // FocusScope.of(context).requestFocus(FocusNode());

          // setState(() {
          //   circleStatus = true;
          // });
          // try {
          //   AuthService().login(name, pasword).then((val) {
          //     // if (val == 'error') {
          //     //   Navigator.pop(context); // pop current page
          //     //   Navigator.pushNamed(context, "/"); // push it back in
          //     // } else {
          //     print('val.data $val');
          //     if (val == 'noserver') {
          //       print('im here1');
          //       Fluttertoast.showToast(
          //           msg: 'Error Server is not live!!',
          //           toastLength: Toast.LENGTH_LONG,
          //           gravity: ToastGravity.BOTTOM,
          //           backgroundColor: Colors.white,
          //           textColor: Colors.red,
          //           fontSize: 16.0);
          //       // Navigator.pop(context); // pop current page
          //       // Navigator.pushNamed(context, "Setting");
          //       Navigator.pushReplacement(
          //           context,
          //           MaterialPageRoute(
          //               builder: (BuildContext context) => super.widget));
          //     } else if (val == 'error') {
          //       print('im here3');
          //       // Fluttertoast.showToast(
          //       //     msg: 'Error',
          //       //     toastLength: Toast.LENGTH_SHORT,
          //       //     gravity: ToastGravity.BOTTOM,
          //       //     backgroundColor: Colors.blue,
          //       //     textColor: Colors.red,
          //       //     fontSize: 16.0);
          //       Navigator.pushReplacement(
          //           context,
          //           MaterialPageRoute(
          //               builder: (BuildContext context) => super.widget));
          //     } else if (val.data['success']) {
          //       print('im here2');
          //       token = val.data['token'];
          //       setState(() {
          //         circleStatus = true;
          //       });
          //       Fluttertoast.showToast(
          //           msg: 'Authenticated',
          //           toastLength: Toast.LENGTH_SHORT,
          //           gravity: ToastGravity.BOTTOM,
          //           backgroundColor: Colors.deepPurpleAccent,
          //           textColor: Colors.white,
          //           fontSize: 16.0);
          //       setState(() {
          //         circleStatus = false;
          //       });
          //       Navigator.pushReplacementNamed(
          //         context,
          //         '/homescreen',
          //         arguments: {'user_id': name},
          //       );
          //     } else {
          //       // Fluttertoast.showToast(
          //       //     msg: 'Error',
          //       //     toastLength: Toast.LENGTH_SHORT,
          //       //     gravity: ToastGravity.BOTTOM,
          //       //     backgroundColor: Colors.blue,
          //       //     textColor: Colors.red,
          //       //     fontSize: 16.0);
          //       Navigator.pushReplacement(
          //           context,
          //           MaterialPageRoute(
          //               builder: (BuildContext context) => super.widget));
          //     }
          //   }
          //       // }
          //       );
          // } catch (error) {
          //   setState(() {});
          // }
        },
        padding: EdgeInsets.all(12),
        color: Colors.deepPurpleAccent,
        child: Text('Log In', style: TextStyle(color: Colors.white)),
      ),
    );

    final forgotLabel = FlatButton(
      child: Text(
        'Forgot password?',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {},
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            SizedBox(height: 48.0),
            email,
            SizedBox(height: 8.0),
            password,
            SizedBox(height: 24.0),
            loginButton,
            // forgotLabel,
            if (circleStatus) circleIndicator
          ],
        ),
      ),
    );
  }
}
