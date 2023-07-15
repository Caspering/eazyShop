import 'package:eazyshop/ui/components/custom_listtile.dart';
import 'package:eazyshop/ui/components/empty_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/viewmodels/cart_viewmodel.dart';
import '../../utils/color.dart';
import '../../utils/font_size.dart';
import '../../utils/router.dart';

class CartScreen extends StatefulWidget {
  String shopName;
  CartScreen({super.key, required this.shopName});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    CartViewmodel _cartViewmodel = Provider.of<CartViewmodel>(context);
    String vendorId = _cartViewmodel.currentVendor ?? "";
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                _cartViewmodel.clearCartForVendor(vendorId);
              },
              icon: Icon(
                Icons.delete_outline,
                color: ceoPurple,
              ))
        ],
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
          "${widget.shopName}(${_cartViewmodel.getCartItemCountForVendor(vendorId)})",
          style: TextStyle(color: ceoPurple, fontSize: TextSize().h3(context)),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          //  height: MediaQuery.of(context).size.height,
          child: _cartViewmodel.getCartForVendor(vendorId).isNotEmpty
              ? Column(
                  children: [
                    Column(
                      children: [
                        for (int index = 0;
                            index <
                                _cartViewmodel
                                    .getCartItemCountForVendor(vendorId);
                            index++)
                          Container(
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: ceoWhite,
                            ),
                            child: CustomListTile(
                              title: Text(
                                _cartViewmodel
                                    .getCartForVendor(vendorId)[index]
                                    .name,
                                style: TextStyle(
                                  fontSize: TextSize().p(context),
                                  fontWeight: FontWeight.w500,
                                  color: ceoPurple,
                                ),
                              ),
                              subtitle: Text(
                                '\u20A6${_cartViewmodel.getCartForVendor(vendorId)[index].total}',
                                style: TextStyle(
                                  fontSize: TextSize().p(context),
                                  fontWeight: FontWeight.w600,
                                  color: ceoPurple,
                                ),
                              ),
                              trailing: Column(
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.remove_circle),
                                    onPressed: () {
                                      // Decrease quantity logic
                                      _cartViewmodel.decreaseQuantityForVendor(
                                          _cartViewmodel.getCartForVendor(
                                              vendorId)[index],
                                          vendorId);
                                    },
                                  ),
                                  Text(
                                    _cartViewmodel
                                        .getQuantityForVendor(
                                            _cartViewmodel.getCartForVendor(
                                                vendorId)[index],
                                            vendorId)
                                        .toString(),
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.add_circle),
                                    onPressed: () {
                                      // Increase quantity logic
                                      _cartViewmodel.increaseQuantityForVendor(
                                          _cartViewmodel.getCartForVendor(
                                              vendorId)[index],
                                          vendorId);
                                    },
                                  ),
                                ],
                              ),
                              leading: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    'assets/indoor-shot-adorable-female-buyer-spending-her-free-time-boutique-standing-near-dummy-with-clothes-reading-news-online-while-using-free-internet-connection-shop-assistant-selling-clothes copy.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                    Text(
                      'Subtotal: \u20A6${_cartViewmodel.getCartSubtotalForVendor(vendorId)}',
                      style: TextStyle(
                          fontSize: TextSize().h3(context),
                          fontWeight: FontWeight.w500,
                          color: ceoPurpleGrey),
                    ),
                  ],
                )
              : Empty(),
        ),
      ),
      bottomNavigationBar: _cartViewmodel.getCartForVendor(vendorId).isNotEmpty
          ? BottomAppBar(
              padding: EdgeInsets.all(10),
              elevation: 0.0,
              color: ceoWhite,
              child: Container(
                width: MediaQuery.of(context).size.width / 1.5,
                height: 60,
                margin: EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: ceoPurple,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: MaterialButton(
                  onPressed: () {},
                  child: Text(
                    "Checkout",
                    style: TextStyle(
                        color: ceoWhite, fontSize: TextSize().h3(context)),
                  ),
                ),
              ))
          : null,
    );
  }
}
