import 'package:flutter/material.dart';
import 'package:siparischi/pages/business/business_page.dart';
import 'package:siparischi/pages/business/business_router.dart';
import 'package:siparischi/pages/business/profile_page.dart';
import 'package:siparischi/pages/deneme.dart';
import 'package:siparischi/pages/howtouse/how_to_use.dart';
import 'package:siparischi/pages/login_page.dart';
import 'package:siparischi/pages/user/home_page_router.dart';
import 'package:siparischi/pages/user/other_router.dart';
import 'package:siparischi/pages/user/user_page.dart';
import 'decoration/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Siparischi',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: LoginPage(),
    );
  }
}
