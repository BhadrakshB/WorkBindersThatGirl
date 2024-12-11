import 'package:working_demo/models/related_product.dart';
import 'package:working_demo/models/size_option.dart';

import 'color_option.dart';
import 'customer_review.dart';

class Product {
  final String title;
  final List<String> productImages;
  final int totalReviews;
  final double avgRating;
  final String currPrice;
  final String origPrice;
  final String discountPercentage;
  final String description;
  final List<ColorOption> availableColors;
  final List<SizeOption> availableSizes;
  final String aboutTheProduct;
  final String washCareInstructions;
  final String serviceAndPolicy;
  final double avgRatings;
  final int ratingsCount;
  final double sizing;
  final double quality;
  final double fit;
  final double recommend;
  final List<String> reviewPhotos;
  final List<CustomerReview> customerReviews;
  final List<RelatedProduct> relatedProducts;

  Product({
    required this.title,
    required this.productImages,
    required this.totalReviews,
    required this.avgRating,
    required this.currPrice,
    required this.origPrice,
    required this.discountPercentage,
    required this.description,
    required this.availableColors,
    required this.availableSizes,
    required this.aboutTheProduct,
    required this.washCareInstructions,
    required this.serviceAndPolicy,
    required this.avgRatings,
    required this.ratingsCount,
    required this.sizing,
    required this.quality,
    required this.fit,
    required this.recommend,
    required this.reviewPhotos,
    required this.customerReviews,
    required this.relatedProducts,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      title: json['title'],
      productImages: List<String>.from(json['productImages']),
      totalReviews: json['totalReviews'],
      avgRating: json['avgRating'].toDouble(),
      currPrice: json['currPrice'],
      origPrice: json['origPrice'],
      discountPercentage: json['discountPercentage'],
      description: json['description'],
      availableColors: (json['availableColors'] as List)
          .map((color) => ColorOption.fromJson(color))
          .toList(),
      availableSizes: (json['availableSizes'] as List)
          .map((size) => SizeOption.fromJson(size))
          .toList(),
      aboutTheProduct: json['aboutTheProduct'],
      washCareInstructions: json['washCareInstructions'],
      serviceAndPolicy: json['serviceAndPolicy'],
      avgRatings: json['avgRatings'].toDouble(),
      ratingsCount: json['ratingsCount'],
      sizing: json['sizing'].toDouble(),
      quality: json['quality'].toDouble(),
      fit: json['fit'].toDouble(),
      recommend: json['recommend'].toDouble(),
      reviewPhotos: List<String>.from(json['reviewPhotos']),
      customerReviews: (json['customerReviews'] as List)
          .map((review) => CustomerReview.fromJson(review))
          .toList(),
      relatedProducts: (json['relatedProducts'] as List)
          .map((product) => RelatedProduct.fromJson(product))
          .toList(),
    );
  }
}
