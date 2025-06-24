import 'package:flutter/material.dart';

import 'cart_screen.dart';

void main() {
  runApp(ShoppingCartApp());
}

class ShoppingCartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopping Cart',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffDB3022),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)
                )
            )
        ),
      ),
      home: ShoppingCartScreen(),
    );
  }
}