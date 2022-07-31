import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:siparischi/decoration/colors.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Stack(
      alignment: Alignment.center,
      children: [
        Text(
          "Siparischi",
          style:
              TextStyle(color: green, fontSize: 32, fontFamily: "poppins_bold"),
        ),
        SpinKitSpinningLines(
          size: 256,
          color: green,
          itemCount: 5,
          duration: const Duration(seconds: 1),
        ),
      ],
    ));
  }
}
