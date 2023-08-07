// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:easystore/core/viewmodels/seller_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/services/authentication.dart';
import '../../core/viewmodels/cart_viewmodel.dart';
import '../../core/viewmodels/product_viewmodel.dart';
import '../../core/viewmodels/user_viewmodel.dart';
import '../../utils/color.dart';
import '../../utils/font_size.dart';
import '../../utils/router.dart';
import '../shared/popup.dart';
import '../views/app_index.dart';
import 'fullname.dart';
import 'onboarding_two.dart';

class OnboardingOne extends StatefulWidget {
  @override
  OnboardingOneState createState() => OnboardingOneState();
}

class OnboardingOneState extends State<OnboardingOne> {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthenticationService>(context);
    final sellerViewmodel = Provider.of<SellerViewmodel>(context);
    final productViewmodel = Provider.of<ProductViewmodel>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: ceoWhite,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: ceoWhite,
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3,
              margin: const EdgeInsets.only(top: 0),
              // child: Image.asset(),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage(
                          'assets/undraw_web_shopping_re_owap copy.png')))),
          Container(
            margin: EdgeInsets.only(top: 7),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 15),
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: Text(
                    "Empower\nYour Store:",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: TextSize().h(context),
                        color: ceoPurple),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 15, top: 7),
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: Text(
                    "Your Pocket Retail Solution: Manage, Sell, and Thrive with Ease.🥳",
                    //textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: TextSize().h3(context),
                        color: ceoPurpleGrey),
                  ),
                ),
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.only(
                top: 20,
              ),
              width: MediaQuery.of(context).size.width / 2,
              child: Center(
                child: Container(
                  height: 90,
                  width: 90,
                  // ignore: sort_child_properties_last
                  child: MaterialButton(
                    onPressed: () async {
                      authService.getAuthState();
                      print(authService.userId);
                      //   productViewmodel.batchWrite();
                      if (authService.authState == true) {
                        try {
                          PopUp().popLoad(context);
                          bool userExists = await sellerViewmodel
                              .checkIfUser(authService.userId);

                          if (userExists) {
                            RouteController()
                                .pushAndRemoveUntil(context, AppIndex());
                          } else {
                            RouteController().push(context, Fullname());
                          }
                        } catch (error) {
                          // Handle any potential errors here
                          print('Error: $error');
                          // Show an appropriate error message to the user
                        }
                      } else {
                        RouteController().push(context, OnboardingTwo());
                      }
                    },
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: ceoWhite,
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: ceoPink, borderRadius: BorderRadius.circular(45)),
                ),
              ))
        ]),
      ),
    );
  }
}
