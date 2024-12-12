import 'package:flutter/material.dart';
import 'package:working_demo/widgets/show_image_preview.dart';

import '../models/related_product.dart';

class RelatedProducts extends StatelessWidget {
  final List<RelatedProduct> products;

  const RelatedProducts({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Section Title
          const Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "You Might Also Like",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 8),
          const Divider(
            color: Colors.pink,
            thickness: 1,
          ),
          const SizedBox(height: 16),
          // Products Grid
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: GridView.builder(
              shrinkWrap: true,
              // Ensures the grid fits within its parent scroll view
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 items per row
                childAspectRatio: 0.65, // Adjust this to match the aspect ratio
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 0.0,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final RelatedProduct product = products[index];
                return ProductCard(
                  image: product.image,
                  price: product.currPrice,
                  title: product.title,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String image;
  final String price;
  final String title;

  const ProductCard({
    super.key,
    required this.image,
    required this.price,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Product Image with Favorite Icon
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(0),
              child: isNetworkImage(image)
                  ? Image.network(
                      image,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      image,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
            ),
            const Positioned(
              top: 8,
              right: 8,
              child: Icon(
                Icons.favorite_border_rounded,
                color: Colors.white,
                fill: 1,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        // Product Price
        Text(
          price,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        // Product Title
        Text(
          title,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
