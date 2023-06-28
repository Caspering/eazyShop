// ignore_for_file: prefer_const_literals_to_create_immutables

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
      width: double.infinity,
      padding: EdgeInsets.all(10),
      color: ceoWhite,
      child: SingleChildScrollView(
          child: Container(
        // height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Our Products",
              style: TextStyle(
                  fontSize: TextSize().h1(context),
                  color: ceoPurple,
                  fontWeight: FontWeight.w600),
            ),
            Container(
              height: 5,
            ),
            Recommended(),
            CustomRow(category: "Electronics", header: "Tech Zone📱"),
            CustomRow(
                category: "Home and Office", header: "Living and Working🏢"),
            CustomRow(category: "Health and Beauty", header: "Glow Up")
          ],
        ),
      )),
    );
  }
}
