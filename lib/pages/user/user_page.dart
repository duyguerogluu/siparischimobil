import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:siparischi/decoration/colors.dart';
import 'package:siparischi/pages/location/location_page.dart';
import 'package:siparischi/pages/login_page.dart';
import 'package:siparischi/pages/user/address_page.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:siparischi/pages/user/home_page_router.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  static String token = "", id = "";
  static String location = "";
  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  static const LatLng _center = LatLng(36.888, 34.666);
  bool refresh = true;
  String pointValue = "0";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        leading: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              RotatedBox(
                quarterTurns: 2,
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_forward,
                    color: green,
                  ),
                  onPressed: () {
                    /* showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) => AlertDialog(
                        backgroundColor: white,
                        title: Text(
                          "Siparischi",
                          style: TextStyle(
                            fontFamily: "poppins_light",
                            color: green,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        actions: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            const LoginPage(),
                                      ),
                                      (route) => false,
                                    );
                                  },
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(red),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8)),
                                      ),
                                    ),
                                  ),
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 64,
                                    height: 16,
                                    child: Text(
                                      "Evet",
                                      style: TextStyle(
                                        color: white,
                                        fontFamily: "poppins-light",
                                      ),
                                    ),
                                  )),
                              ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      Navigator.pop(context);
                                    });
                                  },
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(black),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8)),
                                      ),
                                    ),
                                  ),
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 64,
                                    height: 16,
                                    child: Text(
                                      "Hayır",
                                      style: TextStyle(
                                        color: white,
                                        fontFamily: "poppins",
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                        ],
                        content: Text(
                          "Çıkış yapmak istediğinize emin misiniz?",
                          style: TextStyle(
                            color: black,
                            fontFamily: "poppins",
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                 */

                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const HomePageRouter(),
                      ),
                      (route) => false,
                    );
                  },
                ),
              )
            ]),
        backgroundColor: white,
        title: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => AddressPage(),
              ),
            );
          },
          child: Row(
            children: [
              Flexible(
                flex: 3,
                child: Text(
                  "Adres Başlık",
                  style: TextStyle(
                      color: grey, fontFamily: "poppins-bold", fontSize: 16),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ),
              Flexible(
                flex: 1,
                child: SizedBox(
                  width: 8,
                ),
              ),
              Flexible(
                flex: 5,
                child: Text(
                  "adres ayrıntısı.. ",
                  style: TextStyle(
                      color: grey.withOpacity(0.5),
                      fontFamily: "poppins",
                      fontSize: 16),
                ),
              ),
            ],
          ),
        ),
        actions: [
          AspectRatio(
            aspectRatio: 3 / 2,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
                color: green.withOpacity(0.6),
              ),
              child: PopupMenuButton<int>(
                color: green,
                onSelected: (item) => onSelected(context, item),
                itemBuilder: (context) => [
                  PopupMenuItem<int>(
                    value: 0,
                    child: Row(
                      children: [
                        Icon(
                          Icons.person,
                          color: white,
                          size: 18,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Kulanıcı bilgilerim",
                          style: TextStyle(
                            fontFamily: "poppins_light",
                            fontSize: 14,
                            color: white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  PopupMenuItem<int>(
                    value: 0,
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_city,
                          color: white,
                          size: 18,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Adreslerim",
                          style: TextStyle(
                            fontFamily: "poppins_light",
                            fontSize: 14,
                            color: white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  PopupMenuItem<int>(
                    value: 0,
                    child: Row(
                      children: [
                        Icon(
                          Icons.lock,
                          color: white,
                          size: 18,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Şifre değiştir",
                          style: TextStyle(
                            fontFamily: "poppins_light",
                            fontSize: 14,
                            color: white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _refresh,
        color: white,
        backgroundColor: green,
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 14 / 12,
                  child: GoogleMap(
                    mapType: MapType.normal,
                    onMapCreated: _onMapCreated,
                    onTap: (LatLng latLng) {
                      UserPage.location = latLng.latitude.toString().substring(
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
                    initialCameraPosition: CameraPosition(
                      target: _center,
                      zoom: 12,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        color: white,
                      ),
                      child: _Search()),
                ),
                // ignore: prefer_const_constructors

                Center(
                  child: Text(
                    "Siparischi",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                        fontFamily: "poppins"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onSelected(BuildContext context, item) {
    switch (item) {
      case 0:
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => const AddressPage(),
          ),
          (route) => false,
        );
        break;
      case 1:
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => const AddressPage(),
          ),
          (route) => false,
        );
        break;
      case 2:
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => const AddressPage(),
          ),
          (route) => false,
        );
        break;
    }
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

  Future<void> _refresh() {
    setState(() {
      refresh = true;
    });
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => const UserPage(),
      ),
      (route) => false,
    );
    return Future.delayed(const Duration(seconds: 1), () {});
  }
}

class _Search extends StatefulWidget {
  _Search({Key? key}) : super(key: key);

  @override
  __SearchState createState() => __SearchState();
}

class __SearchState extends State<_Search> {
  late TextEditingController _editingController;

  @override
  void initState() {
    super.initState();
    _editingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: TextField(
              controller: _editingController,
              // textAlignVertical: TextAlignVertical.center,
              onChanged: (_) => setState(() {}),
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyle(color: green.withOpacity(0.6)),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
          _editingController.text.trim().isEmpty
              ? IconButton(
                  icon: Icon(Icons.search, color: green.withOpacity(0.6)),
                  onPressed: null)
              : IconButton(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  icon: Icon(Icons.clear,
                      color: Theme.of(context).primaryColor.withOpacity(0.5)),
                  onPressed: () => setState(
                    () {
                      _editingController.clear();
                    },
                  ),
                ),
        ],
      ),
    );
  }
}

class MyImageView extends StatelessWidget {
  String imgPath;

  MyImageView(this.imgPath);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        child: FittedBox(
          fit: BoxFit.fill,
          child: Container(
            width: MediaQuery.of(context).size.width / 2.5,
            height: MediaQuery.of(context).size.width / 2.5,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imgPath),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ));
  }
}
