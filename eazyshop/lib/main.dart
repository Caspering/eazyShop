import 'package:eazyshop/core/viewmodels/cart_viewmodel.dart';
import 'package:eazyshop/core/viewmodels/order_viewmodel.dart';
import 'package:eazyshop/core/viewmodels/seller_viewmodel.dart';
import 'package:eazyshop/ui/components/onbaording_one.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/services/authentication.dart';
import 'core/viewmodels/product_viewmodel.dart';
import 'core/viewmodels/user_viewmodel.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

AuthenticationService _authenticationService = AuthenticationService();
UserViewmodel _userViewmodel = UserViewmodel();
ProductViewmodel _productViewmodel = ProductViewmodel();
CartViewmodel _cartViewmodel = CartViewmodel();
SellerViewmodel _sellerViewmodel = SellerViewmodel();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) {
            return _authenticationService;
          }),
          ChangeNotifierProvider(create: (_) {
            return _userViewmodel;
          }),
          ChangeNotifierProvider(create: (_) {
            return _productViewmodel;
          }),
          ChangeNotifierProvider(create: (_) {
            return _cartViewmodel;
          }),
          ChangeNotifierProvider(create: (_) {
            return _sellerViewmodel;
          })
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            primarySwatch: Colors.blue,
          ),
          home: OnboardingOne(),
        ));
  }
}
