import 'dart:convert';
import 'package:badges/badges.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:siparischi/decoration/colors.dart';
import 'package:siparischi/pages/business/add_category_page.dart';
import 'package:siparischi/pages/business/business_page.dart';
import 'package:http/http.dart' as http;
import 'dart:typed_data';
import 'package:flutter/widgets.dart';
import 'package:siparischi/pages/business/edit_profile_business.dart';
import 'package:siparischi/pages/business/food_details.dart';
import 'package:siparischi/pages/business/shopping_list.dart';
import 'package:siparischi/pages/loading.dart';

Image imageFromBase64String(String base64String) {
  return Image.memory(base64Decode(base64String));
}

Uint8List dataFromBase64String(String base64String) {
  return base64Decode(base64String);
}

String base64String(Uint8List data) {
  return base64Encode(data);
}

class Product {
  String name, price;
  int piece;
  Product({required this.name, required this.price, required this.piece});
}

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List category = [];
  List product = [];
  List productControl = [];
  List business = [];

  List<double> animPadding = [];
  List<bool> productDeleteMode = [];

  double _animConPadding = 0;

  String pointValue = "0";
  bool refresh = true, editMode = false;

  double _updateAnimConPadding(int index) {
    setState(() {
      animPadding[index] = 64;
      print(">> " + animPadding[index].toString());
    });
    return animPadding[index];
  }

  double _updateAnimConPadding2(int index) {
    setState(() {
      animPadding[index] = 0;
      print(">> " + animPadding[index].toString());
    });
    return animPadding[index];
  }

  @override
  void initState() {
    businessList(BusinessPage.id);
    businessRatingList();
    categoryList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: category.isEmpty || product.isEmpty
            ? const Loading()
            : RefreshIndicator(
                onRefresh: _refresh,
                color: white,
                backgroundColor: green,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Column(
                          children: [
                            SizedBox(
                              child: Column(children: [
                                Stack(
                                  alignment: Alignment.bottomRight,
                                  children: [
                                    SizedBox(
                                        height: 150,
                                        child: FadeInImage(
                                          image: NetworkImage(business[0]
                                                  ["image_url"]
                                              .toString()),
                                          placeholder: AssetImage(
                                            "assets/images/default.jpg",
                                          ),
                                          width:
                                              MediaQuery.of(context).size.width,
                                          fit: BoxFit.cover,
                                          imageErrorBuilder:
                                              (context, error, stackTrace) {
                                            return Image.asset(
                                              'assets/images/default.jpg',
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              fit: BoxFit.cover,
                                            );
                                          },
                                        ) /*Image.network(
                                        business[0]["image_url"].toString(),
                                        width:
                                            MediaQuery.of(context).size.width,
                                        fit: BoxFit.cover,
                                      ),*/
                                        ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  const EditProfileBusiness(),
                                            ),
                                            (route) => false,
                                          );
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: grey,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Icon(
                                              Icons.edit,
                                              color: white,
                                              size: 18,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Flexible(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 16, top: 16),
                                            child: Text(
                                              business[0]["business_name"],
                                              style: TextStyle(
                                                  fontFamily: 'poppins_bold',
                                                  fontSize: 20,
                                                  color: black),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            right: 16,
                                            top: 20,
                                          ),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.star_rounded,
                                                color: green,
                                              ),
                                              Text(
                                                pointValue + "/10",
                                                style: TextStyle(
                                                  fontFamily: "poppins_bold",
                                                  color: green,
                                                  fontSize: 16,
                                                ),
                                              ),
                                              Text(
                                                " (24)",
                                                style: TextStyle(
                                                    fontFamily:
                                                        "poppins_medium",
                                                    color: grey,
                                                    fontSize: 10),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Flexible(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 4, left: 16),
                                            child: SizedBox(
                                              width: 400,
                                              child: Text(
                                                business[0]["city"] +
                                                    " " +
                                                    business[0]["district"] +
                                                    " " +
                                                    business[0]
                                                        ["neighbourhood"],
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: black,
                                                    fontFamily:
                                                        'poppins_medium'),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 4, right: 16),
                                          child: InkWell(
                                            onTap: () {},
                                            child: Icon(
                                              Icons.location_on,
                                              color: blue,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ]),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 16, left: 16, right: 16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Pizza - Börek",
                                    style: TextStyle(
                                      color: grey,
                                      fontFamily: "poppins_medium",
                                    ),
                                  ),
                                  SizedBox(
                                    width: 90,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Açılış:",
                                              style: TextStyle(
                                                  color: grey,
                                                  fontFamily: "poppins_medium",
                                                  fontSize: 12),
                                            ),
                                            Text(
                                              "08:00",
                                              style: TextStyle(
                                                  color: grey,
                                                  fontFamily: "poppins_medium",
                                                  fontSize: 12),
                                              textAlign: TextAlign.end,
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Kapanış:",
                                              style: TextStyle(
                                                  color: grey,
                                                  fontFamily: "poppins_medium",
                                                  fontSize: 12),
                                            ),
                                            Text(
                                              "22:00",
                                              style: TextStyle(
                                                  color: grey,
                                                  fontFamily: "poppins_medium",
                                                  fontSize: 12),
                                              textAlign: TextAlign.end,
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            horizontalDivider(),
                            Padding(
                              padding: const EdgeInsets.only(top: 4, left: 16),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Kategoriler",
                                    style: TextStyle(
                                        color: black,
                                        fontSize: 20,
                                        fontFamily: "poppins_bold"),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              const AddCategory(),
                                        ),
                                        (route) => false,
                                      );
                                    },
                                    child: Icon(
                                      Icons.add_box_rounded,
                                      color: black,
                                    ),
                                  )
                                ],
                              ),
                            )
                            /*Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: ElevatedButton.icon(
                                    style: myButtonStyle(grey),
                                    onPressed: () {
                                      // Navigator.push(context, MaterialPageRoute( builder: (context) => EditProfile()),);
                                    },
                                    label: Text(
                                      'Yeni Kategori',
                                      style: TextStyle(
                                      fontFamily: "poppins_medium"
                                      ),
                                    ),
                                    icon: const FaIcon(
                                      FontAwesomeIcons.plus,
                                      size: 12,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: ElevatedButton.icon(
                                    style: myButtonStyle(grey),
                                    onPressed: () {
                                      // Navigator.push(context, MaterialPageRoute( builder: (context) => EditProfile()),);
                                    },
                                    label: Text(
                                      'Yeni Ürün',
                                      style: TextStyle(
                                          fontFamily: "poppins_medium"
                                      ),
                                    ),
                                    icon: const FaIcon(
                                      FontAwesomeIcons.plus,
                                      size: 12,
                                    ),
                                  ),
                                ),*/ /*
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: ElevatedButton.icon(
                                    style: myButtonStyle(grey),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const EditProfileBusiness()),
                                      );
                                    },
                                    label: const Text(
                                      'Profili düzenle',
                                      style: TextStyle(
                                          fontFamily: "poppins_medium"
                                      ),
                                    ),
                                    icon: const FaIcon(
                                      FontAwesomeIcons.pen,
                                      size: 12,
                                    ),
                                  ),
                                ),*/ /*
                              ],
                            ),
                          ),*/
                          ],
                        ),
                      ),
                      category.isNotEmpty
                          ? SizedBox(
                              height: 100,
                              child: ListView.builder(
                                itemCount:
                                    category.isEmpty ? 0 : category.length,
                                scrollDirection: Axis.horizontal,
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          refresh = true;
                                        });
                                        productList(
                                            category[index]["id"].toString());
                                      },
                                      onLongPress: () {
                                        setState(() {
                                          editMode
                                              ? editMode = false
                                              : editMode = true;
                                        });
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          boxShadow: [
                                            BoxShadow(
                                                color: grey.withOpacity(0.3),
                                                offset: const Offset(0, 16),
                                                blurRadius: 24),
                                          ],
                                          color: white,
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          child: Stack(
                                            alignment: Alignment.bottomRight,
                                            children: [
                                              SizedBox(
                                                  width: 144,
                                                  child: FadeInImage(
                                                    image: NetworkImage(
                                                        category[index]
                                                                ["image_url"]
                                                            .toString()),
                                                    placeholder:
                                                        const AssetImage(
                                                      "assets/images/duygu.jpg",
                                                    ),
                                                    imageErrorBuilder: (context,
                                                        error, stackTrace) {
                                                      return Image.asset(
                                                        'assets/images/duygu.jpg',
                                                      );
                                                    },
                                                  )
                                                  /*Image.network(
                                                      category[index]
                                                              ["image_url"]
                                                          .toString(),
                                                      fit: BoxFit.cover,
                                                    )*/
                                                  ),
                                              Container(
                                                width: 144,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                  colors: [
                                                    Colors.transparent,
                                                    black.withOpacity(0.8)
                                                  ],
                                                  begin: const Alignment(1, -1),
                                                  end: const Alignment(1, 1),
                                                )),
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            12.0),
                                                    child: Text(
                                                      category[index]
                                                          ["category_name"],
                                                      style: TextStyle(
                                                          fontFamily:
                                                              "poppins_medium",
                                                          color: white),
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                  editMode
                                                      ? Row(
                                                          children: [
                                                            Container(
                                                              height: 36,
                                                              width: 72,
                                                              color: green,
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: Icon(
                                                                Icons.update,
                                                                color: white,
                                                              ),
                                                            ),
                                                            GestureDetector(
                                                              onTap: () {
                                                                showBottomSheet(
                                                                    category[index]
                                                                            [
                                                                            "id"]
                                                                        .toString());
                                                              },
                                                              child: Container(
                                                                height: 36,
                                                                width: 72,
                                                                color: red,
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                child: Icon(
                                                                  Icons.delete,
                                                                  color: white,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        )
                                                      : const SizedBox()
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                          : SizedBox(
                              height: 96,
                              child: Center(
                                child: Text(
                                  "Bir kategori oluşturun",
                                  style: TextStyle(
                                    color: black,
                                    fontFamily: "poppins_light",
                                  ),
                                ),
                              ),
                            ),
                      Container(
                        height: 430,
                        alignment: Alignment.center,
                        child: !refresh
                            ? product.isNotEmpty
                                ? ListView.builder(
                                    itemCount:
                                        product.isEmpty ? 0 : product.length,
                                    physics: const BouncingScrollPhysics(),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return foods(
                                          context,
                                          product[index]["product_name"]
                                              .toString(),
                                          product[index]["detail"].toString(),
                                          product[index]["image_url"]
                                              .toString(),
                                          product[index]["price"].toString(),
                                          product[index]["Category"]
                                                  ["category_name"]
                                              .toString(),
                                          index,
                                          product[index]["id"].toString());
                                    },
                                  )
                                : Center(
                                    child: Text(
                                      "Henüz ürün eklenmedi!",
                                      style: TextStyle(
                                          color: black,
                                          fontSize: 18,
                                          fontFamily: "poppins_light"),
                                    ),
                                  )
                            : Center(
                                child: CircularProgressIndicator(
                                  color: green,
                                ),
                              ),
                      ),
                    ],
                  ),
                ),
              ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: green.withOpacity(0.5),
                boxShadow: [
                  BoxShadow(
                      color: grey.withOpacity(0.7),
                      offset: const Offset(4, 4),
                      blurRadius: 5)
                ]),
            child: Badge(
              position: BadgePosition.topEnd(top: 0, end: 0),
              animationDuration: const Duration(milliseconds: 1000),
              animationType: BadgeAnimationType.slide,
              badgeColor: red,
              badgeContent: Text(
                ShoppingList.shopping.length.toString(),
                style: TextStyle(
                    color: white, fontFamily: "poppins_medium", fontSize: 16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                    icon: Icon(
                      Icons.shopping_bag_rounded,
                      color: white,
                      size: 32,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ShoppingList()));
                    }),
              ),
            ),
          ),
        )
        /*FittedBox(
        child: Stack(
          alignment: const Alignment(1.4, -1.5),
          children: [
            FloatingActionButton(  // Your actual Fab
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const ShoppingList()));
              },
              child: const Icon(
                  Icons.shopping_cart_rounded
              ),
              backgroundColor: grey,
            ),
            Container(             // This is your Badge
              child: Center(
                child: Text(
                  ShoppingList.shopping.length.toString(),
                  style: TextStyle(color: white,
                  fontFamily: "poppins_bold"),
                ),
              ),
              padding: EdgeInsets.all(2),
              constraints: BoxConstraints(minHeight: 24, minWidth: 24),
              decoration: BoxDecoration( // This controls the shadow
                boxShadow: [
                  BoxShadow(
                      spreadRadius: 1,
                      blurRadius: 5,
                      color: black.withAlpha(50))
                ],
                borderRadius: BorderRadius.circular(16),
                color: green,  // This would be color of the Badge
              ),
            ),
          ],
        ),
      ),*/
        );
  }

  void showBottomSheet(String categoryId) {
    showModalBottomSheet<void>(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      builder: (BuildContext context) {
        return SizedBox(
          height: 192,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Kategoriyi silmek istediğinize emin misiniz?',
                style: TextStyle(
                    color: black, fontFamily: "poppins_medium", fontSize: 16),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    child: Container(
                      width: 148,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: red,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text('Evet',
                            style: TextStyle(
                              color: white,
                              fontFamily: "poppins_medium",
                            )),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        refresh = true;
                      });
                      print("Siliniyor");
                      Navigator.pop(context);
                      productControlList(categoryId);
                    },
                  ),
                  InkWell(
                    child: Container(
                      width: 148,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: grey,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text('Hayır',
                            style: TextStyle(
                              color: white,
                              fontFamily: "poppins_medium",
                            )),
                      ),
                    ),
                    onTap: () => Navigator.pop(context),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  void showBottomSheet2(String productId, int listIndex) {
    showModalBottomSheet<void>(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      builder: (BuildContext context) {
        return SizedBox(
          height: 192,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Ürünü silmek istediğinize emin misiniz?',
                style: TextStyle(
                    color: black, fontFamily: "poppins_medium", fontSize: 16),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    child: Container(
                      width: 148,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: red,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text('Evet',
                            style: TextStyle(
                              color: white,
                              fontFamily: "poppins_medium",
                            )),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        productDeleteMode[listIndex] = false;
                        refresh = true;
                      });
                      print("Siliniyor");
                      Navigator.pop(context);
                      productDelete(productId);
                    },
                  ),
                  InkWell(
                    child: Container(
                      width: 148,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: grey,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text('Hayır',
                            style: TextStyle(
                              color: white,
                              fontFamily: "poppins_medium",
                            )),
                      ),
                    ),
                    onTap: () => Navigator.pop(context),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  Widget foods(
      BuildContext context,
      String productName,
      String detail,
      String imageUrl,
      String price,
      String categoryName,
      int listIndex,
      String productId) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          GestureDetector(
            onLongPress: () {
              setState(() {
                productDeleteMode[listIndex] = true;
              });
            },
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FoodDetails(
                            productName: productName.toString(),
                            detail: detail.toString(),
                            price: price.toString(),
                            imageUrl: imageUrl.toString(),
                            categoryName: categoryName.toString(),
                          )));
            },
            child: AspectRatio(
              aspectRatio: 16 / 4,
              child: Container(
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: SizedBox(
                          height: 100,
                          child: FadeInImage(
                            image: NetworkImage(imageUrl),
                            placeholder: AssetImage("assets/images/duygu.jpg"),
                            imageErrorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                'assets/images/default.jpg',
                              );
                            },
                          ) /*Image.network(imageUrl)*/,
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 6,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Text(
                                    productName.toString(),
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontFamily: 'poppins_medium',
                                        color: grey),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Flexible(
                                  child: Text(
                                    "₺" + price.toString(),
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontFamily: 'poppins_bold',
                                        color: green),
                                  ),
                                )
                              ],
                            ),
                            Flexible(
                              child: Text(
                                detail.toString(),
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'poppins_medium',
                                    color: grey.withOpacity(0.6)),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                setState(() {
                  _updateAnimConPadding(listIndex);

                  int index = ShoppingList.shopping
                      .indexWhere((element) => element.name == productName);
                  ShoppingList.shopping
                          .where((element) => element.name == productName)
                          .isEmpty
                      ? ShoppingList.shopping.add(
                          Product(name: productName, price: price, piece: 1))
                      : {
                          ShoppingList.shopping.insert(
                              ShoppingList.shopping.indexWhere(
                                  (element) => element.name == productName),
                              Product(
                                  name: productName,
                                  price: price,
                                  piece: ShoppingList
                                          .shopping[ShoppingList.shopping
                                              .indexWhere((element) =>
                                                  element.name == productName)]
                                          .piece +
                                      1)),
                          ShoppingList.shopping.removeAt(index + 1)
                        };
                  Future.delayed(const Duration(milliseconds: 100), () {
                    _updateAnimConPadding2(listIndex);
                  });
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                height: 64,
                width: 64,
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.only(
                    bottom: animPadding.isEmpty ? 0 : animPadding[listIndex]),
                child: Icon(
                  Icons.add_box_rounded,
                  color: green,
                  size: 32,
                ),
              ),
            ),
          ),
          productDeleteMode.isEmpty
              ? const SizedBox()
              : productDeleteMode[listIndex] == true
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          productDeleteMode[listIndex] = false;
                        });
                      },
                      child: AspectRatio(
                        aspectRatio: 16 / 4,
                        child: Container(
                            decoration: BoxDecoration(
                              color: white.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            alignment: Alignment.center,
                            child: InkWell(
                              onTap: () {
                                showBottomSheet2(productId, listIndex);
                              },
                              child: Icon(
                                Icons.delete_forever,
                                size: 48,
                                color: red,
                              ),
                            )),
                      ),
                    )
                  : const SizedBox(),
        ],
      ),
    );
  }

  Future<void> _refresh() {
    setState(() {
      refresh = true;
    });
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => const BusinessPage(),
      ),
      (route) => false,
    );
    return Future.delayed(const Duration(seconds: 1), () {});
  }

  Future<void> categoryList() async {
    var categoryResponse = await http.get(
      Uri.parse(
          "https://crealsoft.com/api/category/getbusinesscategory?businessId=" +
              BusinessPage.id +
              "&apiKey=" +
              BusinessPage.token),
    );
    if (categoryResponse.statusCode == 200) {
      setState(() {
        category = jsonDecode(categoryResponse.body);
      });
      if (category.isNotEmpty) {
        productList(category[0]["id"].toString());
        var productCategoryResponse = await http.get(
          Uri.parse(
              "https://crealsoft.com/api/product/getcategoryproduct?categoryId=" +
                  category[0]["id"].toString() +
                  "&apiKey=" +
                  BusinessPage.token),
        );
        if (productCategoryResponse.statusCode == 200) {
          setState(() {
            product = jsonDecode(productCategoryResponse.body);
            refresh = false;

            print("LEN*-> " + product.length.toString());
            animPadding = List.filled(product.length, 0);
            productDeleteMode = List.filled(product.length, false);
          });
          if (product.isNotEmpty) {
            print("Response-> " + product[0]["product_name"].toString());
          }
        } else {
          print(
              'Request failed product with status: ${productCategoryResponse.statusCode}.');
        }
      }
      print("Response-> " + category[0]["image_url"].toString());
    } else {
      print(
          'Request failed category with status: ${categoryResponse.statusCode}.');
    }
  }

  Future<void> productList(String categoryId) async {
    var productCategoryResponse = await http.get(
      Uri.parse(
          "https://crealsoft.com/api/product/getcategoryproduct?categoryId=" +
              categoryId +
              "&apiKey=" +
              BusinessPage.token),
    );
    if (productCategoryResponse.statusCode == 200) {
      setState(() {
        product = jsonDecode(productCategoryResponse.body);
        refresh = false;
        print("LEN*-> " + product.length.toString());
      });
      if (product.isNotEmpty) {
        print("Response-> " + product[0]["product_name"].toString());
      }
    } else {
      print(
          'Request failed product with status: ${productCategoryResponse.statusCode}.');
    }
  }

  Future<void> productControlList(String categoryId) async {
    var productCategoryResponse = await http.get(
      Uri.parse(
          "https://crealsoft.com/api/product/getcategoryproduct?categoryId=" +
              categoryId +
              "&apiKey=" +
              BusinessPage.token),
    );
    if (productCategoryResponse.statusCode == 200) {
      setState(() {
        productControl = jsonDecode(productCategoryResponse.body);
        refresh = false;
        print("LEN*-> " + productControl.length.toString());
        if (productControl.length == 0) {
          print("deleting...");
          categoryDelete(categoryId);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: red,
              content: Text(
                'Bu kategoriye ait ürünler var. Silinemez',
                style: TextStyle(color: white, fontFamily: "poppins_light"),
              ),
            ),
          );
        }
      });
      if (product.isNotEmpty) {
        print("Response-> " + product[0]["product_name"].toString());
      }
    } else {
      print(
          'Request failed product with status: ${productCategoryResponse.statusCode}.');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: red,
          content: Text(
            'Kategori silinemedi',
            style: TextStyle(color: white, fontFamily: "poppins_light"),
          ),
        ),
      );
    }
  }

  Future<void> categoryDelete(String categoryId) async {
    print("Category ID>>> " + categoryId);
    var categoryDeleteResponse = await http.put(
      Uri.parse("https://crealsoft.com/api/category/putstatus?"
              "id=" +
          categoryId +
          "&status=Çöpte"
              "&apiKey=" +
          BusinessPage.token),
    );
    print("Stts-><>> " + categoryDeleteResponse.statusCode.toString());
    if (categoryDeleteResponse.statusCode == 200) {
      setState(() {
        refresh = false;
      });
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => const BusinessPage(),
        ),
        (route) => false,
      );
    } else {
      setState(() {
        refresh = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: red,
          content: Text(
            'Kategori silinemedi',
            style: TextStyle(color: white, fontFamily: "poppins_light"),
          ),
        ),
      );
    }
  }

  Future<void> productDelete(String productId) async {
    print("product ID>>> " + productId);
    var productDeleteResponse = await http.put(
      Uri.parse("https://crealsoft.com/api/product/putstatus?"
              "id=" +
          productId +
          "&status=Çöpte"
              "&apiKey=" +
          BusinessPage.token),
    );
    print("StatusCode-><>> " + productDeleteResponse.statusCode.toString());
    if (productDeleteResponse.statusCode == 200) {
      setState(() {
        refresh = false;
      });
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => const BusinessPage(),
        ),
        (route) => false,
      );
    } else {
      setState(() {
        refresh = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: red,
          content: Text(
            productDeleteResponse.body,
            style: TextStyle(color: white, fontFamily: "poppins_light"),
          ),
        ),
      );
    }
  }

  Future<void> businessList(String businessId) async {
    var businessResponse = await http.get(
      Uri.parse("https://crealsoft.com/api/business/getbusiness?businessId=" +
          businessId +
          "&apiKey=" +
          BusinessPage.token),
    );
    if (businessResponse.statusCode == 200) {
      setState(() {
        business = jsonDecode(businessResponse.body);
        refresh = false;
        print("LEN*-> " + business.length.toString());
      });
      if (business.isNotEmpty) {
        print("Response-> " + business[0]["business_name"].toString());
      }
    } else {
      print(
          'Request failed product with status: ${businessResponse.statusCode}.');
    }
  }

  Future<void> businessRatingList() async {
    var businessAvarageResponse = await http.get(
      Uri.parse(
          "https://crealsoft.com/api/businessrating/getavarage?businessId=" +
              BusinessPage.id +
              "&apiKey=" +
              BusinessPage.token),
    );
    if (businessAvarageResponse.statusCode == 200) {
      setState(() {
        if (businessAvarageResponse.body == "") {
          pointValue = "0";
        } else {
          pointValue = businessAvarageResponse.body.replaceAll("\"", "");
        }
        print("Response point-> " + businessAvarageResponse.body);
        refresh = false;
      });
    } else {
      print(
          'Request failed product with status: ${businessAvarageResponse.statusCode}.');
    }
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
    color: Colors.grey.withOpacity(0.3),
  );
}
