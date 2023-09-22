// ignore_for_file: sort_child_properties_last

import 'package:cached_network_image/cached_network_image.dart';
import 'package:eazyshop/core/models/product_model.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../utils/color.dart';
import '../../utils/font_size.dart';

class ProductCard extends StatefulWidget {
  final Product product;

  Function() onTapped;

  ProductCard({required this.product, required this.onTapped});
  @override
  ProductCardState createState() => ProductCardState();
}

class ProductCardState extends State<ProductCard> {
  var formatter = NumberFormat('#,###,000');
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: widget.onTapped,
        child: Container(
          margin: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width / 2.4,
          //height: MediaQuery.of(context).size.height / 3.6,

          child: Column(
            children: [
              Container(
                  width: MediaQuery.of(context).size.width / 2.5,
                  height: MediaQuery.of(context).size.height / 5.5,
                  child: ClipRRect(
                      // ignore: prefer_const_constructors
                      child: Image.asset(
                        "assets/indoor-shot-adorable-female-buyer-spending-her-free-time-boutique-standing-near-dummy-with-clothes-reading-news-online-while-using-free-internet-connection-shop-assistant-selling-clothes copy.jpg",
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(15)),
                  // ignore: prefer_const_constructors
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  )),
              Container(
                margin: EdgeInsets.only(top: 5),
                width: MediaQuery.of(context).size.width / 2.2,
                child: Row(
                  children: [
                    Container(
                        width: 100,
                        child: Text(
                          widget.product.productName!,
                          style: TextStyle(
                              color: ceoPurple,
                              fontWeight: FontWeight.w500,
                              fontSize: TextSize().custom(10, context)),
                        )),
                    Expanded(child: Container()),
                    Text(
                      formatter.format(widget.product.price),
                      style: TextStyle(
                          color: ceoPurpleGrey,
                          fontWeight: FontWeight.w500,
                          fontSize: TextSize().custom(10, context)),
                    ),
                  ],
                ),
              )
            ],
          ),
          decoration: BoxDecoration(
              color: ceoWhite, borderRadius: BorderRadius.circular(15)),
        ));
  }
}
