import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'myInput.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.grey[300], // Light primary color
        // scaffoldBackgroundColor: Colors.lightBlue[100]
        scaffoldBackgroundColor: Colors.blue[100], // Light background color
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            // primaryColor: Colors.grey[600], // Darker button color
            elevation: 8, // Increased elevation for a stronger shadow
          ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final start = TextEditingController();
  final end = TextEditingController();
  List<LatLng> routpoints = [LatLng(52.05884, -1.345583)];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Routing',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 15),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey[400]!,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: myInput(
                  controler: start,
                  hint: 'Enter Start location',
                  // borderColor: Colors.transparent,
                ),
              ),
              SizedBox(height: 15),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey[400]!,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: myInput(
                  controler: end,
                  hint: 'Enter End location',
                  // borderColor: Colors.transparent,
                ),
              ),
              SizedBox(height: 15),

              ElevatedButton(


                onPressed: () async {
                  List<Location> start_l = await locationFromAddress(start.text);
                  List<Location> end_l = await locationFromAddress(end.text);

                  var v1 = start_l[0].latitude;
                  var v2 = start_l[0].longitude;
                  var v3 = end_l[0].latitude;
                  var v4 = end_l[0].longitude;

                  var url = Uri.parse(
                      'http://router.project-osrm.org/route/v1/driving/$v2,$v1;$v4,$v3?steps=true&annotations=true&geometries=geojson&overview=full');
                  var response = await http.get(url);
                  print(response.body);
                  setState(() {
                    routpoints = [];
                    var ruter = jsonDecode(response.body)['routes'][0]['geometry']['coordinates'];
                    for (int i = 0; i < ruter.length; i++) {
                      var reep = ruter[i].toString();
                      reep = reep.replaceAll("[", "");
                      reep = reep.replaceAll("]", "");
                      var lat1 = reep.split(',');
                      var long1 = reep.split(",");
                      routpoints.add(LatLng(double.parse(lat1[1]), double.parse(long1[0])));
                    }
                  });
                },
                child: Text('Click'),
              ),
              SizedBox(height: 10),
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  child: FlutterMap(
                    options: MapOptions(
                      center: routpoints.isEmpty ? LatLng(0, 0) : routpoints[0],
                      zoom: 10,
                    ),
                    children: [
                      TileLayer(
                        urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                        userAgentPackageName: 'com.example.app',
                      ),
                      PolylineLayer(
                        polylineCulling: false,
                        polylines: [
                          Polyline(points: routpoints, color: Colors.blue, strokeWidth: 9),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
