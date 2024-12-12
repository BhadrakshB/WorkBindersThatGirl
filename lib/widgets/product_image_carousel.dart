import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:working_demo/widgets/show_image_preview.dart';

class ProductImageCarousel extends StatefulWidget {
  final List<String> images;
  final int productTotalRatings;
  final double productAvgRating;

  const ProductImageCarousel({
    super.key,
    required this.images,
    required this.productTotalRatings,
    required this.productAvgRating,
  });

  @override
  State<ProductImageCarousel> createState() => _ProductImageCarouselState();
}

class _ProductImageCarouselState extends State<ProductImageCarousel> {
  int currentImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                  height: 400.0,
                  enableInfiniteScroll: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentImageIndex = index;
                    });
                  },
                  viewportFraction: 1),
              items: widget.images.map((image) {
                return Builder(
                  builder: (BuildContext context) {
                    return GestureDetector(
                      onTap: () => showImagePreview(context, image),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage(image),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
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
                      widget.productAvgRating.toStringAsFixed(1),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(
                      Icons.star,
                      color: Colors.pink,
                      size: 16,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "(${widget.productTotalRatings} Reviews)",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 14,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.images.map((image) {
              int index = widget.images.indexOf(image);
              return AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: currentImageIndex == index ? 12 : 8.0,
                height: currentImageIndex == index ? 12 : 8.0,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
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
