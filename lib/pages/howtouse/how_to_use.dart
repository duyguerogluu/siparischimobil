import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_walkthrough_screen/flutter_walkthrough_screen.dart';
import 'package:siparischi/decoration/colors.dart';
import 'package:siparischi/pages/login_page.dart';

class HowToUse extends StatelessWidget {
  HowToUse({Key? key}) : super(key: key);

  final List<OnbordingData> list = [
    OnbordingData(
      image: AssetImage("assets/images/sepet.png"),
      fit: BoxFit.fitHeight,
      titleText: Text("ONLİNE SİPARİŞ",
          style: TextStyle(
            fontSize: 32,
            fontFamily: "poppins-light",
            color: green,
          ),
          textAlign: TextAlign.center),
      descText: Text(
          " deneme deneme denemedenemedenemedenemedenemedenemedenemedenemedenemedenemedenemedenemedeneme",
          style: TextStyle(
            fontSize: 18,
            fontFamily: "poppins-medium",
            color: grey.withOpacity(0.5),
          ),
          textAlign: TextAlign.center),
    ),
    OnbordingData(
      image: AssetImage("assets/images/teslimat.png"),
      fit: BoxFit.fitHeight,
      titleText: Text("HIZLI TESLİMAT",
          style: TextStyle(
            fontSize: 32,
            fontFamily: "poppins-light",
            color: green,
          ),
          textAlign: TextAlign.center),
      descText: Text(
          " deneme deneme denemedenemedenemedenemedenemedenemedenemedenemedenemedenemedenemedenemedeneme",
          style: TextStyle(
            fontSize: 18,
            fontFamily: "poppins-medium",
            color: grey.withOpacity(0.5),
          ),
          textAlign: TextAlign.center),
    ),
    OnbordingData(
      image: AssetImage("assets/images/mavitik.png"),
      fit: BoxFit.fitHeight,
      titleText: Text("YÜKSEK KALİTE",
          style: TextStyle(
            fontSize: 32,
            fontFamily: "poppins-light",
            color: green,
          ),
          textAlign: TextAlign.center),
      descText: Text(
          " deneme deneme denemedenemedenemedenemedenemedenemedenemedenemedenemedenemedenemedenemedeneme",
          style: TextStyle(
            fontSize: 18,
            fontFamily: "poppins-medium",
            color: grey.withOpacity(0.5),
          ),
          textAlign: TextAlign.center),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return IntroScreen(
      onbordingDataList: list,
      colors: [
        //list of colors for per pages
        Colors.white,
        Colors.red,
      ],
      pageRoute: MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
      nextButton: Text(
        "SONRAKİ",
        style: TextStyle(
          color: Colors.purple,
        ),
      ),
      lastButton: Text(
        "DEVAM ET",
        style: TextStyle(
          color: Colors.purple,
        ),
      ),
      skipButton: Text(
        "ÇIKIŞ",
        style: TextStyle(
          color: Colors.orange,
        ),
      ),
      selectedDotColor: green,
      unSelectdDotColor: Colors.grey,
    );
  }
}
