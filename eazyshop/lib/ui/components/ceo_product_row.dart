// ignore_for_file: prefer_is_empty

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/models/product_model.dart';
import '../../core/services/authentication.dart';
import '../../core/viewmodels/product_viewmodel.dart';
import '../../core/viewmodels/user_viewmodel.dart';
import '../../utils/color.dart';
import '../../utils/font_size.dart';
import '../../utils/router.dart';
import '../shared/product_card.dart';
import '../views/product_details.dart';
import 'custom_grid_view.dart';

class CeoProducts extends StatefulWidget {
  const CeoProducts({Key? key}) : super(key: key);

  @override
  State<CeoProducts> createState() => _CeoProductsState();
}

class _CeoProductsState extends State<CeoProducts> {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthenticationService>(context);
    final userViewModel = Provider.of<UserViewmodel>(context);
    final productViewmodel = Provider.of<ProductViewmodel>(context);
    return Container(
      margin: EdgeInsets.only(top: 7),
      child: FutureBuilder<List<Product>>(
        //  future:
        //    productViewmodel.getCeoProducts(productViewmodel.product?.sellerId),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data?.length != 0) {
            return Container(
                // margin: EdgeInsets.only(top: 10, left: 11),
                width: double.infinity,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(right: 0),
                        child: Row(
                          children: [
                            Text(
                              "More from this store",
                              style: TextStyle(
                                  color: ceoPurple,
                                  fontSize: TextSize().h3(context),
                                  fontWeight: FontWeight.w600),
                            ),
                            Expanded(child: Container()),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.arrow_forward,
                                  color: ceoPurpleGrey,
                                  size: TextSize().custom(15, context),
                                ))
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: snapshot.data?.map((item) {
                                return ProductCard(
                                  onTapped: () {},
                                  product: item,
                                );
                              }).toList() ??
                              [],
                        ),
                      )
                    ]));
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            print(snapshot.error);
            return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width / 2.4,
                      height: MediaQuery.of(context).size.height / 3.6,
                      decoration: BoxDecoration(
                          color: greyOne,
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width / 2.4,
                      height: MediaQuery.of(context).size.height / 3.6,
                      decoration: BoxDecoration(
                          color: greyOne,
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width / 2.4,
                      height: MediaQuery.of(context).size.height / 3.6,
                      decoration: BoxDecoration(
                          color: greyOne,
                          borderRadius: BorderRadius.circular(15)),
                    )
                  ],
                ));
          } else {
            print(snapshot.error);
            return Container(
              height: 0,
            );
          }
        },
      ),
    );
  }
}
