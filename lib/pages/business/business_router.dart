import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:siparischi/decoration/colors.dart';
import 'package:siparischi/pages/business/profile_page.dart';
import 'package:siparischi/pages/login_page.dart';

class BusinessRouter extends StatefulWidget {
  const BusinessRouter({Key? key}) : super(key: key);

  @override
  State<BusinessRouter> createState() => _BusinessRouterState();
}

class _BusinessRouterState extends State<BusinessRouter> {
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
            "Business Name",
            style: TextStyle(color: white, fontFamily: "poppins-bold"),
          ),
        ),
        body: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                "assets/images/default.jpg",
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 280,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      white,
                      white,
                    ],
                  ),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50.0),
                      topLeft: Radius.circular(50.0)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 40.0, left: 24.0, right: 24.0),
                        child: Container(
                          height: 220,
                          //
                          //color: red,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Business Name",
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "poppins-bold",
                                        color: black),
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.star_rounded,
                                        color: green,
                                      ),
                                      Text(
                                        "9/10",
                                        style: TextStyle(
                                            fontFamily: "poppins_bold",
                                            color: green,
                                            fontSize: 18),
                                      ),
                                      Text(
                                        " (24)",
                                        style: TextStyle(
                                            fontFamily: "poppins_medium",
                                            color: grey,
                                            fontSize: 12),
                                      )
                                    ],
                                  ),
                                  FaIcon(FontAwesomeIcons.heart),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Business address, contry, city felan",
                                style: TextStyle(
                                    fontSize: 16,
                                    //fontWeight: FontWeight.bold,
                                    fontFamily: "poppins-light",
                                    color: grey.withOpacity(0.5)),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Text(
                                "Business description Business descriptionBusiness descriptionBusiness descriptionBusiness description Business description Business description Business description Business description",
                                style: TextStyle(
                                    fontSize: 16,
                                    //fontWeight: FontWeight.bold,
                                    fontFamily: "poppins-light",
                                    color: grey.withOpacity(0.5)),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: Column(
                                      children: [
                                        Icon(Icons.whatsapp,
                                            color: black, size: 40),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          "Whatsapp",
                                          style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "poppins-light",
                                              color: black),
                                        ),
                                      ],
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Column(
                                      children: [
                                        Icon(Icons.phone,
                                            color: black, size: 40),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          "Telefon",
                                          style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "poppins-light",
                                              color: black),
                                        ),
                                      ],
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Column(
                                      children: [
                                        FaIcon(FontAwesomeIcons.globe,
                                            color: black, size: 40),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          "Web Site",
                                          style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "poppins-light",
                                              color: black),
                                        ),
                                      ],
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Column(
                                      children: [
                                        FaIcon(FontAwesomeIcons.instagram,
                                            color: black, size: 40),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          "Instagram",
                                          style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "poppins-light",
                                              color: black),
                                        ),
                                      ],
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Column(
                                      children: [
                                        FaIcon(FontAwesomeIcons.locationArrow,
                                            color: black, size: 40),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          "Konum",
                                          style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "poppins-light",
                                              color: black),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Flexible(
                            child: AspectRatio(
                              aspectRatio: 8 / 3,
                              child: Container(
                                height: 160,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: white,
                                ),
                                child: Center(
                                  child: Text(
                                    "Menü",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: "poppins_medium",
                                        color: green),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Profile()));
                              },
                              child: AspectRatio(
                                aspectRatio: 8 / 3,
                                child: Container(
                                  height: 160,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF03A373),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(50.0),
                                      //bottomLeft: Radius.circular(50.0)
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Menü",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontFamily: "poppins_medium",
                                          color: white),
                                    ),
                                  ),
                                ),
                              ),
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
      ),
    );
  }
}
