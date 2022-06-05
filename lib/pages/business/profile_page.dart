import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:siparischi/decoration/colors.dart';
import 'package:siparischi/pages/business/edit_profile_business.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 300,
                        width: double.infinity,
                        child:
                            Stack(alignment: Alignment.bottomCenter, children: [
                          Padding(
                              padding: EdgeInsets.only(bottom: 88.0),
                              child: Container(
                                color: Colors.red,
                                child: Image.asset(
                                  "assets/images/duygu.jpg",
                                  width: MediaQuery.of(context).size.width,
                                  fit: BoxFit.cover,
                                ),
                              )
                              //Image.asset( "assets/images/duygu.jpg",  width: MediaQuery.of(context).size.width,fit: BoxFit.cover, ),
                              ),
                          Stack(alignment: Alignment.bottomCenter, children: [
                            Container(
                              width: 200,
                              height: 140,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Flexible(
                                    child: Text(
                                      "Dominos",
                                      style: TextStyle(
                                          fontFamily: 'poppins_bold',
                                          fontSize: 18),
                                    ),
                                  ),
                                  Flexible(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                          "Address Address Address Address Address Address",
                                          style: TextStyle(
                                              fontFamily: 'poppins_medium')),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.orange,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.orange,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.orange,
                                    ),
                                    Icon(Icons.star),
                                    Icon(Icons.star),
                                  ],
                                ),
                                IconButton(
                                    onPressed: () {
                                      /*Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Profile()));*/
                                    },
                                    icon: FaIcon(
                                      FontAwesomeIcons.pen,
                                      color: Colors.grey,
                                      size: 16,
                                    )),
                              ],
                            )
                          ])
                        ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton.icon(
                              style: myButtonStyle(Colors.grey),
                              onPressed: () {
                                // Navigator.push(context, MaterialPageRoute( builder: (context) => EditProfile()),);
                              },
                              label: Text(
                                'Add to The Story',
                                style: TextStyle(fontSize: 14),
                              ),
                              icon: FaIcon(
                                FontAwesomeIcons.plus,
                                size: 12,
                              ),
                            ),
                            ElevatedButton.icon(
                              style: myButtonStyle(Colors.grey),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          EditProfileBusiness()),
                                );
                              },
                              label: Text(
                                'Edit Profile',
                                style: TextStyle(fontSize: 14),
                              ),
                              icon: FaIcon(
                                FontAwesomeIcons.pen,
                                size: 12,
                              ),
                            ),
                            ElevatedButton(
                              style: myButtonStyle(Colors.white),
                              onPressed: () {
                                // Navigator.push(context,MaterialPageRoute(builder: (context) => EditProfile()),);
                              },
                              child: Text(
                                '...',
                                style:
                                    TextStyle(fontSize: 30, color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                      ),
                      horizontalDivider(),
                    ],
                  ),
                ),
              ),
              Foods(),
              Foods(),
              Foods(),
              Foods(),
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

Widget verticalLine() {
  return Flexible(
    flex: 1,
    child: Container(
      height: 22,
      width: 1,
      color: Colors.grey.withOpacity(0.3),
    ),
  );
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

VerticalDivider verticalDivider() {
  return VerticalDivider(
    color: Colors.grey.withOpacity(0.3), //color of divider
    width: 10, //width space of divider
    thickness: 9, //thickness of divier line
    indent: 4, //Spacing at the top of divider.
    endIndent: 4, //Spacing at the bottom of divider.
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

class Foods extends StatefulWidget {
  const Foods({Key? key}) : super(key: key);

  @override
  State<Foods> createState() => _FoodsState();
}

class _FoodsState extends State<Foods> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: AspectRatio(
        aspectRatio: 16 / 4,
        child: Container(
          decoration: BoxDecoration(
            color: white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 4,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                          "Tavuk Çorbası",
                          style: TextStyle(
                              fontSize: 17,
                              fontFamily: 'poppins_medium',
                              color: grey),
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        child: Text(
                          "description",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'poppins_medium',
                              color: grey.withOpacity(0.6)),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Flexible(
                        child: Text(
                          "₺48,00",
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'poppins_bold',
                              color: green),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: AspectRatio(
                    aspectRatio: 16 / 16,
                    child: Container(
                      decoration: BoxDecoration(
                          color: green,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: Border.all(
                              width: 2.0, color: const Color(0xFFFFFFFF))),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
