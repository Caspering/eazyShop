// ignore_for_file: prefer_const_constructors

import 'package:eazyshop/core/models/seller_model.dart';
import 'package:eazyshop/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/viewmodels/cart_viewmodel.dart';
import '../../core/viewmodels/product_viewmodel.dart';
import '../../core/viewmodels/seller_viewmodel.dart';

class SellerGrid extends StatefulWidget {
  const SellerGrid({super.key});

  @override
  State<SellerGrid> createState() => _SellerGridState();
}

class _SellerGridState extends State<SellerGrid> {
  @override
  Widget build(BuildContext context) {
    final sellerViewmodel = Provider.of<SellerViewmodel>(context);
    CartViewmodel _cartViewmodel = Provider.of<CartViewmodel>(context);
    final productViewmodel = Provider.of<ProductViewmodel>(context);
    return FutureBuilder<List<Seller>>(
      future: sellerViewmodel.getShops(),
      initialData: sellerViewmodel.shops,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.isNotEmpty) {
            List<Seller> sellers = snapshot.data!.take(7).toList();
            return Container(
              height: snapshot.data!.length < 5
                  ? MediaQuery.of(context).size.height / 6.5
                  : MediaQuery.of(context).size.height / 4.5,
              width: MediaQuery.of(context).size.width,
              //color: ceoBlack,
              padding: const EdgeInsets.all(5),
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: sellers.length + 1,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (context, index) {
                  if (index < 7) {
                    return Column(
                      children: [
                        Container(
                          height: 60,
                          width: 80,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/euekjcgbe0dvisaiaave.png')),
                              color: ceoWhite,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: greyOne!)),
                        ),
                        Text(sellers[index].name ?? "")
                      ],
                    );
                  } else {
                    return IconButton(
                        onPressed: () {}, icon: Icon(Icons.arrow_forward));
                  }
                },
              ),
            );
          } else {
            return Container();
          }
        } else {
          return Container();
        }
      },
    );
  }
}
