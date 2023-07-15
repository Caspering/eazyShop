import 'package:eazyshop/core/models/seller_model.dart';
import 'package:eazyshop/core/viewmodels/seller_viewmodel.dart';
import 'package:eazyshop/ui/components/custom_listtile.dart';
import 'package:eazyshop/ui/components/empty_screen.dart';
import 'package:eazyshop/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/viewmodels/product_viewmodel.dart';
import '../../utils/font_size.dart';
import '../../utils/router.dart';
import '../views/supercartview.dart';
import 'cart_icon.dart';
import 'custom_grid_view.dart';

class ShopList extends StatefulWidget {
  const ShopList({super.key});

  @override
  State<ShopList> createState() => _ShopListState();
}

class _ShopListState extends State<ShopList> {
  @override
  Widget build(BuildContext context) {
    SellerViewmodel _sellerViewmodel = Provider.of<SellerViewmodel>(context);
    final productViewmodel = Provider.of<ProductViewmodel>(context);
    return FutureBuilder<List<Seller>>(
        future: _sellerViewmodel.getShops(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: ceoPink,
              ),
            );
          } else if (snapshot.hasData) {
            if (snapshot.data!.isEmpty) {
              return Empty();
            } else {
              return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    return Container(
                        margin: EdgeInsets.all(10),
                        child: CustomListTile(
                          onTap: () {
                            RouteController().push(
                                context,
                                CustomGridView(
                                  gridCategory: snapshot.data?[index].name,
                                  action: CartIcon(
                                    onPressed: () {
                                      RouteController()
                                          .push(context, SuperCartScreen());
                                    },
                                  ),
                                  categoryProducts: productViewmodel
                                      .getCeoProducts(snapshot.data?[index].id),
                                ));
                          },
                          title: Text(
                            snapshot.data?[index].name ?? "",
                            style: TextStyle(
                                fontSize: TextSize().h3(context),
                                fontWeight: FontWeight.w500,
                                color: ceoPurple),
                          ),
                          subtitle: Text(
                            "Deliveries by 11pm today",
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
                        ));
                  });
            }
          } else {
            return Container();
          }
        });
  }
}
