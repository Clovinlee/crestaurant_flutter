import 'package:cflutter4/component/cart_slidable.dart';
import 'package:cflutter4/controllers/CartController.dart';
import 'package:cflutter4/data.dart';
import 'package:cflutter4/models/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:cflutter4/constants.dart';
import 'package:get/get.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    CartController controller = Get.find();
    return Container(
      color: AppConstant.black1,
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
      child: ListView(
        children: [
          Text(
            "Your Food's Cart",
            style: Theme.of(context).textTheme.headline2,
          ),
          const SizedBox(height: 20),
          LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return FutureBuilder(
                future: controller.getCart(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    List listCart = snapshot.data;
                    return ListView.separated(
                        shrinkWrap: true,
                        itemCount: listCart.length,
                        separatorBuilder: (ctx, idx) {
                          return const SizedBox(height: 15);
                        },
                        itemBuilder: (ctx, idx) {
                          return CartSlidable(
                            cart: Cart.fromJson(listCart[idx]),
                          );
                        });
                  }
                  return Text("Wait");
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
