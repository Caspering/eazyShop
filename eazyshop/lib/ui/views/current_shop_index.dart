// ignore_for_file: prefer_const_constructors

import 'package:eazyshop/core/viewmodels/cart_viewmodel.dart';
import 'package:eazyshop/ui/components/current_shop_drawer.dart';
import 'package:eazyshop/ui/components/current_store_cart_icon.dart';
import 'package:eazyshop/ui/components/custom_grid_view.dart';
import 'package:eazyshop/ui/views/cart_view.dart';
import 'package:eazyshop/ui/views/current_store_feed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:provider/provider.dart';
import '../../core/services/authentication.dart';
import '../../core/viewmodels/product_viewmodel.dart';
import '../../core/viewmodels/seller_viewmodel.dart';
import '../../core/viewmodels/store_baseviewmodel.dart';
import '../../core/viewmodels/user_viewmodel.dart';
import '../../utils/color.dart';
import '../../utils/font_size.dart';
import '../../utils/router.dart';
import '../components/cart_icon.dart';
import 'supercartview.dart';

class CurrentShopIndex extends StatefulWidget {
  const CurrentShopIndex({super.key});

  @override
  State<CurrentShopIndex> createState() => _CurrentShopIndexState();
}

class _CurrentShopIndexState extends State<CurrentShopIndex> {
  final _advancedDrawerController = AdvancedDrawerController();
  bool? isDrawer;

  @override
  Widget build(BuildContext context) {
//final authService = Provider.of<AuthenticationService>(context);
    //   final authService = Provider.of<AuthenticationService>(context);
    final storeViewmodel = Provider.of<StoreBaseViewmodel>(context);
    final userViewModel = Provider.of<UserViewmodel>(context);
    final productViewmodel = Provider.of<ProductViewmodel>(context);
    final sellerViewmodel = Provider.of<SellerViewmodel>(context);
    final _cartViewmodel = Provider.of<CartViewmodel>(context);
    return AdvancedDrawer(
        backdrop: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(color: greyOne),
        ),
        controller: _advancedDrawerController,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 250),
        animateChildDecoration: true,
        rtlOpening: false,
        openRatio: 0.5,
        // openScale: 1.0,
        disabledGestures: false,
        childDecoration: const BoxDecoration(
          // NOTICE: Uncomment if you want to add shadow behind the page.
          // Keep in mind that it may cause animation jerks.
          // boxShadow: <BoxShadow>[
          //   BoxShadow(
          //     color: Colors.black12,
          //     blurRadius: 0.0,
          //   ),
          // ],
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        // ignore: sort_child_properties_last
        child: Scaffold(
            appBar: AppBar(
              actions: [
                StoreCartIcon(
                    storeId: sellerViewmodel.currentSeller?.id ?? "",
                    onPressed: () {
                      _cartViewmodel.setCurrentVendor(
                          sellerViewmodel.currentSeller?.id ?? "");
                      RouteController().push(
                          context,
                          CartScreen(
                              shopName:
                                  sellerViewmodel.currentSeller?.name ?? ""));
                    })
              ],
              title: Text(
                sellerViewmodel.currentSeller?.name ?? "",
                style: TextStyle(
                    color: ceoPurple, fontSize: TextSize().h2(context)),
              ),
              leading: IconButton(
                onPressed: _handleMenuButtonPressed,
                icon: ValueListenableBuilder<AdvancedDrawerValue>(
                  valueListenable: _advancedDrawerController,
                  builder: (_, value, __) {
                    return AnimatedSwitcher(
                      duration: Duration(milliseconds: 300),
                      child: Icon(
                        value.visible ? Icons.clear : Icons.menu,
                        color: ceoPurple,
                        key: ValueKey<bool>(value.visible),
                      ),
                    );
                  },
                ),
              ),
              backgroundColor: ceoWhite,
              elevation: 0.0,
            ),
            body: storeViewmodel.currentScreen),
        drawer: CurrentShopDrawer());
  }

  void _handleMenuButtonPressed() {
    if (!_advancedDrawerController.value.visible) {
      _advancedDrawerController.showDrawer();
    } else {
      _advancedDrawerController.hideDrawer();
    }
  }
}
