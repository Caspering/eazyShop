import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/models/user_model.dart';
import '../../core/services/authentication.dart';
import '../../core/viewmodels/user_viewmodel.dart';
import '../../utils/color.dart';

class Avatar extends StatefulWidget {
  const Avatar({Key? key}) : super(key: key);

  @override
  State<Avatar> createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthenticationService>(context);
    final userViewModel = Provider.of<UserViewmodel>(context);
    return Placeholder();
    // return FutureBuilder<Users>(
    //   // future: userViewModel.getCeoById(authService.userId),
    //   builder: (context, snapshot) {
    //     if (!snapshot.hasData ||
    //         snapshot.connectionState == ConnectionState.waiting) {
    //       Container(
    //         child: CircleAvatar(
    //           radius: 7,
    //           backgroundColor: ceoWhite,
    //         ),
    //         padding: EdgeInsets.all(10),
    //       );
    //     }
    //     return Container(
    //       child: CircleAvatar(
    //         radius: 7,
    //         backgroundImage: NetworkImage(snapshot.data?.imageUrl ?? ""),
    //       ),
    //       padding: EdgeInsets.all(10),
    //     );
    //   },
    // );
  }
}
