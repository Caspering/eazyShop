import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/models/product_model.dart';
import '../../core/services/authentication.dart';
import '../../core/viewmodels/product_viewmodel.dart';
import '../../core/viewmodels/user_viewmodel.dart';
import '../../utils/color.dart';
import '../../utils/font_size.dart';
import '../../utils/router.dart';
import '../views/ceo_product_details.dart';
import 'empty_screen.dart';
import 'product_card.dart';

class CeoCustomGrid extends StatefulWidget {
  final String? gridCategory;
  final Widget? action;
  final Future<List<Product>>? categoryProducts;
  const CeoCustomGrid(
      {Key? key, this.action, this.gridCategory, this.categoryProducts})
      : super(key: key);

  @override
  State<CeoCustomGrid> createState() => _CeoCustomGridState();
}

class _CeoCustomGridState extends State<CeoCustomGrid> {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthenticationService>(context);
    final userViewModel = Provider.of<UserViewmodel>(context);
    final productViewmodel =
        Provider.of<ProductViewmodel>(context, listen: true);
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
        leading: IconButton(
          onPressed: () {
            RouteController().pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: ceoPurple,
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: ceoWhite,
        child: FutureBuilder<List<Product>>(
          future: widget.categoryProducts,
          builder: (context, snapshot) {
            print(snapshot.error);
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
                      onTapped: () {},
                      price: snapshot.data?[index].price,
                      productName: snapshot.data?[index].productName,
                      url: snapshot.data?[index].productImage,
                    );
                  }));
            }
          },
        ),
      ),
    );
  }
}
