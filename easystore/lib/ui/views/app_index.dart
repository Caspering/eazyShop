// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import '../../core/services/authentication.dart';
import '../../utils/color.dart';
import '../../utils/font_size.dart';
import '../components/avatar.dart';
import 'categories.dart';

import 'profile_view.dart';

class AppIndex extends StatefulWidget {
  @override
  AppIndexState createState() => AppIndexState();
}

class AppIndexState extends State<AppIndex> {
  final _advancedDrawerController = AdvancedDrawerController();
  bool? isDrawer;
  int currentIndex = 0;
  List children = [CategoriesView(), ProfileView(), Container(), Container()];
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthenticationService>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ceoWhite,
        elevation: 0.0,
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: ceoWhite,
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          backgroundColor: ceoWhite,
          selectedItemColor: ceoPink,
          unselectedItemColor: ceoPurple,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 5.0,
          // ignore: prefer_const_literals_to_create_immutables
          items: [
            BottomNavigationBarItem(
                label: "Home",
                icon: Icon(
                  Icons.home,
                  size: 20,
                )),
            BottomNavigationBarItem(
                label: "",
                icon: Icon(
                  Icons.delivery_dining,
                  size: 20,
                )),
            BottomNavigationBarItem(
                label: "",
                icon: Icon(
                  Icons.book,
                  size: 20,
                )),
            BottomNavigationBarItem(
                label: "",
                icon: Icon(
                  Icons.label,
                  size: 20,
                )),
            BottomNavigationBarItem(
                label: "",
                icon: Icon(
                  Icons.receipt,
                  size: 20,
                ))
          ],
          onTap: onTabTapped,
        ),
      ),
      body: children[currentIndex],
    );
  }

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}
