import 'package:flutter/material.dart';
import 'package:siparischi/decoration/colors.dart';
import 'package:siparischi/pages/location/location_page.dart';
import 'package:siparischi/pages/user/user_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
class AddressPage extends StatefulWidget {
  const AddressPage({Key? key}) : super(key: key);
  static String location = "";

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {

  List data = [];
  @override
  void initState() {
    addressList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        leading: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              RotatedBox(
                quarterTurns: 2,
                child: IconButton(
                  icon: Icon(
                    Icons.exit_to_app,
                    color: white,
                  ),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => const UserPage(),
                      ),
                          (route) => false,
                    );
                  },
                ),
              )
            ]),
        backgroundColor: green,
        centerTitle: true,
        title: Text("Siparischi",
          style: TextStyle(
              color: white,
              fontFamily: "poppins-bold"
          ),
        ),
      ),
      body: data.isEmpty ? Center(
        child: CircularProgressIndicator(
          color: green,
        ),
      ) : addresses(),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: white,
        ),
        backgroundColor: green,
        onPressed: (){
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const LocationPage(),
            ),
                (route) => false,
          );
        },
      ),
    );
  }

  Widget addresses() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
              left: 12,
              top: 12
          ),
          child: Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "Adreslerim",
              style: TextStyle(
                  color: black,
                  fontFamily: "poppins_medium",
                  fontSize: 16
              ),

            ),
          ),
        ),
        Flexible(
          child: ListView.builder(
            itemCount: data.isEmpty ? 0 : data.length,
            itemBuilder: (BuildContext context, int index){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8)
                          ),
                          color: green,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                data[index]["address_name"],
                                style: TextStyle(
                                    fontFamily: "poppins_medium",
                                    color: white
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Icon(
                                Icons.edit,
                                color: white,
                                size: 20,
                              )
                            ],
                          ),
                        ),
                      ),

                      Container(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(data[index]["address_content"],
                            style: TextStyle(
                                fontFamily: "poppins_medium",
                                color: black
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),

                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }

  Future<void> addressList() async{
    var response = await http.get(
      Uri.parse("https://crealsoft.com/api/useraddress/get/" + UserPage.id + "?apiKey=" + UserPage.token),
    );
    if (response.statusCode == 200) {
      setState(() {
        data = convert.jsonDecode(response.body);
      });
      print("Response-> " + data[0]["address_name"].toString());
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
