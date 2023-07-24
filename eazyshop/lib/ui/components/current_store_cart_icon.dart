import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/viewmodels/cart_viewmodel.dart';
import '../../utils/color.dart';

class StoreCartIcon extends StatefulWidget {
  String storeId;
  final VoidCallback? onPressed;
  StoreCartIcon({super.key, required this.storeId, required this.onPressed});

  @override
  State<StoreCartIcon> createState() => _StoreCartIconState();
}

class _StoreCartIconState extends State<StoreCartIcon> {
  @override
  Widget build(BuildContext context) {
    CartViewmodel _cartViewmodel = Provider.of<CartViewmodel>(context);
    int itemCount = _cartViewmodel.getCartItemCountForVendor(widget.storeId);
    return Stack(
      children: [
        IconButton(
          icon: Icon(
            Icons.shopping_bag_outlined,
            color: ceoBlack,
          ),
          onPressed: widget.onPressed,
        ),
        if (itemCount > 0)
          Positioned(
            right: 2,
            child: Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              constraints: BoxConstraints(
                minWidth: 16,
                minHeight: 16,
              ),
              child: Text(
                itemCount.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }
}
