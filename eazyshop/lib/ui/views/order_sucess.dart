import 'package:eazyshop/utils/color.dart';
import 'package:eazyshop/utils/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/viewmodels/cart_viewmodel.dart';
import '../../utils/font_size.dart';

class OrderSuccess extends StatefulWidget {
  const OrderSuccess({super.key});

  @override
  State<OrderSuccess> createState() => _OrderSuccessState();
}

class _OrderSuccessState extends State<OrderSuccess> {
  @override
  @override
  void initState() {
    CartViewmodel _cartViewmodel =
        Provider.of<CartViewmodel>(context, listen: false);
    super.initState();

    // Execute code after 5 seconds
    Future.delayed(Duration(seconds: 5), () {
      // Place your code here
      _cartViewmodel.clearCartForVendor(_cartViewmodel.currentVendor ?? '');
      RouteController().pop(context);
      RouteController().pop(context);
      RouteController().pop(context);
      print("Code executed after 5 seconds");
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: ceoWhite,
      child: Column(
        children: [
          Expanded(child: Container()),
          Icon(
            Icons.check_circle_outline,
            size: 45,
            color: Colors.green,
          ),
          Container(
            margin: EdgeInsets.only(top: 15),
            child: Text(
              "Order Sent Sucessfully",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: TextSize().h1(context),
                  color: ceoPurple),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15),
            child: Text(
              "Please wait...",
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: TextSize().small(context),
                  color: ceoPurple),
            ),
          ),
          Expanded(child: Container()),
          Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3.5,
              margin: const EdgeInsets.only(top: 0),
              // child: Image.asset(),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage(
                          'assets/undraw_Successful_purchase_re_mpig.png')))),
        ],
      ),
    ));
  }
}
