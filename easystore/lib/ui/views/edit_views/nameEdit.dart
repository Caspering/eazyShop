// ignore_for_file: unused_local_ve

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/services/authentication.dart';
import '../../../core/viewmodels/user_viewmodel.dart';
import '../../../utils/color.dart';
import '../../../utils/font_size.dart';
import '../../../utils/router.dart';
import '../../shared/popup.dart';
import '../../shared/textfield.dart';

class FullnameEdit extends StatefulWidget {
  @override
  FullnameEditState createState() => FullnameEditState();
}

class FullnameEditState extends State<FullnameEdit> {
  TextEditingController _firstName = TextEditingController();
  TextEditingController _lastName = TextEditingController();
  TextEditingController _username = TextEditingController();
  bool? isFname;
  bool? isLname;
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthenticationService>(context);
    final userViewModel = Provider.of<UserViewmodel>(context);
    _firstName.text = userViewModel.firstname!;
    _lastName.text = userViewModel.lastname!;
    _username.text = userViewModel.username!;
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
                      "Edit info",
                      style: TextStyle(
                          color: ceoPurple, fontSize: TextSize().p(context)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, top: 10),
                    child: Text(
                      "Change your name",
                      style: TextStyle(
                          color: ceoPurple,
                          fontWeight: FontWeight.w500,
                          fontSize: TextSize().h1(context)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, top: 10),
                    child: Text(
                      "Please enter your new name",
                      style: TextStyle(
                          color: ceoPurpleGrey,
                          fontSize: TextSize().h3(context)),
                    ),
                  ),
                  Center(
                      child: Container(
                          margin: EdgeInsets.only(top: 15),
                          child: CustomTextField(
                            onChanged: (text) {
                              userViewModel.setFirstname(text);
                            },
                            hintText: "First name",

                            controller: _firstName,

                            // prefix: Icons.person_outline_rounded,
                          ))),
                  Center(
                      child: Container(
                          // margin: EdgeInsets.only(top),
                          child: CustomTextField(
                    onChanged: (text) {
                      userViewModel.setLastname(text);
                    },
                    hintText: "Last name",
                    controller: _lastName,
                    // prefix: Icons.person_outline_rounded,
                  ))),
                  Center(
                      child: Container(
                          margin: EdgeInsets.only(top: 15),
                          child: CustomTextField(
                            onChanged: (text) {
                              userViewModel.setUsername(text);
                            },
                            hintText: "Username",

                            controller: _username,
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
                        if (_firstName.text.length >= 3 &&
                            _lastName.text.length >= 3 &&
                            _username.text.length >= 2) {
                          await userViewModel.updateName(
                              _firstName.text,
                              _lastName.text,
                              authService.userId,
                              _username.text);
                          userViewModel.addCeoScore(authService.userId);
                          PopUp().showSuccess(
                              "Name updated successfully", context);
                        } else {
                          await userViewModel.updateName(
                              userViewModel.currentCeo!.firstname,
                              userViewModel.currentCeo!.lastname,
                              authService.userId,
                              _username.text);
                          setState(() {});
                        }
                      },
                      child: Text(
                        "Update",
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
