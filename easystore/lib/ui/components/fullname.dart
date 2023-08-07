// ignore_for_file: unused_local_variable

import 'package:easystore/core/viewmodels/seller_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/services/authentication.dart';
import '../../core/viewmodels/user_viewmodel.dart';
import '../../utils/color.dart';
import '../../utils/font_size.dart';
import '../../utils/router.dart';
import '../shared/textfield.dart';
import 'profile_picture.dart';

class Fullname extends StatefulWidget {
  @override
  FullnameState createState() => FullnameState();
}

class FullnameState extends State<Fullname> {
  TextEditingController _firstName = TextEditingController();
  TextEditingController _lastName = TextEditingController();
  TextEditingController _storeName = TextEditingController();
  bool? isFname;
  bool? isLname;
  bool? isSname;
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthenticationService>(context);
    final sellerViewModel = Provider.of<SellerViewmodel>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: ceoWhite,
      ),
      body: Container(
          //  alignment: Alignment.center,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: ceoWhite,
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height / 1.2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10, top: 15),
                    child: Text(
                      "Complete registration 1/3",
                      style: TextStyle(
                          color: ceoPurple, fontSize: TextSize().p(context)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, top: 10),
                    child: Text(
                      "What is your name",
                      style: TextStyle(
                          color: ceoPurple,
                          fontWeight: FontWeight.w500,
                          fontSize: TextSize().h1(context)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, top: 10),
                    child: Text(
                      "Please enter your name and store name",
                      style: TextStyle(
                          color: ceoPurpleGrey,
                          fontSize: TextSize().h3(context)),
                    ),
                  ),
                  Center(
                      child: Container(
                          margin: EdgeInsets.only(top: 15),
                          child: CustomTextField(
                            onChanged: (String text) {
                              if (text.length > 2) {
                                setState(() {
                                  isFname = true;
                                });
                              } else {
                                setState(() {
                                  isFname = false;
                                });
                              }
                            },
                            hintText: "First name",
                            errorText: isFname == false
                                ? "first name must be more than 2 characters"
                                : null,
                            controller: _firstName,
                            // prefix: Icons.person_outline_rounded,
                          ))),
                  Center(
                      child: Container(
                          // margin: EdgeInsets.only(top),
                          child: CustomTextField(
                    onChanged: (String text) {
                      if (text.length > 2) {
                        setState(() {
                          isLname = true;
                        });
                      } else {
                        setState(() {
                          isLname = false;
                        });
                      }
                    },

                    errorText: isLname == false
                        ? "last name must be more than 2 characters"
                        : null,
                    hintText: "Last name",
                    controller: _lastName,
                    // prefix: Icons.person_outline_rounded,
                  ))),
                  Center(
                      child: Container(
                          margin: EdgeInsets.only(top: 15),
                          child: CustomTextField(
                            onChanged: (String text) {
                              if (text.length >= 3) {
                                setState(() {
                                  isSname = true;
                                });
                              } else {
                                setState(() {
                                  isSname = false;
                                });
                              }
                            },
                            hintText: "Store Name",
                            errorText: isSname == false
                                ? "store name must be more than 2 characters"
                                : null,
                            controller: _storeName,
                            // prefix: Icons.person_outline_rounded,
                          ))),
                  Expanded(child: Container()),
                  Center(
                      child: Container(
                    width: MediaQuery.of(context).size.width / 1.1,
                    height: 60,
                    margin: EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      color: ceoPurple,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: MaterialButton(
                      onPressed: isFname == true &&
                              isLname == true &&
                              isSname == true
                          ? () {
                              sellerViewModel.setFirstname(_firstName.text);
                              sellerViewModel.setLastname(_lastName.text);
                              sellerViewModel.setUsername(_storeName.text);
                              RouteController().push(context, ProfilePicture());
                              print(sellerViewModel.firstname);
                            }
                          : null,
                      child: Text(
                        "Next",
                        style: TextStyle(
                            color: ceoWhite, fontSize: TextSize().h3(context)),
                      ),
                    ),
                  ))
                ],
              ),
            ),
          )),
    );
  }
}
