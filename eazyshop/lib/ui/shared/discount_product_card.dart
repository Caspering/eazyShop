// ignore_for_file: prefer_const_constructors_in_immutables, sort_child_properties_last

import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../utils/color.dart';
import '../../utils/font_size.dart';

class FlashProductCard extends StatefulWidget {
  final int? discountPrice;
  final double? discountPercentage;
  final int? price;
  final String? productName;
  final String? url;
  Function()? onTap;

  FlashProductCard(
      {this.discountPercentage,
      this.discountPrice,
      this.price,
      this.productName,
      required this.onTap,
      this.url});
  @override
  FlashProductCardState createState() => FlashProductCardState();
}

class FlashProductCardState extends State<FlashProductCard> {
  var formatter = NumberFormat('#,###,000');
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: widget.onTap,
        child: Container(
          margin: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width / 2.4,
          //height: MediaQuery.of(context).size.height / 3.6,
          // ignore: sort_child_properties_last
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width / 2.2,
                      height: MediaQuery.of(context).size.height / 3.6,
                      // ignore: sort_child_properties_last
                      child: ClipRRect(
                          // ignore: prefer_const_constructors
                          child: CachedNetworkImage(
                            imageUrl: widget.url!,
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(15)),
                      // ignore: prefer_const_constructors
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      )),
                  Container(
                      width: MediaQuery.of(context).size.width / 2.2,
                      height: MediaQuery.of(context).size.height / 3.6,
                      child: ClipRect(
                        child: Banner(
                            color: ceoPink,
                            message:
                                "${widget.discountPercentage?.ceilToDouble()}% off",
                            location: BannerLocation.topStart),
                      ))
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 5),
                width: MediaQuery.of(context).size.width / 2.2,
                child: Row(
                  children: [
                    Container(
                        width: 100,
                        child: Text(
                          widget.productName!,
                          style: TextStyle(
                              color: ceoPurple,
                              fontWeight: FontWeight.w500,
                              fontSize: TextSize().custom(10, context)),
                        )),
                    Expanded(child: Container()),
                    Text(
                      formatter.format(widget.discountPrice),
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
