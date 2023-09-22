import 'package:eazyshop/ui/components/cart_icon.dart';
import 'package:eazyshop/ui/components/custom_grid_view.dart';
import 'package:eazyshop/ui/components/custom_listtile.dart';
import 'package:eazyshop/ui/views/cart_view.dart';
import 'package:eazyshop/ui/views/supercartview.dart';
import 'package:eazyshop/utils/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../core/models/seller_model.dart';
import '../../core/viewmodels/cart_viewmodel.dart';
import '../../core/viewmodels/product_viewmodel.dart';
import '../../core/viewmodels/seller_viewmodel.dart';
import 'package:provider/provider.dart';

import '../../utils/color.dart';
import '../../utils/font_size.dart';

class ShopCard extends StatefulWidget {
  final String? userId;
  const ShopCard({super.key, this.userId});

  @override
  State<ShopCard> createState() => _ShopCardState();
}

class _ShopCardState extends State<ShopCard> {
  @override
  Widget build(BuildContext context) {
    final sellerViewmodel = Provider.of<SellerViewmodel>(context);
    CartViewmodel _cartViewmodel = Provider.of<CartViewmodel>(context);
    final productViewmodel = Provider.of<ProductViewmodel>(context);
    return FutureBuilder<Seller>(
        future: sellerViewmodel.getCeoById(widget.userId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return GestureDetector(
                onTap: () {
                  _cartViewmodel.setCurrentVendor(widget.userId);
                  RouteController().push(
                      context,
                      CartScreen(
                        shopName: snapshot.data?.name ?? "",
                      ));
                },
                child: Container(
                  margin: EdgeInsets.all(10),
                  //  height: MediaQuery.of(context).size.height / 3.5,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5), color: ceoWhite),
                  child: Column(
                    children: [
                      CustomListTile(
                        title: Text(
                          snapshot.data?.name ?? "",
                          style: TextStyle(
                              fontSize: TextSize().h3(context),
                              fontWeight: FontWeight.w500,
                              color: ceoPurple),
                        ),
                        subtitle: Text(
                          "Personal cart(${_cartViewmodel.getCartItemCountForVendor(widget.userId ?? "")})",
                          style: TextStyle(
                              fontSize: TextSize().p(context),
                              fontWeight: FontWeight.w500,
                              color: ceoPurpleGrey),
                        ),
                        leading: Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/euekjcgbe0dvisaiaave.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ));
          } else {
            return Container();
          }
        });
  }
}
