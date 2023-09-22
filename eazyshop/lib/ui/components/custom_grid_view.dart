import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/models/product_model.dart';
import '../../core/services/authentication.dart';
import '../../core/viewmodels/product_viewmodel.dart';
import '../../core/viewmodels/user_viewmodel.dart';
import '../../utils/color.dart';
import '../../utils/font_size.dart';
import '../../utils/router.dart';
import '../shared/product_card.dart';
import '../views/product_details.dart';
import 'empty_screen.dart';

class CustomGridView extends StatefulWidget {
  final String? gridCategory;
  Widget? action;

  final Future<List<Product>>? categoryProducts;
  CustomGridView({
    Key? key,
    this.gridCategory,
    this.categoryProducts,
    this.action,
  }) : super(key: key);

  @override
  State<CustomGridView> createState() => _CustomGridViewState();
}

class _CustomGridViewState extends State<CustomGridView> {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthenticationService>(context);
    final userViewModel = Provider.of<UserViewmodel>(context);
    final productViewmodel = Provider.of<ProductViewmodel>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          widget.gridCategory!,
          style: TextStyle(fontSize: TextSize().p(context), color: ceoPurple),
        ),
        actions: [widget.action ?? Container()],
        backgroundColor: ceoWhite,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: ceoWhite,
        child: FutureBuilder<List<Product>>(
          future: widget.categoryProducts,
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
                      childAspectRatio: 0.65, crossAxisCount: 2),
                  itemCount: snapshot.data?.length,
                  itemBuilder: ((context, index) {
                    return ProductCard(
                        onTapped: () {
                          productViewmodel
                              .setCurrentProduct(snapshot.data?[index]);
                          RouteController().push(context, ProductDetails());
                        },
                        product: snapshot.data![index]);
                  }));
            }
          },
        ),
      ),
    );
  }
}
