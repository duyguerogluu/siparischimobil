import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:io';
import 'dart:async';
import 'package:siparischi/decoration/colors.dart';
import 'package:siparischi/pages/business/business_page.dart';

class EditProfileBusiness extends StatefulWidget {
  const EditProfileBusiness({Key? key}) : super(key: key);

  @override
  State<EditProfileBusiness> createState() => _EditProfileBusinessState();
}
//launch("https://wa.me/+38268584678?text=Hi! I want to get service through Tojeto.");

class _EditProfileBusinessState extends State<EditProfileBusiness> {
  late File image;
  File? image1;
  bool imageEmpty = false;

  var emailController = TextEditingController();

  final picker = ImagePicker();

  chooseImage(ImageSource source) async {
    // ignore: deprecated_member_use
    final pickedFile = await picker.getImage(
      source: source,
      imageQuality: 50,
    );
    setState(() {
      image = File(pickedFile!.path);
      imageEmpty = true;
      print("fotograf secildi: " + imageEmpty.toString());
    });
  }

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future pickImage1() async {
    try {
      final image1 = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image1 == null) return;

      final imageTemporary = File(image1.path);
      setState(() {
        this.image1 = imageTemporary;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Flexible(
                      child: IconButton(
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const BusinessPage(),
                              ),
                              (route) => false,
                            );
                          },
                          icon: const FaIcon(
                            FontAwesomeIcons.arrowLeft,
                            size: 16,
                          ))),
                  Flexible(
                      child: Text(
                    "Profili Düzenle",
                    style:
                        TextStyle(fontSize: 18, fontFamily: "poppins_medium"),
                  )),
                ],
              ),

              verticalDivider(),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Flexible(
                      child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Kapak Fotoğrafı",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'poppins_medium'),
                    ),
                  )),
                  Flexible(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        chooseImage(ImageSource.gallery);
                      },
                      child: const Text(
                        "Fotoğraf Ekle",
                        style: TextStyle(fontFamily: "poppins_medium"),
                      ),
                      style: myButtonStyle(green),
                    ),
                  ))
                ],
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: imageEmpty
                        ? Image.file(image)
                        : Image.asset(
                            "assets/images/default.jpg",
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.cover,
                          )),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: verticalDivider(),
              ),
              //Alttaki Kullanıcı Adı
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0, right: 8, left: 8),
                child: TextFormField(
                  controller: emailController,
                  style: const TextStyle(
                      color: Colors.black, fontFamily: "poppins_light"),
                  decoration: InputDecoration(
                    hintText: "Kullanıcı Adı",
                    hintStyle:
                        TextStyle(color: grey, fontFamily: "poppins_light"),
                    labelStyle:
                        TextStyle(color: black, fontFamily: "poppins_light"),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: green, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: green, width: 1),
                      borderRadius: BorderRadius.circular(10),
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
              ),

              Padding(
                padding:
                    const EdgeInsets.only(bottom: 8.0, left: 8.0, right: 8.0),
                child: TextFormField(
                  controller: emailController,
                  style: const TextStyle(
                      color: Colors.black, fontFamily: "poppins_light"),
                  decoration: InputDecoration(
                    hintText: "Şirket Adı",
                    hintStyle:
                        TextStyle(color: grey, fontFamily: "poppins_light"),
                    labelStyle:
                        TextStyle(color: black, fontFamily: "poppins_light"),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: green, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: green, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    fillColor: green,
                    floatingLabelStyle: TextStyle(color: green),
                    focusColor: green,
                    suffixIcon: Icon(Icons.business, color: grey),
                  ),
                  maxLength: 24,
                  maxLines: 1,
                  keyboardType: TextInputType.text,
                  cursorColor: black,
                ),
              ),

              Padding(
                padding:
                    const EdgeInsets.only(bottom: 8.0, left: 8.0, right: 8.0),
                child: TextFormField(
                  controller: emailController,
                  style: const TextStyle(
                      color: Colors.black, fontFamily: "poppins_light"),
                  decoration: InputDecoration(
                    hintText: "Telefon",
                    hintStyle:
                        TextStyle(color: grey, fontFamily: "poppins_light"),
                    labelStyle:
                        TextStyle(color: black, fontFamily: "poppins_light"),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: green, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: green, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    fillColor: green,
                    floatingLabelStyle: TextStyle(color: green),
                    focusColor: green,
                    suffixIcon: Icon(Icons.phone, color: grey),
                  ),
                  maxLength: 24,
                  maxLines: 1,
                  keyboardType: TextInputType.phone,
                  cursorColor: black,
                ),
              ),

              Padding(
                padding:
                    const EdgeInsets.only(bottom: 8.0, left: 8.0, right: 8.0),
                child: TextFormField(
                  controller: emailController,
                  style: const TextStyle(
                      color: Colors.black, fontFamily: "poppins_light"),
                  decoration: InputDecoration(
                    hintText: "E-Mail",
                    hintStyle:
                        TextStyle(color: grey, fontFamily: "poppins_light"),
                    labelStyle:
                        TextStyle(color: black, fontFamily: "poppins_light"),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: green, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: green, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    fillColor: green,
                    floatingLabelStyle: TextStyle(color: green),
                    focusColor: green,
                    suffixIcon: Icon(Icons.email, color: grey),
                  ),
                  maxLength: 24,
                  maxLines: 1,
                  keyboardType: TextInputType.phone,
                  cursorColor: black,
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                      flex: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: ElevatedButton(
                          onPressed: () {
                            chooseImage(ImageSource.gallery);
                          },
                          child: const Text(
                            "Şifre Değiştir",
                            style: TextStyle(fontFamily: "poppins_medium"),
                          ),
                          style: myButtonStyle(green),
                        ),
                      )),
                  Flexible(
                      flex: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: ElevatedButton(
                          onPressed: () {
                            chooseImage(ImageSource.gallery);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: 500,
                            child: Text(
                              "Konum Güncelle",
                              style: TextStyle(
                                  fontFamily: "poppins_medium", fontSize: 14),
                            ),
                          ),
                          style: myButtonStyle(green),
                        ),
                      )),
                  Flexible(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text(
                            "Kaydet",
                            style: TextStyle(fontFamily: "poppins_medium"),
                          ),
                          style: myButtonStyle(green),
                        ),
                      ))
                ],
              ),

              SizedBox(
                height: 40,
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildButton({required String title, required VoidCallback onClicked}) =>
    ElevatedButton(
      onPressed: () {
        // getImage();
      },
      child: const Text("Add Photo"),
      style: myButtonStyle(green),
    );

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

Divider verticalDivider() {
  return Divider(
      height: 20,
      thickness: 1,
      endIndent: 8,
      indent: 8,
      color: Colors.grey.withOpacity(0.3));
}
