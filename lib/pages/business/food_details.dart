import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:siparischi/decoration/colors.dart';

class FoodDetails extends StatefulWidget {  const FoodDetails(
      {Key? key,
      required this.imageUrl,
      required this.productName,
      required this.detail,
      required this.price,
      required this.categoryName})
      : super(key: key);

  final String imageUrl, productName, detail, price, categoryName;

  @override
  State<FoodDetails> createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              widget.productName,
              style: const TextStyle(
                fontFamily: 'poppins_medium',
              ),
            ),
            backgroundColor: green,
            centerTitle: true,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.4,
                      child: Image.network(
                        widget.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: EdgeInsets.all(
                        MediaQuery.of(context).size.width * 0.03,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.productName,
                                style: TextStyle(
                                    fontFamily: 'poppins_medium',
                                    fontSize: 20,
                                    color: black),
                              ),
                              Text(
                                "₺" + widget.price,
                                style: TextStyle(
                                    fontFamily: 'poppins_bold',
                                    fontSize: 20,
                                    color: green),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              widget.detail,
                              style: TextStyle(
                                  fontFamily: 'poppins_medium',
                                  fontSize: 14,
                                  color: grey),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Kategori",
                                style: TextStyle(
                                    fontFamily: 'poppins_medium',
                                    fontSize: 14,
                                    color: grey),
                              ),
                              Text(
                                widget.categoryName,
                                style: TextStyle(
                                    fontFamily: 'poppins_medium',
                                    fontSize: 14,
                                    color: grey),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),

                          /*Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Porsiyon",
                                    style: TextStyle(
                                        fontFamily: 'poppins_medium',
                                        fontSize: 14,
                                        color: grey),
                                  ),
                                  Text(
                                    "1",
                                    style: TextStyle(
                                        fontFamily: 'poppins_medium',
                                        fontSize: 14,
                                        color: grey),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height * 0.01,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Adet",
                                    style: TextStyle(
                                        fontFamily: 'poppins_medium',
                                        fontSize: 14,
                                        color: grey),
                                  ),
                                  Text(
                                    "1",
                                    style: TextStyle(
                                        fontFamily: 'poppins_medium',
                                        fontSize: 14,
                                        color: grey),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height * 0.01,
                              ),*/
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.55,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(green),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
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
                                Icons.shopping_basket,
                                color: white,
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Text(
                                "Sepete Ekle",
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
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                minus();
                              },
                              child: ClipOval(
                                child: Container(
                                  width: 32,
                                  height: 32,
                                  color: grey,
                                  child: Icon(
                                    Icons.remove,
                                    size: 24,
                                    color: white,
                                  ),
                                ),
                              ),
                            ),
                            Text(count.toString(),
                                style: TextStyle(
                                  color: black,
                                  fontSize: 24,
                                )),
                            InkWell(
                              onTap: () {
                                add();
                              },
                              child: ClipOval(
                                child: Container(
                                  width: 32,
                                  height: 32,
                                  color: green,
                                  child: Icon(
                                    Icons.add,
                                    size: 24,
                                    color: white,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  minus() {
    setState(() {
      if (count > 1) {
        count--;
      }
    });
  }

  add() {
    setState(() {
      if (count < 10) {
        count++;
      }
    });
  }
}
