import 'package:flutter/material.dart';
import 'package:siparischi/decoration/colors.dart';
import 'package:siparischi/pages/login_page.dart';
import 'package:siparischi/pages/register/user_register_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
        backgroundColor: green,
        centerTitle: true,
        title: Text("Siparischi",
          style: TextStyle(
              color: white,
              fontFamily: "poppins-bold"
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => const UserRegisterPage(),
                    ),
                        (route) => false,
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(green),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                  ),
                ),
                child: Container(
                  alignment: Alignment.center,
                  height: 64,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.login,
                        color: white,
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Text(
                        "Kaydol",
                        style: TextStyle(
                          color: white,
                          fontFamily: "poppins_medium",
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: () {

                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(blue),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                  ),
                ),
                child: Container(
                  alignment: Alignment.center,
                  height: 64,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.apartment,
                        color: white,
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Text(
                        "İşletme Üyeliği",
                        style: TextStyle(
                          color: white,
                          fontFamily: "poppins_medium",
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
