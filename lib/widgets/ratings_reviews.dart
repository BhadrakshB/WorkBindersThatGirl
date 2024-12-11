import 'package:flutter/material.dart';
import 'package:working_demo/widgets/grid_indicator.dart';
import 'review_card.dart';

class RatingsReviews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Ratings & Reviews', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18,), ),
              Text('Write Review', style: TextStyle(color: Colors.pink, decorationStyle: TextDecorationStyle.solid, decoration: TextDecoration.underline, decorationColor: Colors.pink),),

            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Text('4.0', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
              Icon(Icons.star, color: Colors.pink, size: 32),
              SizedBox(width: 10),
              Text('Based on 220 Ratings'),
            ],
          ),
          Divider(),
          GridIndicatorWidget(indicators: [
            IndicatorData(title: '5 Stars', subtitle: '150', value: 90, icon: Icons.star),
            IndicatorData(title: '5 Stars', subtitle: '150', value: 90, icon: Icons.star),
            IndicatorData(title: '5 Stars', subtitle: '150', value: 90, icon: Icons.star),
            IndicatorData(title: '5 Stars', subtitle: '150', value: 90, icon: Icons.star),
          ]),
          Divider(),
          ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [
              ReviewCard(
                userName: 'Sophia',
                date: 'March 5, 2024',
                content: 'Loved this dress! Perfect fit and great quality.',
                imagePath: 'assets/images/user1.jpg',
              ),
              ReviewCard(
                userName: 'Esther Howard',
                date: 'February 28, 2024',
                content: 'Nice buy, worth the money!',
                imagePath: 'assets/images/user2.jpg',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMetric(String label, double score) {
    return Column(
      children: [
        Text(score.toString(), style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Text(label, style: TextStyle(color: Colors.grey)),
      ],
    );
  }
}
