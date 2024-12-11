import 'package:flutter/material.dart';

class RelatedProducts extends StatelessWidget {
  final List<Map<String, String>> products = [
    {'image': 'assets/images/product1.jpg', 'title': 'Printed Dress', 'price': '₹1,199'},
    {'image': 'assets/images/product2.jpg', 'title': 'Casual Gown', 'price': '₹1,299'},
    {'image': 'assets/images/product3.jpg', 'title': 'Evening Dress', 'price': '₹1,499'},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text('You Might Also Like', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Image.asset(product['image']!, width: 120, height: 120),
                    Text(product['title']!, style: TextStyle(fontSize: 14)),
                    Text(product['price']!, style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
