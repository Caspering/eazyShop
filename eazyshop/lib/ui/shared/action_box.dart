import 'package:flutter/material.dart';

import '../../utils/color.dart';
import '../../utils/font_size.dart';
import 'icon_circle.dart';

class ActionBox extends StatefulWidget {
  final Icon? icon;
  final String? text;
  final Color? color;
  final Function()? onTapped;

  const ActionBox({Key? key, this.icon, this.text, this.color, this.onTapped})
      : super(key: key);

  @override
  State<ActionBox> createState() => _ActionBoxState();
}

class _ActionBoxState extends State<ActionBox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: widget.onTapped,
        child: Container(
          padding: EdgeInsets.all(7),
          width: MediaQuery.of(context).size.width / 2.3,
          height: MediaQuery.of(context).size.width / 2.3,
          decoration: BoxDecoration(
              color: greyOne, borderRadius: BorderRadius.circular(15)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconCircle(
                icon: widget.icon?.icon,
                color: widget.color,
              ),
              Container(
                margin: EdgeInsets.only(top: 5, left: 7),
                child: Text(
                  widget.text!,
                  style: TextStyle(
                      color: ceoPurple, fontSize: TextSize().p(context)),
                ),
              )
            ],
          ),
        ));
  }
}
