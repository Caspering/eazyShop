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
import 'custom_grid_view.dart';

class CustomRow extends StatefulWidget {
  final String category;
  final String header;

  const CustomRow({
    Key? key,
    required this.category,
    required this.header,
  }) : super(key: key);

  @override
  State<CustomRow> createState() => _CustomRowState();
}

class _CustomRowState extends State<CustomRow> {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthenticationService>(context);
    final userViewModel = Provider.of<UserViewmodel>(context);
    final productViewmodel = Provider.of<ProductViewmodel>(context);
    return Container(
      child: FutureBuilder<List<Product>>(
        future: productViewmodel.getCategoryProd(widget.category),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data?.length != 0) {
            return Container(
                margin: EdgeInsets.only(top: 5),
                width: double.infinity,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(right: 0),
                        child: Row(
                          children: [
                            Text(
                              widget.header,
                              style: TextStyle(
                                  color: ceoPurple,
                                  fontSize: TextSize().h3(context),
                                  fontWeight: FontWeight.w600),
                            ),
                            Expanded(child: Container()),
                            IconButton(
                                onPressed: () {
                                  RouteController().push(
                                      context,
                                      CustomGridView(
                                        gridCategory: widget.category,
                                        categoryProducts: productViewmodel
                                            .getCategoryProd(widget.category),
                                      ));
                                },
                                icon: Icon(
                                  Icons.arrow_forward,
                                  color: ceoPurpleGrey,
                                  size: TextSize().custom(15, context),
                                ))
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(
                            snapshot.data?.length ?? 0,
                            (index) => ProductCard(
                              onTapped: () {
                                RouteController()
                                    .push(context, ProductDetails());
                                productViewmodel
                                    .setCurrentProduct(snapshot.data?[index]);
                              },
                              price: snapshot.data?[index].price,
                              url: snapshot.data?[index].productImage,
                              productName: snapshot.data?[index].productName,
                            ),
                          ),
                        ),
                      )
                    ]));
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            print(snapshot.error);
            return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width / 2.4,
                      height: MediaQuery.of(context).size.height / 3.6,
                      decoration: BoxDecoration(
                          color: greyOne,
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width / 2.4,
                      height: MediaQuery.of(context).size.height / 3.6,
                      decoration: BoxDecoration(
                          color: greyOne,
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width / 2.4,
                      height: MediaQuery.of(context).size.height / 3.6,
                      decoration: BoxDecoration(
                          color: greyOne,
                          borderRadius: BorderRadius.circular(15)),
                    )
                  ],
                ));
          } else {
            print(snapshot.error);
            return Container(
              height: 0,
            );
          }
        },
      ),
    );
  }
}
