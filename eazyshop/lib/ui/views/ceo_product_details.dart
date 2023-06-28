import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../../core/services/authentication.dart';
import '../../core/viewmodels/product_viewmodel.dart';
import '../../core/viewmodels/user_viewmodel.dart';
import '../../utils/color.dart';
import '../../utils/font_size.dart';
import '../../utils/router.dart';
import '../components/username.dart';
import '../shared/popup.dart';

class CeoProductDetails extends StatefulWidget {
  const CeoProductDetails({Key? key}) : super(key: key);

  @override
  State<CeoProductDetails> createState() => _CeoProductDetailsState();
}

class _CeoProductDetailsState extends State<CeoProductDetails> {
  var formatter = NumberFormat('#,###,000');
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthenticationService>(context);
    final userViewModel = Provider.of<UserViewmodel>(context);
    final productViewmodel = Provider.of<ProductViewmodel>(context);
    return Scaffold(
        appBar: AppBar(
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
            productViewmodel.product!.category!,
            style: TextStyle(color: ceoPurple, fontSize: TextSize().p(context)),
          ),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: ceoWhite,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15)),
                        margin: EdgeInsets.only(right: 10, left: 10, bottom: 7),
                        width: MediaQuery.of(context).size.width / 1.05,
                        height: MediaQuery.of(context).size.width * 1.05,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: AspectRatio(
                              aspectRatio: 2.0,
                              child: CachedNetworkImage(
                                imageUrl: productViewmodel.product!.productImage
                                    .toString(),
                                fit: BoxFit.fill,
                              ),
                            )))),
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10, top: 12),
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            productViewmodel.product!.productName!,
                            style: TextStyle(
                                fontSize: TextSize().h3(context),
                                fontWeight: FontWeight.w600,
                                color: ceoPurple),
                          ),
                          Container(
                            height: 5,
                          ),
                          Username(
                            userId: productViewmodel.product?.sellerId,
                          )
                        ],
                      ),
                      Expanded(child: Container()),
                      Text(
                        productViewmodel.product!.isFlash == false
                            ? formatter.format(productViewmodel.product!.price)
                            : formatter.format(
                                productViewmodel.product!.discountPrice),
                        style: TextStyle(
                            fontSize: TextSize().p(context),
                            fontWeight: FontWeight.w500,
                            color: ceoPurple),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10, top: 15),
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    productViewmodel.product!.description!,
                    style: TextStyle(
                        fontSize: TextSize().p(context),
                        fontWeight: FontWeight.w400,
                        color: ceoPurpleGrey),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10, top: 20, bottom: 5),
                  height: 40,
                  width: MediaQuery.of(context).size.width / 2,
                  decoration: BoxDecoration(
                    color: ceoRed,
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      /* */

                      PopUp().askIsSure(
                          "Do you really want to delete?", context, () async {
                        await productViewmodel.deleteProduct(
                            productViewmodel.product?.id,
                            productViewmodel.product?.isFlash == true
                                ? productViewmodel.ceoFlash
                                : productViewmodel.ceoProducts,
                            productViewmodel.product);
                        RouteController().pop(context);
                        setState(() {});
                        PopUp().showSuccess("Product deleted successfully",
                            productViewmodel.context);
                      });
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.delete,
                          color: ceoWhite,
                        ),
                        Container(
                          width: 5,
                        ),
                        Text(
                          'Delete product',
                          style: TextStyle(
                              fontSize: TextSize().p(context),
                              fontWeight: FontWeight.w600,
                              color: ceoWhite),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
