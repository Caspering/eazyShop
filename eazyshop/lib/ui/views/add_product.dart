import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../core/models/product_model.dart';
import '../../core/services/authentication.dart';
import '../../core/viewmodels/product_viewmodel.dart';
import '../../core/viewmodels/user_viewmodel.dart';
import '../../utils/categories.dart';
import '../../utils/color.dart';
import '../../utils/font_size.dart';
import '../../utils/router.dart';
import '../shared/dropdown.dart';
import '../shared/icon_circle.dart';
import '../shared/popup.dart';
import '../shared/textfield.dart';

class AddProduct extends StatefulWidget {
  @override
  AddProductState createState() => AddProductState();
}

class AddProductState extends State<AddProduct> {
  File? _image;
  final picker = ImagePicker();
  TextEditingController _pnameField = TextEditingController();
  TextEditingController _priceField = TextEditingController();
  TextEditingController _description = TextEditingController();
  bool? isName;
  bool? isprice;
  bool? isdescp;
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthenticationService>(context);
    final userViewModel = Provider.of<UserViewmodel>(context);
    final productViewmodel = Provider.of<ProductViewmodel>(context);
    Future getImage() async {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        _image = File(pickedFile.path);
        productViewmodel.setImage(_image);
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
        width: double.infinity,
        padding: EdgeInsets.only(left: 10, right: 5),
        height: double.infinity,
        color: ceoWhite,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconCircle(
                icon: Icons.add_business,
                color: ceoPurple,
              ),
              Container(
                margin: EdgeInsets.only(top: 7),
                child: Text(
                  "Add a new product",
                  style: TextStyle(
                      color: ceoPurple,
                      fontWeight: FontWeight.w500,
                      fontSize: TextSize().h2(context)),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 6),
                child: Text(
                  "Add a products for your customers to buy. No commission required.🎉",
                  style: TextStyle(
                      color: ceoPurpleGrey, fontSize: TextSize().h3(context)),
                ),
              ),
              Container(
                height: 20,
              ),
              Center(
                child: CustomTextField(
                    maxLines: 1,
                    errorText:
                        isName == false ? "Product name is required" : null,
                    onChanged: (String value) {
                      if (value.length > 2) {
                        setState(() {
                          isName = true;
                        });
                      } else {
                        setState(() {
                          isName = false;
                        });
                      }
                    },
                    hintText: "Product name",
                    controller: _pnameField),
              ),
              Center(
                child: CustomTextField(
                    maxLines: 1,
                    errorText: isprice == false ? "Price is required" : null,
                    onChanged: (String value) {
                      if (value.length > 2) {
                        setState(() {
                          isprice = true;
                        });
                      } else {
                        setState(() {
                          isprice = false;
                        });
                      }
                    },
                    hintText: "Price (in Naira)",
                    controller: _priceField),
              ),
              CeoDropdown(
                hint: "category",
                items: categories,
                value: productViewmodel.category,
                onChanged: (text) {
                  productViewmodel.setCategory(text);
                  print(productViewmodel.category);
                },
              ),
              Center(
                child: CustomTextField(
                  maxChar: 150,
                  errorText: isdescp == false
                      ? "Product description is required"
                      : null,
                  onChanged: (String value) {
                    if (value.length > 5) {
                      setState(() {
                        isdescp = true;
                      });
                    } else {
                      setState(() {
                        isdescp = false;
                      });
                    }
                  },
                  hintText: "Description",
                  controller: _description,
                  minLines: 5,
                ),
              ),
              Container(
                height: 20,
              ),
              Center(
                  child: MaterialButton(
                      onPressed: getImage,
                      child: productViewmodel.image == null
                          ? Container(
                              height: 200,
                              width: MediaQuery.of(context).size.width / 1.1,
                              child: Center(
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      // ignore: prefer_const_constructors
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: [
                                    Icon(
                                      Icons.image,
                                      size: 80,
                                      color: ceoPurple,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 6),
                                      child: Text(
                                        "Add product image",
                                        style: TextStyle(
                                            color: ceoPurple,
                                            fontSize: TextSize().h3(context)),
                                      ),
                                    ),
                                  ])),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: greyOne),
                            )
                          : Container(
                              height: 200,
                              width: MediaQuery.of(context).size.width / 1.1,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.contain,
                                      image:
                                          FileImage(productViewmodel.image!)),
                                  borderRadius: BorderRadius.circular(20),
                                  color: greyOne)))),
              Center(
                  child: Container(
                width: MediaQuery.of(context).size.width / 1.1,
                height: 60,
                margin: EdgeInsets.only(bottom: 10, top: 25),
                decoration: BoxDecoration(
                  color: isName == true &&
                          isdescp == true &&
                          isprice == true &&
                          productViewmodel.image != null
                      ? ceoPurple
                      : ceoPurpleGrey,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: MaterialButton(
                  onPressed: isName == true &&
                          isdescp == true &&
                          isprice == true &&
                          productViewmodel.image != null
                      ? () async {
                          PopUp().popLoad(context);
                          try {
                            var userData = await userViewModel
                                .getCeoById(authService.userId);
                            List? subscribers = userData.subscribers;
                            await productViewmodel.setImageUrl(
                                productViewmodel.image,
                                authService.userId! +
                                    DateTime.now().toIso8601String());
                            productViewmodel.addProduct(Product(
                              dateAdded: DateTime.now(),
                              description: _description.text,
                              isDiscounted: false,
                              isFlash: false,
                              price: int.parse(_priceField.text),
                              productImage: productViewmodel.imageUrl,
                              category: productViewmodel.category,
                              sellerId: authService.userId,
                              productName: _pnameField.text,
                            ));

                            productViewmodel.setCategory(null);
                            productViewmodel.setImage(null);
                            RouteController().pop(context);
                            PopUp().showSuccess(
                                "Products added successfully", context);
                            _description.clear();
                            _pnameField.clear();
                            _priceField.clear();
                            userViewModel.addCeoScore(authService.userId);
                          } on Exception catch (e) {
                            RouteController().pop(context);
                            PopUp().showError(e.toString(), context);
                          }
                        }
                      : null,
                  child: Text(
                    "Add product",
                    style: TextStyle(
                        color: ceoWhite, fontSize: TextSize().h3(context)),
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
