import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:geolocator/geolocator.dart';

// import 'package:flutter_map/flutter_map.dart';
// import 'package:user_location/user_location.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class MapView1 extends StatefulWidget {
  @override
  MapView1state createState() => MapView1state();
}

class MapView1state extends State<MapView1> {
  // Geolocator geolocator = Geolocator();

  // Position userLocation;
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
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      body: createMap(),
      floatingActionButton: buttonsFloat(),
    );
  }

  Column buttonsFloat() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        FloatingActionButton(
            child: Icon(Icons.location_city_sharp), onPressed: () {}
            // selectedStyle = _determinePosition() as String;
            // _getLocation().then(
            //   (value) {
            // setState(
            // () {
            // userLocation = value;
            // print(userLocation);
            // },
            // );
            // },
            // );
            // },
            ),
        SizedBox(
          height: 5,
        ),
        FloatingActionButton(
          child: Icon(Icons.sentiment_very_dissatisfied),
          onPressed: () {
            print('pressed sad');
            _onStyleLoaded();
            mapController.addSymbol(
              SymbolOptions(
                geometry: center,
                iconSize: 0.3,
                iconImage: 'assetImage',
                textField: 'Pinged place',
                textOffset: Offset(0, 3),
              ),
            );
          },
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
      onStyleLoadedCallback: () => addSymbol(mapController),
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
  Map loc2 = {
    13.027950958045832: 77.52018426811813,
    13.041552408172324: 77.52167403649689,
    13.035361923773968: 77.51620060564387,
    13.04034450429879: 77.51781467509782,
    13.042965259899931: 77.5208716927105,
    13.03126251645751: 77.51884759774066,
    13.036511694297998: 77.51960368924577,
    13.033659351622017: 77.52209796413186,
    13.033551433614559: 77.52221146506719,
    13.043047575121982: 77.51962051614913,
    13.036936253618812: 77.52299333417466,
    13.03973301767295: 77.5175145496105,
    13.041748330494741: 77.52202600298034,
    13.037792667015735: 77.51996315807614,
    13.028115255046128: 77.51780302189614,
    13.038336733851226: 77.52338811285209,
    13.04011848163699: 77.51717138287125,
    13.030696508018808: 77.51861095073787,
    13.037783267726915: 77.52224752782264
  };
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
    loc2.forEach((k, v) => mapBoxController.addSymbol(
          SymbolOptions(
            geometry: LatLng(k, v),
            iconImage: "assets/pin1.png",
            iconColor: "4282557941",
            iconSize: 0.3,
            textField: 'Pinged place',
          ),
        ));
    // }
  }

  // Future<Position> _getLocation() async {
  //   var currentLocation;
  //   try {
  //     currentLocation = await Geolocator.getCurrentPosition(
  //         desiredAccuracy: LocationAccuracy.best);
  //   } catch (e) {
  //     currentLocation = null;
  //   }
  //   return currentLocation;

}
