import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../core/services/authentication.dart';
import '../../../core/viewmodels/user_viewmodel.dart';
import '../../../utils/color.dart';
import '../../../utils/font_size.dart';
import '../../../utils/router.dart';
import '../../shared/popup.dart';

class ProfilePictureEdit extends StatefulWidget {
  @override
  ProfilePictureEditState createState() => ProfilePictureEditState();
}

class ProfilePictureEditState extends State<ProfilePictureEdit> {
  File? _image;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthenticationService>(context);
    final userViewModel = Provider.of<UserViewmodel>(context);
    Future getImage() async {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        _image = File(pickedFile.path);
        userViewModel.setImage(_image);
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
                  "Edit profile",
                  style: TextStyle(
                      color: ceoPurple, fontSize: TextSize().p(context)),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10, top: 10),
                child: Text(
                  "Change your profile picture",
                  style: TextStyle(
                      color: ceoPurple,
                      fontWeight: FontWeight.w500,
                      fontSize: TextSize().h1(context)),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10, top: 10),
                child: Text(
                  "${userViewModel.currentCeo?.firstname} be like say you don fine 📸",
                  style: TextStyle(
                      color: ceoPurpleGrey, fontSize: TextSize().h3(context)),
                ),
              ),
              Expanded(child: Container()),
              Center(
                  child: MaterialButton(
                      onPressed: getImage,
                      child: userViewModel.image == null
                          ? CircleAvatar(
                              radius: 100,
                              backgroundImage: NetworkImage(
                                  userViewModel.currentCeo!.imageUrl!),
                            )
                          : CircleAvatar(
                              radius: 100,
                              backgroundImage: FileImage(userViewModel.image!),
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
                    if (userViewModel.image == null) {
                      userViewModel.updateImage(
                          userViewModel.currentCeo?.imageUrl,
                          authService.userId);
                      setState(() {});
                    } else {
                      PopUp().popLoad(context);
                      userViewModel
                          .setImageUrl(userViewModel.image, authService.userId)
                          .then((value) {
                        userViewModel.updateImage(
                            userViewModel.imageUrl, authService.userId);
                        RouteController().pop(context);
                        PopUp().showSuccess(
                            "Profile picture updated successfully", context);
                        print(userViewModel.imageUrl);
                      });
                    }
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
