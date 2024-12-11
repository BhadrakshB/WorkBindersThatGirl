import 'package:flutter/material.dart';
import 'package:working_demo/widgets/delivery_details.dart';
import '../widgets/product_header.dart';
import '../widgets/product_image_carousel.dart';
import '../widgets/product_details.dart';
import '../widgets/related_products.dart';
import '../widgets/ratings_reviews.dart';
import '../widgets/footer_actions.dart';

class ProductDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProductHeader(),
      body: ListView(
        children: [
          ProductImageCarousel(),
          ProductDetails(),
          DeliveryDetailsWidget(),
          RatingsReviews(),
          RelatedProducts(),
        ],
      ),
      bottomNavigationBar: FooterActions(),
    );
  }
}
