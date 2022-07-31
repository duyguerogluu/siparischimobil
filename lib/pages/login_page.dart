import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:siparischi/decoration/colors.dart';
import 'package:siparischi/forgotpassword_page.dart';
import 'package:siparischi/pages/admin/admin_page.dart';
import 'package:siparischi/pages/business/business_page.dart';
import 'package:siparischi/pages/business/business_router.dart';
import 'package:siparischi/pages/register/register_page.dart';
import 'package:siparischi/pages/user/home_page_router.dart';
import 'package:siparischi/pages/user/user_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool progress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [loginWidget(), progress ? wait() : const SizedBox()],
        ));
  }

  Widget loginWidget() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: SafeArea(
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 192),
                alignment: Alignment.center,
                child: Text(
                  "Siparischi",
                  style: TextStyle(
                    color: green,
                    fontSize: 20,
                    fontFamily: "poppins_bold",
                  ),
                ),
              ),
              /*Container(
                width: 148,
                padding: EdgeInsets.only(bottom: 64),
                alignment: Alignment.center,
                child: Image.asset("assets/images/siparischi-logos_black2.png")
              ),*/
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: emailController,
                    style: const TextStyle(
                        color: Colors.black, fontFamily: "poppins_light"),
                    decoration: InputDecoration(
                      hintText: "Kullanıcı adı",
                      hintStyle:
                          TextStyle(color: grey, fontFamily: "poppins_light"),
                      labelStyle:
                          TextStyle(color: black, fontFamily: "poppins_light"),
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
                      suffixIcon: Icon(Icons.email, color: grey),
                    ),
                    maxLength: 24,
                    maxLines: 1,
                    keyboardType: TextInputType.text,
                    cursorColor: black,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: passwordController,
                    obscureText: _obscureText,
                    style: TextStyle(color: black, fontFamily: "poppins_light"),
                    decoration: InputDecoration(
                      hintText: "Şifre",
                      hintStyle:
                          TextStyle(color: grey, fontFamily: "poppins_light"),
                      labelStyle:
                          TextStyle(color: black, fontFamily: "poppins_light"),
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
                  const SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (passwordController.text.isNotEmpty &&
                          emailController.text.isNotEmpty) {
                        setState(() {
                          progress = true;
                        });
                        login();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: green,
                            content: Text(
                              'Eksik alanlar var',
                              style: TextStyle(
                                  color: white, fontFamily: "poppins_light"),
                            ),
                          ),
                        );
                      }
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
                            "Giriş yap",
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const ForgotPasswordPage(),
                            ),
                            (route) => false,
                          );
                        },
                        child: Text(
                          "Şifremi unuttum",
                          style: TextStyle(
                              color: green, fontFamily: "poppins_medium"),
                        ),
                      ),
                      Text(
                        " / ",
                        style: TextStyle(
                            color: green, fontFamily: "poppins_medium"),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const RegisterPage(),
                            ),
                            (route) => false,
                          );
                        },
                        child: Text(
                          "Kaydol",
                          style: TextStyle(
                              color: green, fontFamily: "poppins_medium"),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          )),
        ),
      ),
    );
  }

  Widget wait() {
    return Container(
      alignment: Alignment.center,
      child: const CircularProgressIndicator(
        color: Colors.green,
      ),
    );
  }

  Future<void> login() async {
    if (passwordController.text.isNotEmpty && emailController.text.isNotEmpty) {
      var response = await http.get(
        Uri.parse("https://crealsoft.com/api/admin/GetLogin?"
                "username=" +
            emailController.text +
            "&password=" +
            passwordController.text),
      );
      if (response.statusCode == 200) {
        if (response.body.toString() != "\"0\"") {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const AdminPage(),
            ),
            (route) => false,
          );
        } else {
          var response = await http.get(
            Uri.parse("https://crealsoft.com/api/user/GetLogin?"
                    "username=" +
                emailController.text +
                "&password=" +
                passwordController.text),
          );
          if (response.statusCode == 200) {
            if (response.body.toString() != "\"0\"") {
              UserPage.token = response.body.toString().substring(
                  response.body.toString().indexOf("-") + 1,
                  response.body.toString().length - 1);
              UserPage.id = response.body
                  .toString()
                  .substring(1, response.body.toString().indexOf("-"));
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const HomePageRouter(),
                ),
                (route) => false,
              );
            } else {
              var response = await http.get(
                Uri.parse("https://crealsoft.com/api/business/GetLogin?"
                        "username=" +
                    emailController.text +
                    "&password=" +
                    passwordController.text),
              );
              print("Bağlanılıyor...");
              if (response.statusCode == 200) {
                print("Başarılı...");
                if (response.body.toString() != "\"0\"") {
                  print("Giriş yapıldı...");
                  BusinessPage.token = response.body.toString().substring(
                      response.body.toString().indexOf("-") + 1,
                      response.body.toString().length - 1);
                  BusinessPage.id = response.body
                      .toString()
                      .substring(1, response.body.toString().indexOf("-"));
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => const BusinessRouter(),
                    ),
                    (route) => false,
                  );
                } else {
                  print("Başarısız...");
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: red,
                      content: Text(
                        'Kullanıcı adı veya şifre hatalı',
                        style: TextStyle(
                            color: white, fontFamily: "poppins_light"),
                      ),
                    ),
                  );
                }
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: red,
                    content: Text(
                      'Giriş başarısız',
                      style:
                          TextStyle(color: white, fontFamily: "poppins_light"),
                    ),
                  ),
                );
              }
            }
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: red,
                content: Text(
                  'Giriş başarısız',
                  style: TextStyle(color: white, fontFamily: "poppins_light"),
                ),
              ),
            );
          }
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: red,
            content: Text(
              'Giriş başarısız',
              style: TextStyle(color: white, fontFamily: "poppins_light"),
            ),
          ),
        );
      }
      setState(() {
        progress = false;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: green,
          content: Text(
            'Eksik alanlar var',
            style: TextStyle(color: white, fontFamily: "poppins_light"),
          ),
        ),
      );
    }
  }
}
