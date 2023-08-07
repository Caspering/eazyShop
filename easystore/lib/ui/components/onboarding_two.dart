// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';

import '../../utils/color.dart';
import '../../utils/font_size.dart';
import '../../utils/router.dart';
import '../views/app_index.dart';
import '../views/login.dart';
import '../views/signup.dart';

class OnboardingTwo extends StatefulWidget {
  @override
  OnboardingTwoState createState() => OnboardingTwoState();
}

class OnboardingTwoState extends State<OnboardingTwo> {
  @override
  Widget build(BuildContext context) {
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
                    "Curate \nExceptional Retail Collection",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: TextSize().h2(context),
                        color: ceoPurple),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 15, top: 7),
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: Text(
                    "Curate Your Store's Collection: Superior Products at Competitive Wholesale Rates.",
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
              // width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 150,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: ceoPink)),
                    child: MaterialButton(
                      onPressed: () {
                        RouteController().push(context, LoginView());
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: ceoPurple, fontSize: TextSize().h3(context)),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: 20,
                    ),
                    width: 150,
                    height: 50,
                    decoration: BoxDecoration(
                        color: ceoPink,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: ceoPink)),
                    child: MaterialButton(
                      onPressed: () {
                        RouteController().push(context, RegisterView());
                      },
                      child: Text(
                        "Sign up",
                        style: TextStyle(
                            color: ceoWhite, fontSize: TextSize().h3(context)),
                      ),
                    ),
                  )
                ],
              )),
        ]),
      ),
    );
  }
}
