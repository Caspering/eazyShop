// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../utils/color.dart';
import '../../utils/font_size.dart';
import '../../utils/router.dart';

class PopUp {
  void showError(message, context) async {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: SizedBox(
                width: MediaQuery.of(context).size.width / 1.1,
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width / 1.1,
                          height: 200,
                          margin: const EdgeInsets.only(top: 0),
                          // child: Image.asset(),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.contain,
                                  image: AssetImage(
                                      'assets/undraw_access_denied_re_awnf.png')))),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          "oops! ☹️",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: TextSize().h1(context),
                              color: ceoPurple),
                        ),
                      ),
                      Container(
                        // margin: EdgeInsets.only(left: 15, top: 7),
                        width: MediaQuery.of(context).size.width / 1.2,
                        child: Text(
                          message,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: TextSize().p(context),
                              color: ceoPurpleGrey),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: 10,
                        ),
                        width: 150,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: ceoPink,
                            border: Border.all(color: ceoPink)),
                        child: MaterialButton(
                          onPressed: () {
                            RouteController().pop(context);
                          },
                          child: Text(
                            "Back",
                            style: TextStyle(
                                color: ceoWhite,
                                fontSize: TextSize().p(context)),
                          ),
                        ),
                      )
                    ])),
          );
        });
  }

  void askIsSure(message, context, Function() function) async {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: SizedBox(
                width: MediaQuery.of(context).size.width / 1.1,
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width / 1.1,
                          height: 200,
                          margin: const EdgeInsets.only(top: 0),
                          // child: Image.asset(),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.contain,
                                  image: AssetImage(
                                      'assets/undraw_access_denied_re_awnf.png')))),
                      Container(
                        // margin: EdgeInsets.only(left: 15, top: 7),
                        width: MediaQuery.of(context).size.width / 1.2,
                        child: Text(
                          message,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: TextSize().p(context),
                              color: ceoPurpleGrey),
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Expanded(
                                child: Container(
                              margin: EdgeInsets.only(
                                top: 10,
                              ),
                              width: 70,
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: ceoPink,
                                  border: Border.all(color: ceoPink)),
                              child: MaterialButton(
                                onPressed: () {
                                  RouteController().pop(context);
                                },
                                child: Text(
                                  "Back",
                                  style: TextStyle(
                                      color: ceoWhite,
                                      fontSize: TextSize().p(context)),
                                ),
                              ),
                            )),
                            Container(
                              width: 5,
                            ),
                            Expanded(
                                child: Container(
                              margin: EdgeInsets.only(
                                top: 10,
                              ),
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: ceoWhite,
                                  border: Border.all(color: ceoPink)),
                              child: MaterialButton(
                                onPressed: () {
                                  RouteController().pop(context);
                                  function();
                                },
                                child: Text(
                                  "Continue",
                                  style: TextStyle(
                                      color: ceoPink,
                                      fontSize: TextSize().p(context)),
                                ),
                              ),
                            ))
                          ],
                        ),
                      )
                    ])),
          );
        });
  }

  void showScore(message, context, image, score) async {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: SizedBox(
                width: MediaQuery.of(context).size.width / 1.1,
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width / 1.1,
                          height: 200,
                          margin: const EdgeInsets.only(top: 0),
                          // child: Image.asset(),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.contain,
                                  image: AssetImage(image)))),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          '${score}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: TextSize().h1(context),
                              color: ceoPurple),
                        ),
                      ),
                      Container(
                        // margin: EdgeInsets.only(left: 15, top: 7),
                        width: MediaQuery.of(context).size.width / 1.2,
                        child: Text(
                          message,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: TextSize().p(context),
                              color: ceoPurpleGrey),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: 10,
                        ),
                        width: 150,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: ceoPink,
                            border: Border.all(color: ceoPink)),
                        child: MaterialButton(
                          onPressed: () {
                            RouteController().pop(context);
                          },
                          child: Text(
                            "Back",
                            style: TextStyle(
                                color: ceoWhite,
                                fontSize: TextSize().p(context)),
                          ),
                        ),
                      )
                    ])),
          );
        });
  }

  void showSuccess(message, context) async {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: SizedBox(
                width: MediaQuery.of(context).size.width / 1.1,
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width / 1.1,
                          height: 200,
                          margin: const EdgeInsets.only(top: 0),
                          // child: Image.asset(),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.contain,
                                  image: AssetImage(
                                      'assets/undraw_dua_lipa_ixam copy.png')))),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          "success 🥳",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: TextSize().h1(context),
                              color: ceoPurple),
                        ),
                      ),
                      Container(
                        // margin: EdgeInsets.only(left: 15, top: 7),
                        width: MediaQuery.of(context).size.width / 1.2,
                        child: Text(
                          message,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: TextSize().p(context),
                              color: ceoPurpleGrey),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: 10,
                        ),
                        width: 150,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: ceoPink,
                            border: Border.all(color: ceoPink)),
                        child: MaterialButton(
                          onPressed: () {
                            RouteController().pop(context);
                          },
                          child: Text(
                            "Continue",
                            style: TextStyle(
                                color: ceoWhite,
                                fontSize: TextSize().p(context)),
                          ),
                        ),
                      )
                    ])),
          );
        });
  }

  Future popLoad(context) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Container(
              margin: EdgeInsets.fromLTRB(30, 20, 30, 20),
              width: MediaQuery.of(context).size.width / 1.2,
              height: 100,
              child: Center(
                  child: CircularProgressIndicator(
                color: ceoPink,
              )),
            ),
          );
        });
  }
}
