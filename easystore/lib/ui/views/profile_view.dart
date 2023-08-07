// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easystore/core/models/seller_model.dart';
import 'package:easystore/core/viewmodels/seller_viewmodel.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/services/authentication.dart';
import '../../core/viewmodels/product_viewmodel.dart';
import '../../core/viewmodels/user_viewmodel.dart';
import '../../utils/color.dart';
import '../../utils/font_size.dart';
import '../../utils/router.dart';
import '../components/ceo_product_custom_grid.dart';
import '../shared/action_box.dart';
import '../shared/popup.dart';
import '../shared/text_icon_button.dart';
import 'add_flash.dart';
import 'add_product.dart';
import 'settings_view.dart';

class ProfileView extends StatefulWidget {
  @override
  ProfileState createState() => ProfileState();
}

class ProfileState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthenticationService>(context);
    final userViewModel = Provider.of<SellerViewmodel>(context);
    final productViewmodel = Provider.of<ProductViewmodel>(context);
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          body: Container(
              height: double.infinity,
              width: double.infinity,
              color: ceoWhite,
              child: FutureBuilder<Seller>(
                future: userViewModel.getCeoById(authService.userId),
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    return SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Container(
                              margin: EdgeInsets.only(left: 7),
                              child: CircleAvatar(
                                radius: 30,
                                backgroundImage: NetworkImage(
                                    snapshot.data!.logoUrl.toString()),
                              )),
                          Container(
                            margin: EdgeInsets.only(top: 7, left: 7),
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              '${snapshot.data?.name}',
                              // textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: TextSize().p(context),
                                  color: ceoPurple),
                            ),
                          ),
                          Container(
                              padding: EdgeInsets.only(
                                  left: 7, right: 0, top: 5, bottom: 3),
                              child: Text(
                                '${snapshot.data?.name}💰',
                                // textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: TextSize().custom(11, context),
                                    color: ceoPurpleGrey),
                              )),
                          Container(
                            width: 10,
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 5),
                            padding: EdgeInsets.all(3),
                            width: MediaQuery.of(context).size.width,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextIcon(
                                      icon: Icons.add_business,
                                      color: Colors.orange,
                                      text: "Add product",
                                      onPressed: () {
                                        RouteController()
                                            .push(context, AddProduct());
                                      }),
                                  TextIcon(
                                    icon: Icons.timer,
                                    color: Colors.red,
                                    onPressed: () {
                                      RouteController()
                                          .push(context, AddFlash());
                                    },
                                    text: "Flash sale",
                                  ),
                                  TextIcon(
                                    onPressed: () {
                                      PopUp().showError(
                                          "This feature is not yet available",
                                          context);
                                    },
                                    icon: Icons.delivery_dining,
                                    color: Colors.green,
                                    text: "Your orders",
                                  ),
                                  TextIcon(
                                    icon: Icons.smart_display_rounded,
                                    color: ceoPink,
                                    text: "Create ad",
                                  ),
                                  TextIcon(
                                    onPressed: () {
                                      userViewModel.setSeller(snapshot.data!);
                                      print(userViewModel.currentSeller?.id);
                                      RouteController()
                                          .push(context, Settings());
                                    },
                                    icon: Icons.settings,
                                    color: ceoPurple,
                                    text: "Settings",
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              top: 12,
                            ),
                            padding: EdgeInsets.all(3),
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                ActionBox(
                                  onTapped: () {
                                    RouteController().push(
                                        context,
                                        CeoCustomGrid(
                                          gridCategory: "My products",
                                          categoryProducts:
                                              productViewmodel.getCeoProducts(
                                                  authService.userId),
                                        ));
                                  },
                                  icon: Icon(
                                    Icons.shopping_bag,
                                    color: Colors.white,
                                  ),
                                  text: "Products",
                                  color: Colors.orange,
                                ),
                                ActionBox(
                                  onTapped: () {
                                    RouteController().push(
                                        context,
                                        CeoCustomGrid(
                                          gridCategory: "My flash sales",
                                          categoryProducts: productViewmodel
                                              .getCeoFlash(authService.userId),
                                        ));
                                  },
                                  icon: Icon(
                                    Icons.timer,
                                    color: Colors.white,
                                  ),
                                  text: "Flash sales",
                                  color: Colors.red,
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              top: 10,
                            ),
                            padding: EdgeInsets.all(3),
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                ActionBox(
                                  onTapped: () {
                                    RouteController().push(
                                        context,
                                        CeoCustomGrid(
                                          categoryProducts: productViewmodel
                                              .getSubscribedItems(
                                                  authService.userId),
                                          gridCategory: "Vendors your follow",
                                        ));
                                  },
                                  icon: Icon(
                                    Icons.notifications_active,
                                    color: Colors.white,
                                  ),
                                  text: "Subscriptions",
                                  color: ceoPink,
                                ),
                                ActionBox(
                                  onTapped: () {
                                    PopUp().showError(
                                        "This feature is not yet available",
                                        context);
                                  },
                                  icon: Icon(
                                    Icons.smart_display,
                                    color: Colors.white,
                                  ),
                                  text: "Active ads",
                                  color: ceoPurple,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: ceoPink,
                      ),
                    );
                  } else {
                    print(snapshot.error);
                    return Container();
                  }
                }),
              )),
        ));
  }
}
