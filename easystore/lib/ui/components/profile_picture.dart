import 'dart:io';

import 'package:easystore/core/viewmodels/seller_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../core/services/authentication.dart';
import '../../core/viewmodels/user_viewmodel.dart';
import '../../utils/color.dart';
import '../../utils/font_size.dart';
import '../../utils/router.dart';
import '../shared/popup.dart';
import 'socials.dart';

class ProfilePicture extends StatefulWidget {
  @override
  ProfilePictureState createState() => ProfilePictureState();
}

class ProfilePictureState extends State<ProfilePicture> {
  File? _image;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthenticationService>(context);
    final sellerViewModel = Provider.of<SellerViewmodel>(context);
    Future getImage() async {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        _image = File(pickedFile.path);
        sellerViewModel.setImage(_image);
      } else {
        return;
      }
    }

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 10, top: 15),
                child: Text(
                  "Complete registration 2/3",
                  style: TextStyle(
                      color: ceoPurple, fontSize: TextSize().p(context)),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10, top: 10),
                child: Text(
                  "Add a store logo",
                  style: TextStyle(
                      color: ceoPurple,
                      fontWeight: FontWeight.w500,
                      fontSize: TextSize().h1(context)),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10, top: 10),
                child: Text(
                  "${sellerViewModel.firstname} add a logo for ${sellerViewModel.username}",
                  style: TextStyle(
                      color: ceoPurpleGrey, fontSize: TextSize().h3(context)),
                ),
              ),
              Expanded(child: Container()),
              Center(
                  child: MaterialButton(
                      onPressed: getImage,
                      child: sellerViewModel.image == null
                          ? Container(
                              height: 200,
                              width: 200,
                              child: Center(
                                child: Icon(
                                  Icons.image,
                                  size: 100,
                                  color: ceoPurpleGrey,
                                ),
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: greyOne),
                            )
                          : CircleAvatar(
                              radius: 100,
                              backgroundImage:
                                  FileImage(sellerViewModel.image!),
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
                  onPressed: sellerViewModel.image != null
                      ? () async {
                          if (sellerViewModel.imageUrl == null) {
                            PopUp().popLoad(context);
                            // ignore: avoid_single_cascade_in_expression_statements
                            sellerViewModel
                                .setImageUrl(
                                    sellerViewModel.image, authService.userId)
                                .then((value) {
                              RouteController().pop(context);
                              RouteController().push(context, Socials());
                              print(sellerViewModel.imageUrl);
                            }).catchError((e) {
                              PopUp().showError(e.message, context);
                            });
                          } else {
                            RouteController().push(context, Socials());
                          }
                        }
                      : () {
                          PopUp().showError("Please add an image", context);
                        },
                  child: Text(
                    "Next",
                    style: TextStyle(
                        color: ceoWhite, fontSize: TextSize().h3(context)),
                  ),
                ),
              )),
              Container(
                height: 20,
              )
            ],
          ),
        ));
  }
}
