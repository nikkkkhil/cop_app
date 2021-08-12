import 'package:get/get.dart';
import 'package:new_cop/screens/HomeScreen.dart';
import 'package:new_cop/screens/LoginScreen.dart';
import 'package:new_cop/screens/notification.dart';
import 'package:new_cop/screens/AccidentReport.dart';
import 'package:new_cop/screens/ViewLocation.dart';
import 'package:flutter/material.dart';
import 'package:new_cop/screens/BroadCast.dart';
import 'package:new_cop/screens/ChatScreen.dart';
import 'package:new_cop/screens/PhoneCall.dart';
import 'package:new_cop/screens/MapView.dart';
import 'package:new_cop/screens/VehicleScree.dart';
import 'package:new_cop/screens/UpdateVehicle.dart';
import 'package:new_cop/screens/NearAdmin.dart';
import 'package:new_cop/screens/ExtraPowers.dart';
import 'package:new_cop/screens/ReportCard.dart';
import 'package:new_cop/screens/ProfileUpdate.dart';
import 'package:new_cop/screens/LogReport.dart';
import 'package:new_cop/screens/CommonSettings.dart';
import 'package:new_cop/screens/AccountSettings.dart';
import 'package:new_cop/screens/CheckPost.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Cop APP',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),

        // home: LoginScreen(),
        routes: {
          '/': (context) => LoginScreen(),
          '/homescreen': (context) => HomeScreen(),
          '/notification': (context) => NotificationPage(),
          '/accidentreport': (context) => AccidentReport(),
          '/broadcast': (context) => BroadCast(),
          '/chatscreen': (context) => ChatScreen(),
          '/phonecall': (context) => PhoneCall(),
          '/viewlocation': (context) => MapView(),
          '/mapview': (context) => MapView1(),
          '/vehiclescreen': (context) => VehicleScreen(),
          '/updatevehicle': (context) => UpdateVehicle(),
          '/nearadmin': (context) => NearAdmin(),
          '/extrapowers': (context) => ExtraPowers(),
          '/reportcard': (context) => ReportCard(),
          '/profileupdate': (context) => ProfileUpdate(),
          '/logreport': (context) => LogReport(),
          '/commonsettings': (context) => CommonSettings(),
          '/accountsettings': (context) => AccountSettings(),
          '/checkpost': (context) => CheckPost(),
        });
  }
}
