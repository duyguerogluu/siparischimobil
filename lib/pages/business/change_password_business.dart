import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:siparischi/pages/business/business_page.dart';
import 'package:siparischi/pages/business/edit_profile_business.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:io';
import 'dart:async';
import 'package:siparischi/decoration/colors.dart';
import 'package:siparischi/pages/user/address_page.dart';

class ChangePasswordBusiness extends StatefulWidget {
  const ChangePasswordBusiness({Key? key}) : super(key: key);

  @override
  State<ChangePasswordBusiness> createState() => _ChangePasswordBusinessState();
}

class _ChangePasswordBusinessState extends State<ChangePasswordBusiness> {
  var passwordControllerOld = TextEditingController();
  var passwordController = TextEditingController();
  var passwordControllerOne = TextEditingController();
  late String inputValue;
  late String inputValueTwo;

  bool _obscureTextOld = true;
  void _toggleOld() {
    setState(() {
      _obscureTextOld = !_obscureTextOld;
    });
  }

  bool _obscureText = true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  bool _obscureTextOne = true;
  void _toggleOne() {
    setState(() {
      _obscureTextOne = !_obscureTextOne;
    });
  }

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
                                            BusinessPage(),
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
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 160,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 8.0, left: 18.0, right: 18.0),
                      child: TextFormField(
                        controller: passwordControllerOld,
                        obscureText: _obscureTextOld,
                        style: TextStyle(
                            color: black, fontFamily: "poppins_light"),
                        decoration: InputDecoration(
                          hintText: "Eski Şifre",
                          hintStyle: TextStyle(
                              color: grey, fontFamily: "poppins_light"),
                          labelStyle: TextStyle(
                              color: black, fontFamily: "poppins_light"),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: green, width: 2),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: green, width: 1),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          fillColor: green,
                          floatingLabelStyle: TextStyle(color: green),
                          focusColor: green,
                          suffixIcon: GestureDetector(
                            onTap: () {
                              _toggleOld();
                            },
                            child: _obscureTextOld
                                ? Icon(Icons.visibility_off, color: grey)
                                : Icon(
                                    Icons.visibility,
                                    color: green,
                                  ),
                          ),
                        ),
                        maxLength: 24,
                        maxLines: 1,
                        keyboardType: TextInputType.text,
                        cursorColor: Colors.black,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 8.0, left: 18.0, right: 18.0),
                      child: TextFormField(
                        controller: passwordController,
                        obscureText: _obscureText,
                        style: TextStyle(
                            color: black, fontFamily: "poppins_light"),
                        decoration: InputDecoration(
                          hintText: "Yeni Şifre",
                          hintStyle: TextStyle(
                              color: grey, fontFamily: "poppins_light"),
                          labelStyle: TextStyle(
                              color: black, fontFamily: "poppins_light"),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: green, width: 2),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: green, width: 1),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          fillColor: green,
                          floatingLabelStyle: TextStyle(color: green),
                          focusColor: green,
                          suffixIcon: GestureDetector(
                            onTap: () {
                              _toggle();
                            },
                            child: _obscureText
                                ? Icon(Icons.visibility_off, color: grey)
                                : Icon(
                                    Icons.visibility,
                                    color: green,
                                  ),
                          ),
                        ),
                        maxLength: 24,
                        maxLines: 1,
                        keyboardType: TextInputType.text,
                        cursorColor: Colors.black,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 8.0, left: 18.0, right: 18.0),
                      child: TextFormField(
                        controller: passwordControllerOne,
                        obscureText: _obscureTextOne,
                        style: TextStyle(
                            color: black, fontFamily: "poppins_light"),
                        decoration: InputDecoration(
                          hintText: "Şifre Onayla",
                          hintStyle: TextStyle(
                              color: grey, fontFamily: "poppins_light"),
                          labelStyle: TextStyle(
                              color: black, fontFamily: "poppins_light"),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: green, width: 2),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: green, width: 1),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          fillColor: green,
                          floatingLabelStyle: TextStyle(color: green),
                          focusColor: green,
                          suffixIcon: GestureDetector(
                            onTap: () {
                              _toggleOne();
                            },
                            child: _obscureTextOne
                                ? Icon(Icons.visibility_off, color: grey)
                                : Icon(
                                    Icons.visibility,
                                    color: green,
                                  ),
                          ),
                        ),
                        maxLength: 24,
                        maxLines: 1,
                        keyboardType: TextInputType.text,
                        cursorColor: Colors.black,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (passwordController.text ==
                              passwordControllerOne.text) {
                            setState(() {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: green,
                                  content: Text(
                                    'olduuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu',
                                    style: TextStyle(
                                        color: white,
                                        fontFamily: "poppins_light"),
                                  ),
                                ),
                              );
                            });
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: green,
                                content: Text(
                                  'Eksik alanlar var',
                                  style: TextStyle(
                                      color: white,
                                      fontFamily: "poppins_light"),
                                ),
                              ),
                            );
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: const Text(
                            "Şifreyi Onayla",
                            style: TextStyle(
                                fontFamily: "poppins_medium", fontSize: 16),
                          ),
                        ),
                        style: myButtonStyle(green),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 100,
              )
            ],
          ),
        ),
      ),
    );
  }
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

ButtonStyle myButtonStyle(Color back) {
  return ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(back),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
    ),
    overlayColor:
        MaterialStateProperty.all<Color>(Colors.white.withOpacity(0.5)),
    shadowColor: MaterialStateProperty.all<Color>(Colors.white),
  );
}

Divider horizontalDivider() {
  return Divider(
      height: 20,
      thickness: 1,
      endIndent: 8,
      indent: 8,
      color: Colors.grey.withOpacity(0.3));
}
