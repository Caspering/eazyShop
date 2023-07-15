import 'package:eazyshop/core/models/seller_model.dart';
import 'package:eazyshop/core/viewmodels/seller_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/models/user_model.dart';
import '../../core/viewmodels/user_viewmodel.dart';
import '../../utils/color.dart';
import '../../utils/font_size.dart';

class Username extends StatefulWidget {
  final String? userId;
  const Username({Key? key, this.userId}) : super(key: key);

  @override
  State<Username> createState() => _UsernameState();
}

class _UsernameState extends State<Username> {
  @override
  Widget build(BuildContext context) {
    final sellerViewmodel = Provider.of<SellerViewmodel>(context);
    return FutureBuilder<Seller>(
        future: sellerViewmodel.getCeoById(widget.userId),
        builder: (context, snapshot) {
          return Text(
            'by ${snapshot.data?.name}',
            style: TextStyle(
                fontSize: TextSize().p(context),
                color: ceoPurpleGrey,
                fontWeight: FontWeight.w500),
          );
        });
  }
}
