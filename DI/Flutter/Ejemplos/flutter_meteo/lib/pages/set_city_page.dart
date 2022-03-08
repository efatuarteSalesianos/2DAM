import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_meteo/models/geocoding_response.dart';
import 'package:flutter_meteo/utils/constants.dart';
import 'package:flutter_meteo/utils/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const SetCityPage());
}

class SetCityPage extends StatefulWidget {
  const SetCityPage({Key? key}) : super(key: key);

  @override
  _SetCityPageState createState() => _SetCityPageState();
}

class _SetCityPageState extends State<SetCityPage> {
  var maptype = MapType.normal;
  List<Marker> allMarkers = [];

  late GoogleMapController _controller;
  late String city = '';
  late double lat = 37.3826;
  late double lon = -5.99629;
  late Future<GeocodingResponse> geocoding;
  final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController cityController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  Future<GeocodingResponse> fetchGeocoding() async {
    const String opW = "2beafe38506bb5f857cd7f10e4e6f4eb";
    final response = await http.get(Uri.parse(
        'http://api.openweathermap.org/geo/1.0/direct?q=$city&limit=1&appid=$opW'));
    if (response.statusCode == 200) {
      List<dynamic> jsonObject = jsonDecode(response.body);
      GeocodingResponse resp = GeocodingResponse.fromJson(jsonObject[0]);
      setState(() {
        lat = resp.lat;
        lon = resp.lon;
        PreferenceUtils.setDouble(LAT, lat);
        PreferenceUtils.setDouble(LON, lon);
      });
      return resp;
    } else {
      throw Exception('No existe la ciudad que está buscando');
    }
  }

  Future<void> _saveForm() async {
    final bool isValid = _formKey.currentState!.validate();
    if (isValid) {
      setState(() {
        city = cityController.text;
        PreferenceUtils.setString(CITY, city).then((value) => fetchGeocoding()
            .then(
              (value) => moveToPosition(),
            )
            .then((value) => allMarkers.add(Marker(
                markerId: const MarkerId('myMarker'),
                draggable: true,
                onTap: () {
                  print('Ubicación Actualizada');
                },
                position: LatLng(PreferenceUtils.getDouble(LAT) ?? 37.3826,
                    PreferenceUtils.getDouble(LON) ?? -5.99629)))));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/city_background.jpg"),
          fit: BoxFit.cover,
        )),
        child: ListView(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 40, horizontal: 40),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: cityController,
                            validator: (value) {
                              if (value == null) {
                                return 'Debe introducir una ciudad';
                              }

                              return null;
                            },
                            decoration: const InputDecoration(
                                labelText: 'Introduzca una ciudad',
                                border: OutlineInputBorder(),
                                errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.red, width: 5))),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          ElevatedButton.icon(
                              onPressed: () => [
                                    _saveForm(),
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      content: Text(
                                          'Se ha actualizado la ubicación'),
                                    )),
                                  ],
                              icon: const Icon(Icons.save),
                              label: const Text('Guardar')),
                        ],
                      ),
                    ),
                  ),
                  Stack(children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: GoogleMap(
                        mapType: maptype,
                        initialCameraPosition: CameraPosition(
                            target: LatLng(
                                PreferenceUtils.getDouble(LAT) ?? 37.3826,
                                PreferenceUtils.getDouble(LON) ?? -5.99629),
                            zoom: 15.0),
                        markers: Set.from(allMarkers),
                        onMapCreated: (controller) => _controller = controller,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: InkWell(
                        onTap: moveToPosition,
                        child: Container(
                          height: 40.0,
                          width: 40.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.blueAccent),
                          child: FloatingActionButton(
                              backgroundColor: Colors.blueAccent,
                              foregroundColor: Colors.white,
                              child: const Icon(Icons.place),
                              onPressed: () => {
                                    moveToPosition(),
                                    setState(() {
                                      maptype = MapType.normal;
                                    })
                                  }),
                        ),
                      ),
                    ),
                    Align(
                        alignment: Alignment.bottomRight,
                        child: InkWell(
                          onTap: currentLocation,
                          child: Container(
                            height: 40.0,
                            width: 40.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Colors.deepOrange),
                            child: FloatingActionButton(
                                backgroundColor: Colors.deepOrange,
                                foregroundColor: Colors.white,
                                child: const Icon(Icons.my_location),
                                onPressed: () => {
                                      currentLocation(),
                                      setState(() {
                                        maptype = MapType.hybrid;
                                      })
                                    }),
                          ),
                        ))
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void mapCreated(controller) {
    setState(() {
      _controller = controller;
    });
  }

  moveToPosition() {
    _controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
          target: LatLng(PreferenceUtils.getDouble(LAT) ?? 37.3835,
              PreferenceUtils.getDouble(LON) ?? -6.0052),
          zoom: 15.0,
          bearing: 45.0,
          tilt: 45.0),
    ));
  }

  currentLocation() {
    _controller.animateCamera(CameraUpdate.newCameraPosition(
      const CameraPosition(
          target: LatLng(37.3835, -6.0052),
          zoom: 17.0,
          bearing: 45.0,
          tilt: 45.0),
    ));
  }
}
