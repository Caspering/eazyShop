// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:eazyshop/utils/categories.dart';
import 'package:eazyshop/utils/color.dart';
import 'package:eazyshop/utils/font_size.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/services/authentication.dart';
import '../../core/viewmodels/product_viewmodel.dart';
import '../../core/viewmodels/seller_viewmodel.dart';
import '../../core/viewmodels/user_viewmodel.dart';

class RandomCatGrid extends StatefulWidget {
  const RandomCatGrid({super.key});

  @override
  State<RandomCatGrid> createState() => _RandomCatGridState();
}

class _RandomCatGridState extends State<RandomCatGrid> {
  List<String> newCats = [];
  @override
  void initState() {
    setState(() {
      categories.shuffle();
      newCats = categories.take(6).toList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthenticationService>(context);
    final userViewModel = Provider.of<UserViewmodel>(context);
    final productViewmodel = Provider.of<ProductViewmodel>(context);
    final sellerViewmodel = Provider.of<SellerViewmodel>(context);
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: newCats.length,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) {
        return GestureDetector(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height / 6,
              width: MediaQuery.of(context).size.width / 2,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: greyOne),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    newCats[index],
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: ceoPurple,
                        fontSize: TextSize().h3(context)),
                  ),
                  Text(
                    "By 3:30am",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: ceoPurple,
                        fontSize: TextSize().small(context)),
                  ),
                  Text(
                    "Free delivery on N100",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: grey,
                        fontSize: TextSize().custom(9, context)),
                  ),
                  Expanded(child: Container()),
                  Container(
                    height: 60,
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          top: 0,
                          left: 0,
                          child: CircleAvatar(
                            // radius: 50,
                            backgroundColor: Colors.red,
                            backgroundImage:
                                AssetImage('assets/euekjcgbe0dvisaiaave.png'),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          left: 35,
                          child: CircleAvatar(
                            // radius: 50,
                            backgroundColor: Colors.green,
                            backgroundImage: AssetImage(
                              'assets/wallmart.png',
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          left: 70,
                          child: CircleAvatar(
                            //    radius: 50,
                            backgroundColor: Colors.blue,

                            backgroundImage: AssetImage(
                              'assets/images.png',
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ));
      },
    );
  }
}
