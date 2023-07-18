// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:eazyshop/ui/components/random_categories_grid.dart';
import 'package:eazyshop/ui/components/seller_grid.dart';
import 'package:eazyshop/ui/components/shops_list_view.dart';
import 'package:eazyshop/utils/font_size.dart';
import 'package:flutter/material.dart';

import '../../utils/color.dart';
import '../components/flash_sale_row.dart';
import '../components/custom_row.dart';
import '../components/recommended_row.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      color: ceoWhite,
      child: ListView(
        children: [SellerGrid(), RandomCatGrid(), ShopList()],
      ),
    );
  }
}
