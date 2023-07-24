// ignore_for_file: prefer_const_constructors

import 'package:eazyshop/utils/categories.dart';
import 'package:eazyshop/utils/color.dart';
import 'package:eazyshop/utils/font_size.dart';
import 'package:eazyshop/utils/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/services/authentication.dart';
import '../../core/viewmodels/cart_viewmodel.dart';
import '../../core/viewmodels/product_viewmodel.dart';
import '../../core/viewmodels/seller_viewmodel.dart';
import '../../core/viewmodels/user_viewmodel.dart';

class CurrentShopDrawer extends StatefulWidget {
  const CurrentShopDrawer({super.key});

  @override
  State<CurrentShopDrawer> createState() => _CurrentShopDrawerState();
}

class _CurrentShopDrawerState extends State<CurrentShopDrawer> {
  @override
  Widget build(BuildContext context) {
    final userViewModel = Provider.of<UserViewmodel>(context);
    final productViewmodel = Provider.of<ProductViewmodel>(context);
    final sellerViewmodel = Provider.of<SellerViewmodel>(context);
    final _cartViewmodel = Provider.of<CartViewmodel>(context);
    return SafeArea(
        child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width / 2,
            alignment: Alignment.center,
            padding: EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    onTap: () {
                      RouteController().pop(context);
                    },
                    leading: Icon(
                      Icons.arrow_back,
                      color: ceoBlack,
                    ),
                    title: Text(
                      "All stores",
                      style: TextStyle(
                          fontSize: TextSize().p(context),
                          color: ceoBlack,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Divider(
                    color: grey,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    sellerViewmodel.currentSeller?.name ?? "",
                    style: TextStyle(
                        fontSize: TextSize().h2(context),
                        color: ceoBlack,
                        fontWeight: FontWeight.w600),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      "View privacy policy",
                      style: TextStyle(
                          fontSize: TextSize().p(context),
                          color: grey,
                          fontWeight: FontWeight.w500),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: TextSize().small(context),
                      color: grey,
                    ),
                  ),
                  Divider(
                    color: grey,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(
                      Icons.store,
                      color: ceoBlack,
                    ),
                    title: Text(
                      "Shop",
                      style: TextStyle(
                          fontSize: TextSize().p(context),
                          color: ceoBlack,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(
                      Icons.label,
                      color: ceoBlack,
                    ),
                    title: Text(
                      "Deals",
                      style: TextStyle(
                          fontSize: TextSize().p(context),
                          color: ceoBlack,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  for (int i = 0; i < categories.length; i++)
                    Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Text(
                          categories[i],
                          style: TextStyle(
                              fontSize: TextSize().p(context),
                              color: ceoBlack,
                              fontWeight: FontWeight.w500),
                        )),
                ],
              ),
            )));
  }
}
