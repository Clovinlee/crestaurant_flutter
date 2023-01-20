import 'package:cflutter4/component/gallerty_photoview.dart';
import 'package:cflutter4/constants.dart';
import 'package:cflutter4/controllers/CartController.dart';
import 'package:cflutter4/data.dart';
import 'package:cflutter4/models/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:readmore/readmore.dart';

import 'package:cflutter4/models/food_model.dart';

class DetailFood extends StatefulWidget {
  const DetailFood({
    Key? key,
    required this.food,
  }) : super(key: key);

  final Food food;

  @override
  State<DetailFood> createState() => _DetailFoodState();
}

class _DetailFoodState extends State<DetailFood> {
  bool isReadMore = false;
  TextStyle morelessStyle =
      TextStyle(fontWeight: FontWeight.bold, color: AppConstant.lightOrange);
  final double detailPhotoSize = 80;

  double priceNow = 0;
  TextEditingController qtyNow = TextEditingController();
  CartController cc = Get.find();

  @override
  void initState() {
    super.initState();
    priceNow = widget.food.price;
    qtyNow.text = "1";
  }

  double calcPrice() {
    int qty = 1;
    try {
      qty = int.parse(qtyNow.text);
    } catch (e) {
      qtyNow.text = "1";
    }
    return priceNow * qty;
  }

  @override
  Widget build(BuildContext context) {
    double imgHeight = 160;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.grey.shade400),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: AppConstant.black1,
        elevation: 0,
      ),
      backgroundColor: AppConstant.black1,
      body: DefaultTextStyle(
        style: const TextStyle(color: Colors.white),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: DefaultTextStyle(
            style: const TextStyle(fontFamily: "Montserrat"),
            child: Column(
              children: [
                Text(
                  widget.food.title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headline1
                      ?.copyWith(fontWeight: FontWeight.w500, fontSize: 30),
                ),
                const SizedBox(height: 10),
                Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        bottom: 20,
                      ),
                      margin: EdgeInsets.only(top: imgHeight / 3),
                      decoration: BoxDecoration(
                          color: AppConstant.black3,
                          borderRadius: BorderRadius.circular(25)),
                      child: Column(
                        children: [
                          const SizedBox(height: 10),
                          SizedBox(
                            height: imgHeight / 1.5,
                            width: double.infinity,
                            child: IconButton(
                                alignment: Alignment.topRight,
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              "${widget.food.title} successfully added to favorite!")));
                                },
                                icon: Icon(
                                  Icons.bookmark_add_outlined,
                                  color: AppConstant.lightOrange,
                                  size: 25,
                                )),
                          ),
                          ReadMoreText(
                            widget.food.description,
                            style: const TextStyle(
                                height: 1.4, fontWeight: FontWeight.w300),
                            trimLines: 3,
                            trimMode: TrimMode.Line,
                            trimCollapsedText: "Read More",
                            trimExpandedText: "Read Less",
                            moreStyle: morelessStyle,
                            lessStyle: morelessStyle,
                          ),
                          const SizedBox(height: 20),
                          generateThumbnail(imgHeight),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: imgHeight,
                      child: GalleryExampleItemThumbnail(
                        onTap: () {
                          open(context, 0, widget.food.image,
                              [widget.food.image]);
                        },
                        tag: widget.food.image,
                        image: widget.food.image,
                        imgHeight: imgHeight,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 15),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Tags",
                    style: Theme.of(context)
                        .textTheme
                        .headline2
                        ?.copyWith(fontWeight: FontWeight.w400),
                  ),
                ),
                const SizedBox(height: 10),
                generateCategories(),
                const SizedBox(height: 30),
                SizedBox(
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ModifierButton(
                        txt: "-",
                        btnSize: 40,
                        func: () {
                          setState(() {
                            try {
                              int.parse(qtyNow.text);
                            } catch (e) {
                              qtyNow.text = "1";
                            }
                            qtyNow.text = int.parse(qtyNow.text) - 1 <= 0
                                ? qtyNow.text
                                : (int.parse(qtyNow.text) - 1).toString();
                          });
                        },
                        bgColor: Colors.white,
                        txtColor: AppConstant.lightOrange,
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 40,
                        margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          textAlignVertical: TextAlignVertical.center,
                          keyboardType: TextInputType.number,
                          maxLines: 1,
                          maxLength: 2,
                          controller: qtyNow,
                          cursorColor: Colors.white,
                          onChanged: (val) {
                            setState(() {});
                          },
                          style: const TextStyle(
                              color: Colors.white, fontSize: 20),
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            counterText: "",
                          ),
                        ),
                      ),
                      ModifierButton(
                        txt: "+",
                        btnSize: 40,
                        func: () {
                          setState(() {
                            try {
                              qtyNow.text =
                                  (int.parse(qtyNow.text) + 1).toString();
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
                const SizedBox(height: 20),
                Text(
                  "Rp${NumberFormat('#,###,000').format(calcPrice())}",
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // cart.add({
                      //   "food_id": widget.food.id,
                      //   "qty": int.parse(qtyNow.text),
                      //   "price": widget.food.price,
                      //   "subtotal": priceNow,
                      // });

                      cc.store(Cart.fromJson({
                        "food_id": '${widget.food.id}',
                        "qty": '${qtyNow.text}',
                        "subtotal": "${calcPrice()}"
                      }));
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                              "${qtyNow.text} ${widget.food.title}${qtyNow.text == "1" ? "" : "'s"} successfully added to cart!")));
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      primary: AppConstant.lightOrange,
                    ),
                    child: const Text(
                      "Order",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox generateCategories() {
    return SizedBox(
      height: 30,
      child: CustomScrollView(
        scrollDirection: Axis.horizontal,
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate((context, idx) {
              return Container(
                margin: EdgeInsets.only(right: idx == 12 - 1 ? 0 : 10),
                child: Chip(
                    backgroundColor: Colors.white54,
                    label: Row(
                      children: [
                        Text(
                          widget.food.category[idx]["category"]["title"],
                          style: TextStyle(
                              color: AppConstant.black3,
                              fontWeight: FontWeight.w600),
                        ),
                        const Icon(Icons.emoji_food_beverage_outlined)
                      ],
                    )),
              );
            }, childCount: widget.food.category.length),
          ),
        ],
      ),
    );
  }

  SizedBox generateThumbnail(double imgHeight) {
    return SizedBox(
      height: imgHeight / 2,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          shrinkWrap: true,
          itemBuilder: (ctx, idx) {
            String tag = widget.food.image + idx.toString();
            return GalleryExampleItemThumbnail(
              onTap: () {
                open(
                  ctx,
                  idx,
                  tag,
                  (widget.food.imageThumbnail as List<String>),
                );
              },
              tag: tag,
              image: widget.food.imageThumbnail[idx].toString(),
              imgHeight: imgHeight,
            );
          },
          separatorBuilder: (ctx, idx) {
            return const SizedBox(
              width: 10,
            );
          },
          itemCount: (widget.food.imageThumbnail as List<String>).length),
    );
  }
}
