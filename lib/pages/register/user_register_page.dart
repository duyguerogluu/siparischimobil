import 'package:flutter/material.dart';
import 'package:siparischi/pages/register/register_page.dart';
import 'package:http/http.dart' as http;
import '../../decoration/colors.dart';

class UserRegisterPage extends StatefulWidget {
  const UserRegisterPage({Key? key}) : super(key: key);

  @override
  State<UserRegisterPage> createState() => _UserRegisterPageState();
}

class _UserRegisterPageState extends State<UserRegisterPage> {
  bool _obscureText = true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneNumberController = TextEditingController();

  bool progress = false;
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
                        builder: (BuildContext context) => const RegisterPage(),
                      ),
                      (route) => false,
                    );
                  },
                ),
              )
            ]),
        backgroundColor: green,
        centerTitle: true,
        title: Text(
          "Siparischi",
          style: TextStyle(color: white, fontFamily: "poppins-bold"),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 48,
                        child: Text(
                          "+90",
                          style: TextStyle(
                              color: black,
                              fontFamily: "poppins_light",
                            fontSize: 18
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: 280,
                        child: TextFormField(
                          controller: phoneNumberController,
                          style: const TextStyle(
                              color: Colors.black, fontFamily: "poppins_light"),
                          decoration: InputDecoration(
                            hintText: "Telefon numarası",
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
                            suffixIcon: Icon(Icons.phone, color: grey),
                          ),
                          maxLength: 10,
                          maxLines: 1,
                          keyboardType: TextInputType.text,
                          cursorColor: black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: usernameController,
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
                      suffixIcon: Icon(Icons.person, color: grey),
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
                      if (phoneNumberController.text.isNotEmpty &&
                          usernameController.text.isNotEmpty &&
                          passwordController.text.isNotEmpty) {
                        setState(() {
                          progress = true;
                        });
                        register();
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
                            Icons.person_add,
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
                ],
              ),
            ),
          ),
        ),
      )
    );
  }

  Future<void> register() async {
    if (phoneNumberController.text.isNotEmpty &&
        usernameController.text.isNotEmpty &&
        passwordController.text.isNotEmpty) {
      var response = await http.get(
        Uri.parse("https://crealsoft.com/api/user/GetRegister?"
                "id=0&"
                "username=" +
            usernameController.text +
            "&"
                "password=" +
            passwordController.text +
            "&"
                "status=Aktif&"
                "phone_number=" +
            phoneNumberController.text +
            "&"
                "email=0&"
                "address=0&"
                "creation_date=" +
            DateTime.now().toString().replaceAll("-", ".").substring(0, DateTime.now().toString().indexOf(" ")) +
            "&"
                "location=0"),
      );
      if (response.statusCode == 200) {
        if(response.body.toString() == "\"Kayıt eklendi\""){
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: green,
              content: Text(
                'Kullanıcı oluşturuldu',
                style: TextStyle(color: white, fontFamily: "poppins_light"),
              ),
            ),
          );
        }
        if(response.body.toString() == "\"Kayıt eklenemedi\""){
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: red,
              content: Text(
                'Kullanıcı oluşturulamadı',
                style: TextStyle(color: white, fontFamily: "poppins_light"),
              ),
            ),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: red,
            content: Text(
              'Http hatası: ' + response.statusCode.toString(),
              style: TextStyle(
                color: white,
                fontFamily: "poppins_light",
              ),
            ),
          ),
        );
      }
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
