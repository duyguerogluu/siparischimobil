import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:siparischi/decoration/colors.dart';
import 'package:siparischi/pages/business/business_page.dart';
import 'package:siparischi/pages/business/profile_page.dart';

import 'package:siparischi/pages/login_page.dart';
import 'package:siparischi/pages/user/user_page.dart';

class HomePageRouter extends StatefulWidget {
  const HomePageRouter({Key? key}) : super(key: key);

  @override
  State<HomePageRouter> createState() => _HomePageRouterState();
}

class _HomePageRouterState extends State<HomePageRouter> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                      color: white,
                    ),
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => const LoginPage(),
                        ),
                        (route) => false,
                      );
                    },
                  ),
                )
              ]),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [
                    0,
                    0.5
                  ],
                  colors: <Color>[
                    Color.fromARGB(255, 231, 223, 147).withOpacity(0.3),
                    green
                  ]),
            ),
          ),
          centerTitle: true,
          title: Text(
            "Siparischi",
            style: TextStyle(color: white, fontFamily: "poppins-bold"),
          ),
        ),
        body: Row(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  value = !value;
                });

                /*Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => UserPage(),
                  ),
                );*/
              },
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width / 2,
                    child: Image.asset(
                      "assets/images/duygu.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text("YEMEK",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                          fontFamily: "poppins",
                          color: value == true ? Colors.pink : Colors.orange)),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => UserPage(),
                  ),
                );
              },
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width / 2,
                    child: Image.asset(
                      "assets/images/duygu.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text("DİĞER",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                          fontFamily: "poppins")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
