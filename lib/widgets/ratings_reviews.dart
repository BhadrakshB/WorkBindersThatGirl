import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:working_demo/models/customer_review.dart';
import 'package:working_demo/widgets/grid_indicator.dart';
import 'review_card.dart';

class RatingsReviews extends StatelessWidget {
  final double rating;
  final int totalReviews;
  final double sizing;
  final double quality;
  final double fit;
  final double wouldRecommend;
  final List<String> reviewImages;
  final List<CustomerReview> reviews;

  RatingsReviews({
    this.rating = 4.5,
    this.totalReviews = 237,
    this.sizing = 4.1,
    this.quality = 4.5,
    this.fit = 4.1,
    this.wouldRecommend = 0.87,
    required this.reviewImages,
    required this.reviews,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Ratings & Reviews',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Text(
                'Write Review',
                style: TextStyle(
                    color: Colors.pink,
                    decorationStyle: TextDecorationStyle.solid,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.pink),
              ),
            ],
          ),
          SizedBox(height: 30),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Circular Indicator
              Text('$rating/5', style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),

              // Title
              RatingBar(
                ignoreGestures: true,
                initialRating: rating,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                ratingWidget: RatingWidget(
                  full: Icon(
                    Icons.star,
                    color: Colors.pink,
                  ),
                  half: Icon(
                    Icons.star_half,
                    color: Colors.pink,
                  ),
                  empty: Icon(
                    Icons.star_border,
                    color: Colors.pink,
                  ),
                ),
                onRatingUpdate: (double value) {},
              ),
              const SizedBox(height: 4),

              // Subtitle
              Text(
                "Based on $totalReviews Star Ratings",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
          Divider(),
          SizedBox(height: 20),
          GridIndicatorWidget(
            indicators: [
              IndicatorData(
                  title: 'Sizing',
                  subtitle: 'True to Size',
                  value: sizing,
                  widget: Icon(Icons.arrow_back_outlined)),
              IndicatorData(
                title: 'Quality',
                subtitle: 'Out of 5',
                value: quality,
                widget: Text(
                  "${quality * 5}",
                  style: TextStyle(fontSize: 18, color: Colors.pink, fontWeight: FontWeight.bold),
                ),
              ),
              IndicatorData(
                title: 'Fit',
                subtitle: 'Out of 5',
                value: fit,
                widget: Text(
                  "${fit * 5}",
                  style: TextStyle(fontSize: 18, color: Colors.pink, fontWeight: FontWeight.bold),
                ),
              ),
              IndicatorData(
                title: 'Would Recommend',
                subtitle: 'Total $totalReviews recommendations',
                value: 0.87,
                widget: Text(
                  "${(wouldRecommend * 100).round()}",
                  style: TextStyle(fontSize: 18, color: Colors.pink, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Divider(),
          SizedBox(height: 20),
          Row(
            children: [
              Text(
                'Reviews Photos (${reviewImages.length})',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 150,
                  child: ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(0),
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          reviewImages[index],
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),

          // Reviews

          Divider(),
          SizedBox(height: 20),

          Row(
            children: [
              Text(
                'Customer Reviews (${reviews.length})',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          Column(
            children: reviews.map((review) {
              return ReviewCard(
                reviewerName: review.reviewerName,
                reviewDate: review.dateOfVerification,
                rating: review.rating.toDouble(),
                title: review.subject,
                description: review.description,
                images: review.images,
                isVerified: review.isVerified,
                helpfulCount: review.helpfulCount,
              );
            }).toList(),
          ),
          const SizedBox(height: 20),
          TextButton(
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
              backgroundColor: Colors.transparent,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              side: const BorderSide(
                color: Colors.black,
                width: 1,
              ),
            ),
            onPressed: () {
              // Implement ZIP check logic
            },
            child: const Text(
              'SEE ALL REVIEWS',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),

          SizedBox(height: 20),
          Divider(),
        ],
      ),
    );
  }
}
