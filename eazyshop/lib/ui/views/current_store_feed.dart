import 'package:eazyshop/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/services/authentication.dart';
import '../../core/viewmodels/product_viewmodel.dart';
import '../../core/viewmodels/seller_viewmodel.dart';
import '../../core/viewmodels/user_viewmodel.dart';

class CurrentStoreFeed extends StatefulWidget {
  const CurrentStoreFeed({super.key});

  @override
  State<CurrentStoreFeed> createState() => _CurrentStoreFeedState();
}

class _CurrentStoreFeedState extends State<CurrentStoreFeed> {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthenticationService>(context);
    final userViewModel = Provider.of<UserViewmodel>(context);
    final productViewmodel = Provider.of<ProductViewmodel>(context);
    final sellerViewmodel = Provider.of<SellerViewmodel>(context);
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: ceoWhite,
    );
  }
}
