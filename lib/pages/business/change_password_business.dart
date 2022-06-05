import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:siparischi/pages/business/edit_profile_business.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:io';
import 'dart:async';
import 'package:siparischi/decoration/colors.dart';

class ChangePasswordBusiness extends StatefulWidget {
  const ChangePasswordBusiness({Key? key}) : super(key: key);

  @override
  State<ChangePasswordBusiness> createState() => _ChangePasswordBusinessState();
}

class _ChangePasswordBusinessState extends State<ChangePasswordBusiness> {
  var emailController = TextEditingController();
  var emailControllerOne = TextEditingController();
  late String inputValue;
  late String inputValueTwo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        controller: emailController,
                        style: const TextStyle(
                            color: Colors.black, fontFamily: "poppins_light"),
                        decoration: InputDecoration(
                          hintText: "Yeni Şifre",
                          hintStyle: TextStyle(
                              color: grey, fontFamily: "poppins_light"),
                          labelStyle: TextStyle(
                              color: black, fontFamily: "poppins_light"),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: green, width: 2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: green, width: 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          fillColor: green,
                          floatingLabelStyle: TextStyle(color: green),
                          focusColor: green,
                        ),
                        maxLength: 24,
                        maxLines: 1,
                        keyboardType: TextInputType.text,
                        cursorColor: black,
                        enableSuggestions: false,
                        autocorrect: false,
                        validator: (inputValue) {
                          if (inputValue == null || inputValue.trim().isEmpty) {
                            return 'Lütfen Metin Giriniz';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 8.0, left: 18.0, right: 18.0),
                      child: TextFormField(
                        controller: emailControllerOne,
                        style: const TextStyle(
                            color: Colors.black, fontFamily: "poppins_light"),
                        decoration: InputDecoration(
                          hintText: "Şifre Onayla",
                          hintStyle: TextStyle(
                              color: grey, fontFamily: "poppins_light"),
                          labelStyle: TextStyle(
                              color: black, fontFamily: "poppins_light"),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: green, width: 2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: green, width: 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          fillColor: green,
                          floatingLabelStyle: TextStyle(color: green),
                          focusColor: green,
                        ),
                        maxLength: 24,
                        maxLines: 1,
                        keyboardType: TextInputType.text,
                        cursorColor: black,
                        enableSuggestions: false,
                        autocorrect: false,
                        validator: (inputValueTwo) {
                          if (inputValueTwo == null ||
                              inputValueTwo.trim().isEmpty) {
                            return 'Metin Giriniz';
                          } else if (inputValueTwo == inputValue)
                            return 'Kaydedildi';
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ElevatedButton(
                        onPressed: () {},
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
                    )
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
