import 'package:flutter/material.dart';
import 'package:siparischi/decoration/colors.dart';
import 'package:siparischi/pages/login_page.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) => AlertDialog(
                        backgroundColor: white,
                        title: Text(
                          "Siparischi",
                          style: TextStyle(
                            fontFamily: "poppins-light",
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
                                        builder: (BuildContext context) => const LoginPage(),
                                      ),
                                          (route) => false,
                                    );
                                  },
                                  style: ButtonStyle(
                                    backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        red),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      const RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
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
                                    MaterialStateProperty.all<Color>(
                                        black),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      const RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
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
      body: Center(
        child: Text(
          "Admin",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32,
              fontFamily: "poppins"
          ),
        ),
      ),
    );
  }
}
