import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:siparischi/decoration/colors.dart';
import 'package:siparischi/pages/user/user_page.dart';

class OtherRouter extends StatefulWidget {
  const OtherRouter({Key? key}) : super(key: key);

  @override
  State<OtherRouter> createState() => _OtherRouterState();
}

class _OtherRouterState extends State<OtherRouter> {
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
                        builder: (BuildContext context) => const UserPage(),
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
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [
                  0,
                  0.5,
                ],
                colors: <Color>[
                  Color.fromARGB(255, 231, 223, 147).withOpacity(0.3),
                  green.withOpacity(0.6),
                ]),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white.withOpacity(0.2),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    'BusinessType1',
                    style: TextStyle(
                      fontFamily: "poppins-light",
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: white,
                      shadows: [
                        Shadow(
                          blurRadius: 10,
                          color: Colors.green,
                          offset: Offset(5, 5),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white.withOpacity(0.2),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    'BusinessType1',
                    style: TextStyle(
                      fontFamily: "poppins-light",
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: white,
                      shadows: [
                        Shadow(
                          blurRadius: 10,
                          color: Colors.green,
                          offset: Offset(5, 5),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white.withOpacity(0.2),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    'BusinessType1',
                    style: TextStyle(
                      fontFamily: "poppins-light",
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: white,
                      shadows: [
                        Shadow(
                          blurRadius: 10,
                          color: Colors.green,
                          offset: Offset(5, 5),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white.withOpacity(0.2),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    'BusinessType1',
                    style: TextStyle(
                      fontFamily: "poppins-light",
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: white,
                      shadows: [
                        Shadow(
                          blurRadius: 10,
                          color: Colors.green,
                          offset: Offset(5, 5),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
