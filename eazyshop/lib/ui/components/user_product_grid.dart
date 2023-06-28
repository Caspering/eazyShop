import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../core/models/product_model.dart';
import '../../core/services/authentication.dart';
import '../../core/viewmodels/product_viewmodel.dart';
import '../../core/viewmodels/user_viewmodel.dart';
import '../../utils/color.dart';
import '../../utils/router.dart';
import '../shared/product_card.dart';
import '../views/product_details.dart';
import 'empty_screen.dart';

class UserProductGrid extends StatefulWidget {
  const UserProductGrid({Key? key}) : super(key: key);

  @override
  State<UserProductGrid> createState() => _UserProductGridState();
}

class _UserProductGridState extends State<UserProductGrid> {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthenticationService>(context);
    final userViewModel = Provider.of<UserViewmodel>(context);
    final productViewmodel = Provider.of<ProductViewmodel>(context);
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      height: MediaQuery.of(context).size.height / 2,
      child: FutureBuilder<List<Product>>(
        future: productViewmodel.getCeoProducts(authService.userId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(color: ceoPink),
            );
          } else if (!snapshot.hasData || snapshot.data!.length < 1) {
            return Empty();
          } else {
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.6, crossAxisCount: 2),
                itemCount: snapshot.data?.length,
                itemBuilder: ((context, index) {
                  return ProductCard(
                    onTapped: () {
                      productViewmodel.setCurrentProduct(snapshot.data?[index]);
                      RouteController().push(context, ProductDetails());
                    },
                    price: snapshot.data?[index].price,
                    productName: snapshot.data?[index].productName,
                    url: snapshot.data?[index].productImage,
                  );
                }));
          }
        },
      ),
    );
  }
}
