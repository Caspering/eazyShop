import 'dart:math';

import 'package:eazyshop/ui/shared/popup.dart';
import 'package:eazyshop/ui/shared/textfield.dart';
import 'package:eazyshop/ui/views/order_sucess.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/viewmodels/cart_viewmodel.dart';
import '../../core/viewmodels/seller_viewmodel.dart';
import '../../utils/color.dart';
import '../../utils/font_size.dart';
import '../../utils/router.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _deliveryInstruction = TextEditingController();
  TextEditingController _address = TextEditingController();
  bool? isAdd;
  bool? isPhone;
  bool? isInst;
  TimeOfDay? selectedTime;
  List<TimeOfDay> randomTimes = [];

  @override
  void initState() {
    super.initState();
    generateRandomTimes();
  }

  void generateRandomTimes() {
    final random = Random();
    for (int i = 0; i < 4; i++) {
      randomTimes.add(
        TimeOfDay(
          hour: random.nextInt(24),
          minute: random.nextInt(60),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    CartViewmodel _cartViewmodel = Provider.of<CartViewmodel>(context);
    final sellerViewmodel = Provider.of<SellerViewmodel>(context);
    String vendorId = _cartViewmodel.currentVendor ?? "";
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: ceoWhite,
        leading: IconButton(
          onPressed: () {
            RouteController().pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: ceoPurple,
            size: TextSize().h2(context),
          ),
        ),
        title: Text(
          "Checkout",
          style: TextStyle(color: ceoPurple, fontSize: TextSize().h3(context)),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(5),
        color: ceoWhite,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(
                labelText: "Phone number",
                maxLines: 1,
                hintText: "07089322045",
                maxChar: 11,
                controller: _phoneController,
                onChanged: (String value) {
                  if (value.length != 11) {
                    setState(() {
                      isPhone = false;
                    });
                  } else {
                    setState(() {
                      isPhone = true;
                    });
                  }
                },
                errorText: isPhone == false
                    ? "Phone number must be 11 characters"
                    : null,
              ),
              CustomTextField(
                  hintText: "No 55 pin street, Enugu",
                  labelText: "Delivery Address",
                  errorText: isAdd == false ? "Add delivery address" : null,
                  onChanged: (String value) {
                    if (value.length > 3) {
                      setState(() {
                        isAdd = true;
                      });
                    } else {
                      setState(() {
                        isAdd = false;
                      });
                    }
                  },
                  controller: _address),
              CustomTextField(
                  onChanged: (String value) {
                    if (value.length > 3) {
                      setState(() {
                        isInst = true;
                      });
                    } else {
                      isInst = false;
                    }
                  },
                  hintText:
                      "Delivery Instructions\neg. Let the banana not be too ripe",
                  maxChar: 200,
                  minLines: 5,
                  controller: _deliveryInstruction),
              ListTile(
                title: Text('Select a delivery Time:'),
                subtitle: Column(
                  children: randomTimes.map((time) {
                    return RadioListTile<TimeOfDay>(
                      activeColor: ceoPurple,
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        '${time.format(context)}',
                        style: TextStyle(fontSize: 16),
                      ),
                      value: time,
                      groupValue: selectedTime,
                      onChanged: (selected) {
                        setState(() {
                          selectedTime = selected!;
                        });
                      },
                    );
                  }).toList(),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Subtotal:',
                        style: TextStyle(
                          fontSize: TextSize().p(context),
                          fontWeight: FontWeight.w400,
                          color: ceoBlack,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      '\u20A6${_cartViewmodel.getCartSubtotalForVendor(vendorId)}',
                      style: TextStyle(
                        fontSize: TextSize().p(context),
                        fontWeight: FontWeight.w400,
                        color: ceoBlack,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Service Charge:',
                        style: TextStyle(
                          fontSize: TextSize().p(context),
                          fontWeight: FontWeight.w400,
                          color: ceoBlack,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      '\u20A6${_cartViewmodel.getCartTaxForVendor(vendorId).ceil()}',
                      style: TextStyle(
                        fontSize: TextSize().p(context),
                        fontWeight: FontWeight.w400,
                        color: ceoBlack,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Total:',
                        style: TextStyle(
                          fontSize: TextSize().p(context),
                          fontWeight: FontWeight.w400,
                          color: ceoBlack,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      '\u20A6${_cartViewmodel.getCartTotalForVendor(vendorId)}',
                      style: TextStyle(
                        fontSize: TextSize().p(context),
                        fontWeight: FontWeight.w400,
                        color: ceoBlack,
                      ),
                    ),
                  ),
                ],
              ),
              Center(
                  child: Container(
                width: MediaQuery.of(context).size.width / 1.1,
                height: 60,
                margin: EdgeInsets.only(bottom: 20, top: 20),
                decoration: BoxDecoration(
                  color: ceoPurple,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: MaterialButton(
                  onPressed: () async {
                    if (isAdd == true &&
                        isInst == true &&
                        isPhone == true &&
                        selectedTime != null) {
                      RouteController().push(context, OrderSuccess());
                    } else {
                      PopUp().showError("Fill all the fields", context);
                    }
                  },
                  child: Text(
                    "Continue to Payment",
                    style: TextStyle(
                        color: ceoWhite, fontSize: TextSize().h3(context)),
                  ),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
