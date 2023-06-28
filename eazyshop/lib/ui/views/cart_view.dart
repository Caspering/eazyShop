import 'package:eazyshop/ui/components/custom_listtile.dart';
import 'package:eazyshop/ui/components/empty_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/viewmodels/cart_viewmodel.dart';
import '../../utils/color.dart';
import '../../utils/font_size.dart';
import '../../utils/router.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    CartViewmodel _cartViewmodel = Provider.of<CartViewmodel>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                _cartViewmodel.clear();
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
          "Cart(${_cartViewmodel.itemCount})",
          style: TextStyle(color: ceoPurple, fontSize: TextSize().h3(context)),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: _cartViewmodel.items.isNotEmpty
              ? Column(
                  children: [
                    Column(
                      children: [
                        for (int index = 0;
                            index < _cartViewmodel.itemCount;
                            index++)
                          Container(
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: ceoWhite,
                            ),
                            child: CustomListTile(
                              title: Text(
                                _cartViewmodel.items[index].name,
                                style: TextStyle(
                                  fontSize: TextSize().p(context),
                                  fontWeight: FontWeight.w500,
                                  color: ceoPurple,
                                ),
                              ),
                              subtitle: Text(
                                '\u20A6${_cartViewmodel.items[index].total}',
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
                                      _cartViewmodel.decreaseQuantity(
                                          _cartViewmodel.items[index]);
                                    },
                                  ),
                                  Text(
                                    _cartViewmodel
                                        .getQuantity(
                                            _cartViewmodel.items[index])
                                        .toString(),
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.add_circle),
                                    onPressed: () {
                                      // Increase quantity logic
                                      _cartViewmodel.increaseQuantity(
                                          _cartViewmodel.items[index]);
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
                      'Subtotal: \u20A6${_cartViewmodel.subtotal}',
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
      bottomNavigationBar: _cartViewmodel.items.isNotEmpty
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
