// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/services/authentication.dart';
import '../../../core/viewmodels/user_viewmodel.dart';
import '../../../utils/color.dart';
import '../../../utils/font_size.dart';
import '../../../utils/router.dart';
import '../../shared/popup.dart';
import '../../shared/textfield.dart';

class SocialsEdit extends StatefulWidget {
  @override
  SocialsEditState createState() => SocialsEditState();
}

class SocialsEditState extends State<SocialsEdit> {
  bool? isPhoneNumber;
  TextEditingController _phoneField = TextEditingController();
  TextEditingController _walink = TextEditingController();
  TextEditingController _iglink = TextEditingController();
  TextEditingController _twlink = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthenticationService>(context);
    final userViewModel = Provider.of<UserViewmodel>(context);
    _phoneField.text = userViewModel.phoneNumber!;
    _iglink.text = userViewModel.instagramLink ?? "";
    _twlink.text = userViewModel.twitterLink ?? "";
    _walink.text = userViewModel.whatsappLink ?? "";
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
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
                              "Edit profile",
                              style: TextStyle(
                                  color: ceoPurple,
                                  fontSize: TextSize().p(context)),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10, top: 10),
                            child: Text(
                              "Edit contact details",
                              style: TextStyle(
                                  color: ceoPurple,
                                  fontWeight: FontWeight.w500,
                                  fontSize: TextSize().h1(context)),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10, top: 10),
                            child: Text(
                              "Update your contact details so buyers can reach you",
                              style: TextStyle(
                                  color: ceoPurpleGrey,
                                  fontSize: TextSize().h3(context)),
                            ),
                          ),
                          Center(
                              child: Container(
                                  margin: EdgeInsets.only(top: 15),
                                  child: CustomTextField(
                                    hintText: "Phone number",
                                    onChanged: (text) {
                                      userViewModel.setPhoneNumber(text);
                                    },
                                    controller: _phoneField,
                                    // prefix: Icons.person_outline_rounded,
                                  ))),
                          Center(
                              child: Container(
                                  child: CustomTextField(
                            hintText: "Twitter link (optional)",
                            onChanged: (text) {
                              userViewModel.setTwitterLink(text);
                            },
                            controller: _twlink,
                            // prefix: Icons.person_outline_rounded,
                          ))),
                          Center(
                              child: Container(
                                  child: CustomTextField(
                            onChanged: (text) {
                              userViewModel.setWhatsappLink(text);
                            },
                            hintText: "Whatsapp link (optional)",

                            controller: _walink,
                            // prefix: Icons.person_outline_rounded,
                          ))),
                          Center(
                              child: Container(
                                  child: CustomTextField(
                            onChanged: (text) {
                              userViewModel.setInstagramLink(text);
                            },
                            hintText: "Instagram link (optional)",

                            controller: _iglink,
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
                              onPressed: () async {
                                if (_phoneField.text.length == 11) {
                                  await userViewModel.updateSocials(
                                      _iglink.text,
                                      _walink.text,
                                      _twlink.text,
                                      _phoneField.text,
                                      authService.userId);
                                  PopUp().showSuccess(
                                      "Details updated successfully", context);
                                  userViewModel.addCeoScore(authService.userId);
                                } else {
                                  userViewModel.updateSocials(
                                      _iglink.text,
                                      _walink.text,
                                      _twlink.text,
                                      userViewModel.currentCeo?.phoneNumber,
                                      authService.userId);
                                  setState(() {});
                                }
                              },
                              child: Text(
                                "Update",
                                style: TextStyle(
                                    color: ceoWhite,
                                    fontSize: TextSize().h3(context)),
                              ),
                            ),
                          )),
                          Container(
                            height: 20,
                          )
                        ])))));
  }
}
