import 'dart:typed_data';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:geolocator/geolocator.dart';

// import 'package:flutter_map/flutter_map.dart';
// import 'package:user_location/user_location.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class MapView extends StatefulWidget {
  @override
  MapViewstate createState() => MapViewstate();
}

class MapViewstate extends State<MapView> {
  // Geolocator geolocator = Geolocator();

  Position currentLocation;
  var map_icon;
  var map_name;

  // Position userLocation;
  LatLng _center;
  var lat, long;
  final center = LatLng(13.034922356585376, 77.52705922370333);
  final streetStyle = "mapbox://styles/nikhil14/cklj77py206ed17o8tqwfzih1";
  final navigationStyle = "mapbox://styles/nikhil14/ckljnixcf0nmc17k8czbg27ik";
  String selectedStyle = "mapbox://styles/nikhil14/cklj77py206ed17o8tqwfzih1";
  MapboxMapController mapController;
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

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    map_icon = arguments['locprofile'];
    map_name = arguments['name'];
    print('map_icon $map_icon');
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      body: lat == null
          ? Container(
              color: Colors.transparent,
              child: Center(
                child: CircularProgressIndicator(
                  valueColor:
                      AlwaysStoppedAnimation<Color>(Colors.deepPurpleAccent),
                ),
              ),
            )
          : createMap(),
      floatingActionButton: buttonsFloat(),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserLocation();
  }

  Column buttonsFloat() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        SizedBox(
          height: 5,
        ),
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

  MapboxMap createMap() {
    return MapboxMap(
      styleString: selectedStyle,
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(target: center, zoom: 14),
      onStyleLoadedCallback: () => addSymbol1(mapController),
    );
  }

// , 13.034922356585376, 77.52705922370333
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
  Future<Position> locateUser() async {
    return Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  getUserLocation() async {
    currentLocation = await locateUser();
    await Future.delayed(Duration(seconds: 3));

    setState(() {
      _center = LatLng(currentLocation.latitude, currentLocation.longitude);
      lat = currentLocation.latitude;
      long = currentLocation.longitude;
    });
    print('center $_center');
  }

  Future<void> addSymbol1(MapboxMapController mapBoxController) async {
    // for (dynamic l in loc.entries) {
    // print(l);

    await mapBoxController.addSymbol(
      SymbolOptions(
        geometry: LatLng(lat, long),
        iconImage: map_icon,
        iconSize: 0.3,
        textField: map_name,
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
            textField: 'Pinged place',
          ),
        ));
    loc1.forEach((k, v) => mapBoxController.addSymbol(
          SymbolOptions(
            geometry: LatLng(k, v),
            iconImage: "assets/pin.png",
            iconSize: 0.3,
            textField: 'Pinged place',
          ),
        ));
    // }
  }
}
