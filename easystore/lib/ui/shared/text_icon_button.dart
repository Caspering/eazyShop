import 'package:flutter/material.dart';

import '../../utils/color.dart';
import '../../utils/font_size.dart';

class TextIcon extends StatefulWidget {
  final String? text;
  final IconData? icon;
  Function()? onPressed;
  Color? color;
  TextIcon({this.icon, this.onPressed, this.text, this.color});
  @override
  TextIconState createState() => TextIconState();
}

class TextIconState extends State<TextIcon> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.width / 7.5,
                width: MediaQuery.of(context).size.width / 7.5,
                child: Center(
                  child: Icon(
                    widget.icon,
                    size: TextSize().h(context),
                    color: ceoWhite,
                  ),
                ),
                decoration: BoxDecoration(
                    color: widget.color,
                    borderRadius: BorderRadius.circular(
                        (MediaQuery.of(context).size.width / 7.5) / 2)),
              ),
              Container(
                margin: EdgeInsets.only(top: 3),
                child: Text(
                  widget.text!,
                  style: TextStyle(
                      color: ceoPurple,
                      fontSize: TextSize().custom(9, context)),
                ),
              )
            ],
          )),
    );
  }
}
