import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import '../../core/models/user_model.dart';
import '../../core/viewmodels/user_viewmodel.dart';

class ChatAvatar extends StatefulWidget {
  final String? userId;
  const ChatAvatar({Key? key, this.userId}) : super(key: key);

  @override
  State<ChatAvatar> createState() => _ChatAvatarState();
}

class _ChatAvatarState extends State<ChatAvatar> {
  @override
  Widget build(BuildContext context) {
    UserViewmodel _userViewmodel = Provider.of<UserViewmodel>(context);
    return FutureBuilder<Users>(
        future: _userViewmodel.getCeoById(widget.userId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return CircleAvatar(
              backgroundImage: NetworkImage(snapshot.data?.imageUrl ?? ""),
            );
          } else {
            return Container();
          }
        });
  }
}
