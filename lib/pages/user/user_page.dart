import 'package:flutter/material.dart';
import 'package:siparischi/decoration/colors.dart';
import 'package:siparischi/pages/login_page.dart';
import 'package:siparischi/pages/user/address_page.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  static String token = "", id = "";

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
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
                  },
                ),
              )
            ]),
        backgroundColor: green,
        centerTitle: true,
        title: Text(
          "Siparischi",
          style: TextStyle(color: white, fontFamily: "poppins-bold"),
        ),
        actions: [
          PopupMenuButton<int>(
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
        ],
      ),
      body: Center(
        child: Text(
          "fsdfsd",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32,
              fontFamily: "poppins_bold"),
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
}
