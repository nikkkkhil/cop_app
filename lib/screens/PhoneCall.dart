import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // call with dial pad
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class PhoneCall extends StatefulWidget {
  PhoneCall({Key key}) : super(key: key);

  @override
  _PhoneCallState createState() => _PhoneCallState();
}

class _PhoneCallState extends State<PhoneCall> {
  Future<void> _makePhoneCall(String contact, bool direct) async {
    if (direct == true) {
      bool res = await FlutterPhoneDirectCaller.callNumber(contact);
    } else {
      String telScheme = 'tel:$contact';

      if (await canLaunch(telScheme)) {
        await launch(telScheme);
      } else {
        throw 'Could not launch $telScheme';
      }
    }
  }

  Widget callfunc() {
    Text("hello");
    // _makePhoneCall('0123456789', true);
  }

  @override
  Widget build(BuildContext context) {
    return callfunc();
  }
}
