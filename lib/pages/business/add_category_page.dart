import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:siparischi/decoration/colors.dart';
import 'package:siparischi/pages/business/business_page.dart';
import 'package:siparischi/pages/business/edit_profile_business.dart';

class AddCategory extends StatefulWidget {
  const AddCategory({Key? key}) : super(key: key);

  @override
  State<AddCategory> createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  File? image;
  bool imageEmpty = false;
  var categoryNameController = TextEditingController();
  List category = [];
  late final pickedFile;
  late final bytes;

  final picker = ImagePicker();

  chooseImage(ImageSource source) async {
    pickedFile = await picker.pickImage(
      source: source,
      imageQuality: 50,
    );
    bytes = File(pickedFile!.path).readAsBytesSync();
    setState(() {
      image = File(pickedFile.path);
      imageEmpty = true;
      print("fotograf secildi: " + imageEmpty.toString());
    });
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
                      icon: FaIcon(
                        FontAwesomeIcons.arrowLeft,
                        size: 16,
                        color: black,
                      ),
                    ),
                  ),
                  Flexible(
                    child: Text(
                      "Yeni Kategori",
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: "poppins_medium",
                        color: black,
                      ),
                    ),
                  ),
                ],
              ),
              verticalDivider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Flexible(
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          "Kategori Fotoğrafı",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'poppins_medium'),
                        ),
                      )),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
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
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: imageEmpty
                      ? Image.file(image!)
                      : Image.asset(
                    "assets/images/default.jpg",
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 8, horizontal: 32.0),
                child: verticalDivider(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextFormField(
                  controller: categoryNameController,
                  style: const TextStyle(
                      color: Colors.black, fontFamily: "poppins_light"),
                  decoration: InputDecoration(
                    hintText: "Kategori Adı",
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
                    suffixIcon: Icon(Icons.category, color: grey),
                  ),
                  maxLength: 24,
                  maxLines: 1,
                  keyboardType: TextInputType.text,
                  cursorColor: black,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    print("EKLEME YAPILIYOR");
                    setState(() {
                      categoryPost();
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 64,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add_box_rounded,
                          color: white,
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Text(
                          "Kaydet",
                          style: TextStyle(
                            color: white,
                            fontFamily: "poppins_medium",
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(green),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> categoryPost() async {
    var categoryResponse = await http.post(
        Uri.parse(
            "https://crealsoft.com/api/category?apiKey=" + BusinessPage.token),
        //headers: {"Content-Type": "application/json"},
        body: {
          "category_name": categoryNameController.text,
          "image_url": "",
          "status": "Aktif",
          "creation_date": DateTime.now()
              .toString()
              .replaceAll("-", ".")
              .substring(0, DateTime.now().toString().indexOf(" ")),
          "business_id": BusinessPage.id
        });
    if (categoryResponse.statusCode == 201) {
      print('Succesfull: ${categoryResponse.statusCode}.');
      setState(() {
        print("Category-> " + categoryResponse.body.toString());
        category = jsonDecode("[" + categoryResponse.body + "]");
        print("Category-> " + category[0]["id"].toString());
      });
      var res = uploadImage();
      print(">>> " + res.toString());
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => const BusinessPage(),
        ),
            (route) => false,
      );
    } else {
      print(
          'Request failed product with status: ${categoryResponse.statusCode}.');
    }
  }

  Future<String?> uploadImage() async {
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            "https://crealsoft.com/api/ImageUpload/UploadImageCategory?id=" +
                category[0]["id"].toString()));
    request.files
        .add(await http.MultipartFile.fromPath('picture', pickedFile!.path));
    var res = await request.send();
    return res.reasonPhrase;
  }
}
