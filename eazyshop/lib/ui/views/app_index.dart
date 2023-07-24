// ignore_for_file: prefer_const_constructors

import 'package:eazyshop/ui/components/cart_icon.dart';
import 'package:eazyshop/ui/components/onbaording_one.dart';
import 'package:eazyshop/ui/views/cart_view.dart';
import 'package:eazyshop/utils/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import '../../core/services/authentication.dart';
import '../../utils/color.dart';
import '../../utils/font_size.dart';
import '../components/avatar.dart';
import 'categories.dart';

import 'home_view.dart';
import 'profile_view.dart';
import 'supercartview.dart';

class AppIndex extends StatefulWidget {
  @override
  AppIndexState createState() => AppIndexState();
}

class AppIndexState extends State<AppIndex> {
  final _advancedDrawerController = AdvancedDrawerController();
  bool? isDrawer;
  int currentIndex = 0;
  List children = [
    Home(),
    CategoriesView(),
    ProfileView(),
    Container(),
    Container()
  ];
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthenticationService>(context);
    return AdvancedDrawer(
        backdrop: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(color: greyOne),
        ),
        controller: _advancedDrawerController,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 250),
        animateChildDecoration: true,
        rtlOpening: false,
        // openScale: 1.0,
        disabledGestures: false,
        childDecoration: const BoxDecoration(
          // NOTICE: Uncomment if you want to add shadow behind the page.
          // Keep in mind that it may cause animation jerks.
          // boxShadow: <BoxShadow>[
          //   BoxShadow(
          //     color: Colors.black12,
          //     blurRadius: 0.0,
          //   ),
          // ],
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        // ignore: sort_child_properties_last
        child: Scaffold(
          appBar: AppBar(
            actions: [
              CartIcon(
                onPressed: () {
                  RouteController().push(context, SuperCartScreen());
                },
              )
            ],
            title: currentIndex == 1
                ? Text(
                    'Categories',
                    style: TextStyle(
                        color: ceoPurple, fontSize: TextSize().h2(context)),
                  )
                : null,
            leading: IconButton(
              onPressed: _handleMenuButtonPressed,
              icon: ValueListenableBuilder<AdvancedDrawerValue>(
                valueListenable: _advancedDrawerController,
                builder: (_, value, __) {
                  return AnimatedSwitcher(
                    duration: Duration(milliseconds: 300),
                    child: Icon(
                      value.visible ? Icons.clear : Icons.menu,
                      color: ceoPurple,
                      key: ValueKey<bool>(value.visible),
                    ),
                  );
                },
              ),
            ),
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
        ),
        drawer: Container(
          height: MediaQuery.of(context).size.height,
          width: 500,
        ));
  }

  void _handleMenuButtonPressed() {
    if (!_advancedDrawerController.value.visible) {
      _advancedDrawerController.showDrawer();
    } else {
      _advancedDrawerController.hideDrawer();
    }
  }

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}
