import 'package:eazyshop/ui/components/custom_listtile.dart';
import 'package:eazyshop/ui/components/empty_screen.dart';
import 'package:eazyshop/ui/components/shop_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/viewmodels/cart_viewmodel.dart';
import '../../utils/color.dart';
import '../../utils/font_size.dart';
import '../../utils/router.dart';

class SuperCartScreen extends StatefulWidget {
  const SuperCartScreen({super.key});

  @override
  State<SuperCartScreen> createState() => _SuperCartScreenState();
}

class _SuperCartScreenState extends State<SuperCartScreen> {
  @override
  Widget build(BuildContext context) {
    CartViewmodel _cartViewmodel = Provider.of<CartViewmodel>(context);
    //  String vendorId = _cartViewmodel.currentVendor ?? "";
    //  List<String> allVendors = _cartViewmodel.getVendorList();
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: ceoWhite,
        leading: IconButton(
          onPressed: () {
            RouteController().pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: ceoPurple,
            size: TextSize().h2(context),
          ),
        ),
        title: Text(
          "All Carts(${_cartViewmodel.overallCartItemCount})",
          style: TextStyle(color: ceoPurple, fontSize: TextSize().h3(context)),
        ),
      ),
      body: _cartViewmodel.carts.isNotEmpty
          ? ListView.builder(
              itemCount: _cartViewmodel.getVendorList().length,
              itemBuilder: (context, index) {
                return ShopCard(
                  userId: _cartViewmodel.getVendorList()[index],
                );
              })
          : Empty(),
    );
  }
}
