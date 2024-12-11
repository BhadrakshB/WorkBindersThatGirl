import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ProductImageCarousel extends StatefulWidget {
  @override
  State<ProductImageCarousel> createState() => _ProductImageCarouselState();
}

class _ProductImageCarouselState extends State<ProductImageCarousel> {
  final List<String> images = [
    'assets/images/product1.jpg',
    'assets/images/product2.jpg',
    'assets/images/product3.jpg',
  ];

  int currentImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            CarouselSlider(
            options: CarouselOptions(height: 300.0, enableInfiniteScroll: true, onPageChanged: (index, reason) {
          
              setState(() {
                currentImageIndex = index;
                print(" currentImageIndex: $currentImageIndex");
              });
            },),
            items: images.map((image) {
              return Builder(
                builder: (BuildContext context) {
                  return Image.asset(image, fit: BoxFit.cover, width: double.infinity);
                },
              );
            }).toList(),
          ),
          Positioned(
            bottom: 10,
            left: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    // rating.toStringAsFixed(1),
                    "RATING NUMBER",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Icon(
                    Icons.star,
                    color: Colors.pink,
                    size: 16,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    // '$totalReviews Reviews',
                    "TOTAL REVIEWS",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ),],
        ),
        SizedBox(height: 10),
SizedBox(
  height: 14,
  child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: images.map((image) {
              int index = images.indexOf(image);
              return AnimatedContainer(
                duration: Duration(milliseconds: 200),
                width: currentImageIndex == index ? 12: 8.0,
                height: currentImageIndex == index ? 12 : 8.0,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,

                  color: currentImageIndex == index ? Colors.pink : Colors.grey,
                ),
              );
            }).toList(),
          ),
),
      ],
    );
  }
}
