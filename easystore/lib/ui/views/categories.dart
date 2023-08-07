import 'package:easystore/ui/components/ceo_product_custom_grid.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/services/authentication.dart';
import '../../core/viewmodels/product_viewmodel.dart';
import '../../core/viewmodels/user_viewmodel.dart';
import '../../utils/categories.dart';
import '../../utils/color.dart';
import '../../utils/font_size.dart';
import '../../utils/router.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({Key? key}) : super(key: key);

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthenticationService>(context);
    final userViewModel = Provider.of<UserViewmodel>(context);
    final productViewmodel = Provider.of<ProductViewmodel>(context);
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: ceoWhite,
      child: ListView.builder(
          itemCount: categories.length,
          itemBuilder: ((context, index) {
            return Container(
              margin: EdgeInsets.all(5),
              child: ListTile(
                onTap: () {
                  RouteController().push(
                      context,
                      CeoCustomGrid(
                        gridCategory: categories[index],
                        categoryProducts:
                            productViewmodel.getCategoryProd(categories[index]),
                      ));
                },
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: ceoPurple,
                  size: TextSize().p(context),
                ),
                title: Text(
                  categories[index],
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: ceoPurple,
                      fontSize: TextSize().p(context)),
                ),
              ),
            );
          })),
    );
  }
}
