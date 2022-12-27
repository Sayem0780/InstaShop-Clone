import 'package:flutter/material.dart';
import 'package:instashop/provider/cart.dart';
import 'package:instashop/provider/products.dart';
import 'package:instashop/screens/checkoutpage.dart';
import 'package:instashop/screens/productpage.dart';
import 'package:instashop/screens/selecteditemPage.dart';
import 'package:instashop/widget/categorygrid.dart';
import 'package:instashop/screens/homepage.dart';
import 'package:instashop/screens/categorypage.dart';
import 'package:instashop/widget/dukangrid.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [

      ChangeNotifierProvider(
          create: (context)=>Products()
      ),
      ChangeNotifierProvider(
        create: (context)=> Cart(),
      ),
    ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'InstaShop',
        theme: ThemeData(
          //primarySwatch: Colors.red,
          //accentColor: Colors.amber,
          //backgroundColor: Colors.amber,
          primaryColor: Colors.pink,
          canvasColor: Colors.white,
        ),
        home: HomePage(),
        routes:{
          DukanGrid.routeName:(context)=> DukanGrid(),
          CategoryPage.routeName:(context)=>CategoryPage(),
          ProductPage.routeName:(context)=>ProductPage(),
          SelectedItemPage.routeName:(context)=>SelectedItemPage(),
          CheckOutPage.routeName:(context)=>CheckOutPage(),
        },
      ),
    );
  }
}

