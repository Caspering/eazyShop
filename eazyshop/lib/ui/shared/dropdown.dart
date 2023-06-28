// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../utils/color.dart';
import '../../utils/font_size.dart';

class CeoDropdown extends StatefulWidget {
  final String? hint;
  final List<String>? items;
  final String? value;
  Function? onChanged;
  CeoDropdown({Key? key, this.hint, this.items, this.value, this.onChanged})
      : super(key: key);
  @override
  CeoDropdownState createState() => CeoDropdownState();
}

class CeoDropdownState extends State<CeoDropdown> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: greyOne),
        width: MediaQuery.of(context).size.width / 1.1,
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        child: Theme(
          data: Theme.of(context).copyWith(canvasColor: ceoWhite),
          child: DropdownButton(
            menuMaxHeight: MediaQuery.of(context).size.height / 2.5,
            value: widget.value,
            style: TextStyle(color: ceoBlack),
            isExpanded: true,
            iconEnabledColor: ceoPurple,
            iconDisabledColor: ceoPurple,
            hint: Text(
              widget.hint!,
              style: TextStyle(
                  color: ceoPurpleGrey,
                  fontSize: TextSize().p(context),
                  fontWeight: FontWeight.w500),
            ),
            underline: Text(''),
            onChanged: (value) {
              widget.onChanged!(value);
            },
            items: widget.items?.map((val) {
              return DropdownMenuItem(
                value: val,
                child: Text(
                  val,
                  style: TextStyle(
                      fontSize: TextSize().p(context), color: ceoPurple),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
