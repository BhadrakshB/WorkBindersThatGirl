import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:working_demo/widgets/show_image_preview.dart';

class ReviewCard extends StatefulWidget {
  final String title;
  final String description;
  final List<String>? images;
  final String reviewerName;
  final String reviewDate;
  final double rating;
  final int helpfulCount;
  final bool isVerified;

  const ReviewCard({
    Key? key,
    required this.title,
    required this.description,
    this.images,
    required this.reviewerName,
    required this.reviewDate,
    required this.rating,
    required this.helpfulCount,
    required this.isVerified,
  }) : super(key: key);

  @override
  State<ReviewCard> createState() => _ReviewCardState();
}

class _ReviewCardState extends State<ReviewCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(

      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Rating and Title

            RatingBar(
              itemSize: 30,
              ignoreGestures: true,
              initialRating: widget.rating,
              direction: Axis.horizontal,
              allowHalfRating: true, ratingWidget: RatingWidget(
              full: const Icon(Icons.star_rounded, color: Colors.pink,),
              half: const Icon(Icons.star_half_rounded, color: Colors.pink,),
              empty: const Icon(Icons.star_border_rounded, color: Colors.pink,),
            ),
              itemCount: 5,
              // itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              onRatingUpdate: (double value) {  },
            ),
            const SizedBox(width: 12),

            Text(
              widget.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),

            // Review Text
          RichText(
            text: TextSpan(
              children: [
                // Display the main description text
                TextSpan(
                  text: widget.description.length <= 100
                      ? widget.description // Show the full description if it's short
                      : isExpanded
                      ? widget.description // Show full description if expanded
                      : "${widget.description.substring(0, 100)}...", // Show truncated description otherwise
                  style: const TextStyle(color: Colors.black, fontSize: 14),
                ),
                if (widget.description.length > 100) // Show "See more" or "See less" only if description is long
                  TextSpan(
                    text: isExpanded ? " See less" : " See more",
                    style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 14),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // Toggle the expanded state
                        setState(() {
                          isExpanded = !isExpanded;
                        });
                      },
                  ),
              ],
            ),
          ),


            const SizedBox(height: 8),

            // Images Section
            if (widget.images != null && widget.images!.isNotEmpty)
              SizedBox(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: widget.images!.map((imageUrl) {
                    return GestureDetector(
                      onTap: () => showImagePreview(context, imageUrl),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: SizedBox(
                          width: 100,
                          child: isNetworkImage(imageUrl) ? Image.network(
                            imageUrl,
                            width: 70,
                            fit: BoxFit.cover,
                          ) : Image.asset(
                            imageUrl,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            const SizedBox(height: 12),

            // Reviewer Details
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.reviewerName,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.verified, color: Colors.blue, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          "Verified Buyer, ${widget.reviewDate}",
                          style: const TextStyle(color: Colors.grey, fontSize: 11),
                        ),
                      ],
                    )
                  ],
                ),
                Spacer(),
                Text(
                  "Helpful ?",
                  style: const TextStyle(color: Colors.grey, fontSize: 11),
                ),
                IconButton(

                  onPressed: () {},
                  visualDensity: VisualDensity.compact,
                  padding: EdgeInsets.zero,
                  icon: const Icon(Icons.thumb_up_alt_outlined, size: 16, ),
                ),
                Text(
                  widget.helpfulCount.toString(),
                  style: const TextStyle(color: Colors.grey, fontSize: 11),
                ),
                IconButton(
                  onPressed: () {},
                  visualDensity: VisualDensity.compact,

                  padding: EdgeInsets.zero,
                  icon: const Icon(Icons.more_vert),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
