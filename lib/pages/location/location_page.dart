import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:siparischi/decoration/colors.dart';
import 'package:siparischi/pages/user/address_page.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  static const LatLng _center = LatLng(36, 34);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: green,
          centerTitle: true,
          leading: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                RotatedBox(
                  quarterTurns: 2,
                  child: IconButton(
                      icon: const Icon(
                        Icons.exit_to_app,
                        color: Colors.white,
                      ),
                      onPressed: () => Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const AddressPage(),
                            ),
                            (route) => false,
                          )),
                )
              ]),
          title: const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Siparischi",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "poppins_bold",
                color: Colors.white,
              ),
            ),
          ),
        ),
        body: Center(
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              GoogleMap(
                mapType: MapType.normal,
                onMapCreated: _onMapCreated,
                onTap: (LatLng latLng) {
                  AddressPage.location = latLng.latitude.toString().substring(
                          0, latLng.latitude.toString().indexOf(".") + 5) +
                      " " +
                      latLng.longitude.toString().substring(
                          0, latLng.longitude.toString().indexOf(".") + 5);
                  setState(() {
                    _markers.add(Marker(
                        markerId: const MarkerId('Service Location'),
                        draggable: false,
                        onTap: () {},
                        position: latLng));
                  });
                },
                markers: _markers,
                initialCameraPosition: const CameraPosition(
                  target: _center,
                  zoom: 6,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: FloatingActionButton(
                  backgroundColor: green,
                  child: const Icon(Icons.save),
                  onPressed: () {
                    print("Location: " + AddressPage.location);
                    AddressPage.location != ""
                        ? Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const AddressPage(),
                            ),
                            (route) => false,
                          ) : ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: green,
                              content: Text(
                                'Konum seçiniz',
                                style: TextStyle(
                                    color: white, fontFamily: "poppins_light"),
                              ),
                            ),
                          );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  final Completer<GoogleMapController> _controller = Completer();
  _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  final Set<Marker> _markers = {};
  void setMarker(LatLng lng) {
    setState(() {
      _markers.add(Marker(
          markerId: MarkerId('11'),
          draggable: false,
          onTap: () {},
          position: lng));
    });
  }
}
