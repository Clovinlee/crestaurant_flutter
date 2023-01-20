import 'package:cflutter4/component/gallerty_photoview.dart';
import 'package:cflutter4/constants.dart';
import 'package:cflutter4/controllers/CartController.dart';
import 'package:cflutter4/controllers/FoodController.dart';
import 'package:cflutter4/models/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../models/food_model.dart';

class CartSlidable extends StatefulWidget {
  const CartSlidable({
    Key? key,
    required this.cart,
  }) : super(key: key);

  final Cart cart;
  @override
  State<CartSlidable> createState() => _CartSlidableState();
}

class _CartSlidableState extends State<CartSlidable> {
  late Food food;

  TextEditingController qtyNow = TextEditingController();
  FoodController fc = Get.find();
  CartController cc = Get.find();

  @override
  void initState() {
    super.initState();

    qtyNow.text = widget.cart.qty.toString();
  }

  double calcCartPrice() {
    int qty = 1;
    try {
      qty = int.parse(qtyNow.text);
    } catch (e) {
      qtyNow.text = "1";
    }
    return widget.cart.subtotal * qty;
  }

  @override
  Widget build(BuildContext context) {
    void dismissEvent() {}
    print(widget.cart.subtotal);
    return FutureBuilder(
      future: fc.getFood(id: widget.cart.foodId),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          food = Food.fromJson(snapshot.data[0]);
          return Slidable(
            key: Key(widget.cart.id.toString()),
            endActionPane: ActionPane(
              dismissible: DismissiblePane(onDismissed: dismissEvent),
              extentRatio: 0.25,
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                  autoClose: false,
                  spacing: 4,
                  onPressed: (context) {
                    final controller = Slidable.of(context);
                    controller?.dismiss(
                      ResizeRequest(
                          const Duration(milliseconds: 300), dismissEvent),
                    );
                  },
                  backgroundColor: const Color(0xFFFE4A49),
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  label: 'Delete',
                ),
              ],
            ),

            // The child of the Slidable is what the user sees when the
            // component is not dragged.
            child: SizedBox(
              width: double.infinity,
              child: Card(
                color: AppConstant.black3,
                shape: const RoundedRectangleBorder(),
                margin: EdgeInsets.zero,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DefaultTextStyle(
                    style: const TextStyle(
                        color: Colors.white, fontFamily: "Montserrat"),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 80,
                          width: 80,
                          child: Image.asset(
                            "assets/images/${food.image}",
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                food.title,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Rp${NumberFormat('#,###,000').format(widget.cart.subtotal)}",
                                        style:
                                            const TextStyle(color: Colors.grey),
                                      ),
                                      const SizedBox(height: 10),
                                      SizedBox(
                                        height: 30,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            ModifierButton(
                                              txt: "-",
                                              btnSize: 30,
                                              func: () {
                                                setState(() {
                                                  try {
                                                    int.parse(qtyNow.text);
                                                  } catch (e) {
                                                    qtyNow.text = "1";
                                                  }
                                                  qtyNow.text = int.parse(
                                                                  qtyNow.text) -
                                                              1 <=
                                                          0
                                                      ? qtyNow.text
                                                      : (int.parse(
                                                                  qtyNow.text) -
                                                              1)
                                                          .toString();
                                                });
                                              },
                                              bgColor: Colors.white,
                                              txtColor: AppConstant.lightOrange,
                                            ),
                                            Container(
                                              alignment: Alignment.center,
                                              width: 40,
                                              margin: const EdgeInsets.fromLTRB(
                                                  10, 0, 10, 0),
                                              child: Focus(
                                                onFocusChange: (hasFocus) {
                                                  setState(() {
                                                    if (qtyNow.text == "") {
                                                      qtyNow.text = "1";
                                                    }
                                                  });
                                                },
                                                child: TextFormField(
                                                  textAlign: TextAlign.center,
                                                  textAlignVertical:
                                                      TextAlignVertical.center,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  maxLines: 1,
                                                  maxLength: 2,
                                                  controller: qtyNow,
                                                  //On keyboard close??
                                                  cursorColor: Colors.white,
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20),
                                                  decoration:
                                                      const InputDecoration(
                                                    border: UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color:
                                                                Colors.white)),
                                                    focusedBorder:
                                                        UnderlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                                    color: Colors
                                                                        .white)),
                                                    counterText: "",
                                                  ),
                                                ),
                                              ),
                                            ),
                                            ModifierButton(
                                              txt: "+",
                                              btnSize: 30,
                                              func: () {
                                                setState(() {
                                                  try {
                                                    qtyNow.text = (int.parse(
                                                                qtyNow.text) +
                                                            1)
                                                        .toString();
                                                  } catch (e) {
                                                    qtyNow.text = "1";
                                                  }
                                                });
                                              },
                                              bgColor: AppConstant.lightOrange,
                                              txtColor: Colors.white,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "Rp${NumberFormat('#,###,000').format(calcCartPrice())}",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 17,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }
        return Text("Wait");
      },
    );
  }
}
