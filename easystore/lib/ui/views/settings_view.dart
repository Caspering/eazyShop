import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/services/authentication.dart';
import '../../core/viewmodels/product_viewmodel.dart';
import '../../core/viewmodels/user_viewmodel.dart';
import '../../utils/color.dart';
import '../../utils/font_size.dart';
import '../../utils/router.dart';
import '../components/onbaording_one.dart';
import '../shared/icon_circle.dart';
import '../shared/popup.dart';
import 'edit_views/nameEdit.dart';
import 'edit_views/profile_picture_edit.dart';
import 'edit_views/socials_edit.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
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
              Icons.arrow_back_ios,
              color: ceoPurple,
            ),
          ),
        ),
        body: Container(
            //  alignment: Alignment.center,
            padding: EdgeInsets.only(left: 10, right: 5),
            height: double.infinity,
            width: MediaQuery.of(context).size.width,
            color: ceoWhite,
            child: SingleChildScrollView(
                child: Container(
                    child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconCircle(
                  icon: Icons.settings,
                  color: ceoPurple,
                ),
                Container(
                  margin: EdgeInsets.only(top: 7),
                  child: Text(
                    "Settings",
                    style: TextStyle(
                        color: ceoPurple,
                        fontWeight: FontWeight.w500,
                        fontSize: TextSize().h2(context)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 7),
                  child: Text(
                    "Make profile and account changes here",
                    style: TextStyle(
                        color: ceoPurpleGrey,
                        fontWeight: FontWeight.w500,
                        fontSize: TextSize().h3(context)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 7,
                  ),
                  width: MediaQuery.of(context).size.width,
                ),
                Container(
                  margin: EdgeInsets.only(top: 15, left: 7),
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    "Profile",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: ceoPurpleGrey,
                        fontSize: TextSize().custom(11, context)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(7),
                  width: MediaQuery.of(context).size.width,
                  child: ListTile(
                    onTap: () {
                      userViewModel
                          .setFirstname(userViewModel.currentCeo?.firstname);
                      userViewModel
                          .setLastname(userViewModel.currentCeo?.lastname);
                      userViewModel
                          .setUsername(userViewModel.currentCeo?.username);

                      RouteController().push(context, FullnameEdit());
                    },
                    contentPadding: EdgeInsets.zero,
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: ceoPurpleGrey,
                      size: TextSize().p(context),
                    ),
                    leading: Container(
                        margin: EdgeInsets.all(0),
                        child: Icon(
                          Icons.person,
                          color: ceoPurple,
                          // size: TextSize().p(context),
                        )),
                    title: Text(
                      "Update name",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: ceoPurple,
                          fontSize: TextSize().p(context)),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(
                    7,
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: ListTile(
                    onTap: () {
                      userViewModel.setInstagramLink(
                          userViewModel.currentCeo?.instagramLink);
                      userViewModel.setTwitterLink(
                          userViewModel.currentCeo?.twitterLink);
                      userViewModel.setWhatsappLink(
                          userViewModel.currentCeo?.whatsappLink);
                      userViewModel.setPhoneNumber(
                          userViewModel.currentCeo?.phoneNumber);
                      RouteController().push(context, SocialsEdit());
                    },
                    contentPadding: EdgeInsets.zero,
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: ceoPurpleGrey,
                      size: TextSize().p(context),
                    ),
                    leading: Icon(
                      Icons.phone_android,
                      color: ceoPurple,
                      // size: TextSize().p(context),
                    ),
                    title: Text(
                      "Update social links",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: ceoPurple,
                          fontSize: TextSize().p(context)),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(
                    7,
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: ListTile(
                    onTap: () {
                      RouteController().push(context, ProfilePictureEdit());
                    },
                    contentPadding: EdgeInsets.zero,
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: ceoPurpleGrey,
                      size: TextSize().p(context),
                    ),
                    leading: Icon(
                      Icons.person,
                      color: ceoPurple,
                      // size: TextSize().p(context),
                    ),
                    title: Text(
                      "Update profile picture",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: ceoPurple,
                          fontSize: TextSize().p(context)),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15, left: 7),
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    "Account",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: ceoPurpleGrey,
                        fontSize: TextSize().custom(11, context)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(
                    7,
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    onTap: () {
                      PopUp().askIsSure("Are you sure?", context, () {
                        authService.signOut().then((value) {
                          RouteController()
                              .pushAndRemoveUntil(context, OnboardingOne());
                        });
                      });
                    },
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: ceoPurpleGrey,
                      size: TextSize().p(context),
                    ),
                    leading: Icon(
                      Icons.logout,
                      color: ceoRed,
                      // size: TextSize().p(context),
                    ),
                    title: Text(
                      "Logout",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: ceoRed,
                          fontSize: TextSize().p(context)),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(
                    7,
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    onTap: () {
                      PopUp().askIsSure("Are you sure?", context, () {
                        authService.deleteAccount().then((value) {
                          RouteController()
                              .pushAndRemoveUntil(context, OnboardingOne());
                        });
                      });
                    },
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: ceoPurpleGrey,
                      size: TextSize().p(context),
                    ),
                    leading: Icon(
                      Icons.delete_forever,
                      color: ceoRed,
                      // size: TextSize().p(context),
                    ),
                    title: Text(
                      "Delete account",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: ceoRed,
                          fontSize: TextSize().p(context)),
                    ),
                  ),
                ),
              ],
            )))));
  }
}
