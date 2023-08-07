// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/services/authentication.dart';
import '../../core/viewmodels/product_viewmodel.dart';
import '../../core/viewmodels/user_viewmodel.dart';
import '../../utils/color.dart';
import '../../utils/font_size.dart';
import 'add_flash.dart';

class ProfileView extends StatefulWidget {
  @override
  ProfileState createState() => ProfileState();
}

class ProfileState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthenticationService>(context);
    final userViewModel = Provider.of<UserViewmodel>(context);
    final productViewmodel = Provider.of<ProductViewmodel>(context);
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          body: Container(
            height: double.infinity,
            width: double.infinity,
            color: ceoWhite,
            /*  child: FutureBuilder<Ceo>(
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
                                    snapshot.data!.imageUrl.toString()),
                              )),
                          Container(
                            margin: EdgeInsets.only(top: 7, left: 7),
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              '${snapshot.data?.firstname} ${snapshot.data?.lastname}',
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
                                '${snapshot.data?.username}💰',
                                // textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: TextSize().custom(11, context),
                                    color: ceoPurpleGrey),
                              )),
                          Container(
                              margin: EdgeInsets.only(top: 7, left: 7),
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        if (snapshot.data!.ceoScore! > 50) {
                                          PopUp().showScore(
                                              "You are a baller. You can keep balling by adding products and selling more.",
                                              context,
                                              "assets/undraw_dua_lipa_ixam copy.png",
                                              "Your ceo score is ${snapshot.data?.ceoScore}🎉");
                                        } else {
                                          PopUp().showScore(
                                              "You are a mechanic. You can become a baller by adding products and selling more.",
                                              context,
                                              "assets/undraw_stepping_up_g6oo copy.png",
                                              "Your ceo score is ${snapshot.data?.ceoScore}☹️");
                                        }
                                      },
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            left: 10,
                                            right: 10,
                                            top: 0,
                                            bottom: 3),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border:
                                                Border.all(color: greyOne!)),
                                        child: Text(
                                          '🧑🏿‍💼: ${snapshot.data?.ceoScore}',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: TextSize()
                                                  .custom(11, context),
                                              color: ceoBlack),
                                        ),
                                      )),
                                  Container(
                                    width: 10,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: 0, top: 0, bottom: 3),
                                    child: Text(
                                        '${snapshot.data!.subscribers!.length.toString()} subscribers',
                                        style: TextStyle(
                                            fontSize:
                                                TextSize().custom(11, context),
                                            fontWeight: FontWeight.w600,
                                            color: ceoPurple)),
                                  ),
                                ],
                              )),
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
                                      userViewModel.setCeo(snapshot.data!);
                                      print(userViewModel.currentCeo?.id);
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
                                        CustomGridView(
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
              )*/
          ),
        ));
  }
}
