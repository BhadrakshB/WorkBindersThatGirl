import 'package:flutter/material.dart';
import 'mock_data.dart';
import 'models/product.dart';
import 'screens/product_detail_screen.dart';

void main() {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var details = Product.fromJson(
        mock_data['product']
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Commerce App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: ProductDetailScreen(productDetails: details),
    );
  }
}
