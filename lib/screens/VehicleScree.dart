import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class VehicleScreen extends StatefulWidget {
  VehicleScreen({Key key}) : super(key: key);

  @override
  _VehicleScreenState createState() => _VehicleScreenState();
}

class _VehicleScreenState extends State<VehicleScreen> {
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
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            width: 300,
            height: 100,
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Center(
              child: Text(
                """Description:This Vehicle has problem with gearbox and breaks, not working problem""",
                textScaleFactor: 1.3,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: 300,
            height: 220,
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Center(
              child: Text(
                """ Reg no: Ry07-SJ-0371 \n Vehicle type : Bike \n Model : 2018 \n Fuel type : Petrol \nCompany : Hero-Honda \nModel name : Hero-Honda Splender Pro""",
                textScaleFactor: 1.3,
              ),
            ),
          ),
          Divider(
            color: Colors.black,
            endIndent: 10,
            indent: 10,
          ),
          Text(
            "Assigned to ",
            // textAlign: TextAlign.left,
          ),
          Container(
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/chatscreen", arguments: {
                  'name': 'Staff1',
                  'profile': 'assets/profileavatar.png',
                  'status': 'online'
                });
              },
              child: ListTile(
                leading: CircleAvatar(
                    backgroundColor: Colors.deepPurpleAccent,
                    radius: 20,
                    backgroundImage: AssetImage('assets/profileavatar.png')),
                title: Text("Staff1"),
                subtitle: Text("UserID"),
                trailing: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween, // added line
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/viewlocation',
                            arguments: {
                              'locprofile': 'assets/car.png',
                              'name': 'car'
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
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: InkWell(
                        onTap: () async {
                          const number = '08592119XXXX'; //set the number here
                          bool res =
                              await FlutterPhoneDirectCaller.callNumber(number);
                        },
                        child: Icon(
                          Icons.call,
                          color: Colors.white,
                          size: 40,
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
            ),
          ),
          Divider(
            color: Colors.black,
            endIndent: 10,
            indent: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: ButtonTheme(
              minWidth: 300.0,
              height: 50.0,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/updatevehicle',
                  );
                },
                padding: EdgeInsets.all(12),
                color: Colors.deepPurpleAccent,
                child: Text('Update', style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
