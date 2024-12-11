import 'package:flutter/material.dart';
import 'package:working_demo/widgets/delivery_details.dart';
import '../models/product.dart';
import '../widgets/product_header.dart';
import '../widgets/product_image_carousel.dart';
import '../widgets/product_details.dart';
import '../widgets/related_products.dart';
import '../widgets/ratings_reviews.dart';
import '../widgets/footer_actions.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product productDetails;

  ProductDetailScreen({required this.productDetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProductHeader(),
      body: ListView(
        children: [
          ProductImageCarousel(
            productAvgRating: productDetails.avgRating,
            productTotalRatings: productDetails.totalReviews,
            images: productDetails.productImages,
          ),
          ProductDetails(
            productTitle: productDetails.title,
            productDescription: productDetails.description,
            productCurrPrice: productDetails.currPrice,
            productOrigPrice: productDetails.origPrice,
            productDiscount: productDetails.discountPercentage,
            colorOptions: productDetails.availableColors,
            sizeOptions: productDetails.availableSizes,

          ),
          DeliveryDetailsWidget(
            aboutProduct: productDetails.aboutTheProduct,
            washCareInstructions: productDetails.washCareInstructions,
            servicePolicy: productDetails.serviceAndPolicy,
          ),
          RatingsReviews(
            rating: productDetails.avgRating,
            totalReviews: productDetails.totalReviews,
            sizing: productDetails.sizing,
            quality: productDetails.quality,
            fit: productDetails.fit,
            wouldRecommend: productDetails.recommend,
            reviewImages: productDetails.reviewPhotos,
            reviews: productDetails.customerReviews,
          ),
          RelatedProducts(
            products: productDetails.relatedProducts,
          ),
        ],
      ),
      bottomNavigationBar: FooterActions(),
    );
  }
}
