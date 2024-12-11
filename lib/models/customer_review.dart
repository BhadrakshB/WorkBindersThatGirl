class CustomerReview {
  final int rating;
  final String subject;
  final String description;
  final List<String> images;
  final bool isVerified;
  final String dateOfVerification;
  final int helpfulCount;
  final String reviewerName;

  CustomerReview({
    required this.rating,
    required this.subject,
    required this.description,
    required this.images,
    required this.isVerified,
    required this.dateOfVerification,
    required this.helpfulCount,
    required this.reviewerName,
  });

  factory CustomerReview.fromJson(Map<String, dynamic> json) {
    return CustomerReview(
      rating: json['rating'],
      subject: json['subject'],
      description: json['description'],
      images: List<String>.from(json['images']),
      isVerified: json['isVerified'],
      dateOfVerification: json['dateOfVerification'],
      helpfulCount: json['helpfulCount'],
      reviewerName: json['reviewerName'],
    );
  }
}
