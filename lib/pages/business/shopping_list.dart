import 'package:flutter/material.dart';
import 'package:siparischi/decoration/colors.dart';
import 'package:siparischi/pages/business/profile_page.dart';
import 'package:siparischi/pages/business/business_page.dart';

class ShoppingList extends StatefulWidget {
  const ShoppingList({Key? key}) : super(key: key);
  static List<Product> shopping = [];
  @override
  State<ShoppingList> createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {

  var commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) =>
            const BusinessPage(),
          ),
              (route) => false,
        );
        return false;
      },
      child: SafeArea(
          child: Scaffold(
            backgroundColor: white,
        appBar: AppBar(
          title: const Text(
            "Sepetim",
            style: TextStyle(
              fontFamily: 'poppins_medium',),
          ),
          backgroundColor: grey,
          centerTitle: true,
        ),
        body: ShoppingList.shopping.length > 0 ? Column(
          children: [
            Flexible(
              child: ListView.builder(
                itemCount: ShoppingList.shopping.length,
                itemBuilder:(context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(12)
                        ),
                        boxShadow:[
                          BoxShadow(
                              color: green.withOpacity(0.3),
                              offset: const Offset(0, 4),
                              blurRadius: 16),
                        ]
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  ShoppingList.shopping[index].name,
                                  style: TextStyle(
                                      color: black,
                                      fontSize: 18,
                                      fontFamily: "poppins_medium"
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  "₺" + (double.parse(ShoppingList.shopping[index].price.toString()) * double.parse(ShoppingList.shopping[index].piece.toString())).toString(),
                                  style: TextStyle(
                                      color: green,
                                      fontSize: 18,
                                      fontFamily: "poppins_medium"
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      if(ShoppingList.shopping[index].piece == 1){
                                        print("sfsf -> " + ShoppingList.shopping.length.toString());
                                        ShoppingList.shopping.removeAt(index);
                                        print("sfsf -> " + ShoppingList.shopping.length.toString());
                                      }else{
                                        ShoppingList.shopping[index].piece = minus(ShoppingList.shopping[index].piece);
                                      }
                                    });
                                  },
                                  child: Container(
                                    width: 32,
                                    height: 32,
                                    decoration: BoxDecoration(
                                      color: grey,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(8),
                                        bottomLeft: Radius.circular(8)
                                      )
                                    ),
                                    child: Icon(
                                      ShoppingList.shopping[index].piece <= 1 ? Icons.delete : Icons.remove,
                                      size: 20,
                                      color: white,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 32,
                                  height: 32,
                                  decoration: BoxDecoration(
                                    border: Border.symmetric(
                                      horizontal: BorderSide(width: 2,
                                      color: green)
                                    )
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                      ShoppingList.shopping[index].piece.toString(), style: TextStyle(
                                    color: black,
                                    fontSize: 20,
                                  )),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      ShoppingList.shopping[index].piece = add(ShoppingList.shopping[index].piece);
                                    });
                                  },
                                  child: Container(
                                    width: 32,
                                    height: 32,
                                    decoration: BoxDecoration(
                                        color: green,
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(8),
                                            bottomRight: Radius.circular(8)
                                        )
                                    ),
                                    child: Icon(
                                      Icons.add,
                                      size: 20,
                                      color: white,
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );

                },),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Eklemek istediğiniz bir not varsa:",
                    style: TextStyle(
                      color: grey,
                      fontFamily: "poppins_light",
                      fontSize: 16
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: commentController,
                    style: const TextStyle(
                        color: Colors.black, fontFamily: "poppins_light"),
                    decoration: InputDecoration(
                      hintText: "Not ekleyin",
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
                      suffixIcon: Icon(Icons.note_add_rounded, color: grey,
                      size: 32,),
                    ),
                    maxLength: 50,
                    maxLines: 2,
                    keyboardType: TextInputType.text,
                    cursorColor: black,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {

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
                        Icons.shopping_basket,
                        color: white,
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Text(
                        "Siparişi Oluştur",
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
          ],
        )
            : Center(
              child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              RotationTransition(
                turns: const AlwaysStoppedAnimation(340 / 360),
                child: Icon(
                  Icons.shopping_bag_rounded,
                color: green,
                size: 96,
                ),
              ),
            SizedBox(
              height: 24,
            ),
            Text(
              "Sepetiniz şu an boş",
              style: TextStyle(
                color: grey,
                fontFamily: "poppins_medium",
                fontSize: 24
              ),
            ),
            const SizedBox(
              height: 192,
            )
          ],
        ),
            ),
      )
      ),
    );
  }

  int minus(int count) {
    setState(() {
      if(count > 0) {
        count--;
      }
    });
    return count;
  }
  int add(int count) {
    setState(() {
      if(count < 10) {
        count++;
      }
    });
    return count;
  }
}
