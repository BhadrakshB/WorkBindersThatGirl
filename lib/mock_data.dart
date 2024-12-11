Map<String, dynamic> mock_data = {
  "product": {
    "productImages": [
      'assets/images/product1.png',
      'assets/images/product2.png',
      'assets/images/product3.png',
      'assets/images/product4.png',
    ],
    "totalReviews": 145,
    "avgRating": 4.7,
    "title": "Elegant Maxi Dress",
    "currPrice": "₹1,999",
    "origPrice": "₹3,999",
    "discountPercentage": "50%",

    "description":
        "This stunning maxi dress features a flowy chiffon design, perfect for evening parties and special occasions.",
    "availableColors": [
      {"colorName": "Blush Pink", "colorCode": "#FFC0CB"},
      {"colorName": "Emerald Green", "colorCode": "#50C878"}
    ],
    "availableSizes": [
      {"sizeName": "Extra Small", "sizeCode": "XS", "available": true},
      {"sizeName": "Small", "sizeCode": "S", "available": true},
      {"sizeName": "Medium", "sizeCode": "M", "available": true},
      {"sizeName": "Large", "sizeCode": "L", "available": false},
      {"sizeName": "Extra Large", "sizeCode": "XL", "available": true}
    ],
    "aboutTheProduct": "A glamorous and comfortable dress for formal and semi-formal events.",
    "washCareInstructions": "Hand wash in cold water. Do not wring or tumble dry.",
    "serviceAndPolicy": "Free returns within 15 days. Express delivery available.",
    "avgRatings": 4.7,
    "ratingsCount": 145,
    "sizing": 0.9,
    "quality": 0.93,
    "fit": 0.89,
    "recommend": 0.95,
    "reviewPhotos": ['assets/images/reviews1.png',
      'assets/images/reviews2.png',
      'assets/images/reviews3.png',
      'assets/images/reviews4.png','assets/images/reviews5.png',],
    "customerReviews": [
      {
        "rating": 5,
        "subject": "Loved it! Perfect for formal events",
        "description":
            "The dress is simply gorgeous and fits like a dream. The material feels luxurious, and I received so many compliments!",
        "images": ["assets/images/reviews3.png","assets/images/reviews4.png"],
        "isVerified": true,
        "dateOfVerification": "20th July, 2024",
        "helpfulCount": 30,
        "reviewerName": "Jane Doe"
      },
      {
        "rating": 4,
        "subject": "Great dress but runs large",
        "description":
            "I had to exchange for a smaller size, but once I got the right fit, it was perfect. Love the color and flowy fabric.",
        "images": [],
        "isVerified": true,
        "dateOfVerification": "15th July, 2024",
        "helpfulCount": 18,
        "reviewerName": "John Smith"
      },
      {
        "rating": 3,
        "subject": "Nice design but could be better",
        "description":
            "The dress looks great, but the zipper was a bit tricky, and the stitching could be better.",
        "images": ["assets/images/reviews1.png"],
        "isVerified": false,
        "dateOfVerification": "10th July, 2024",
        "helpfulCount": 12,
        "reviewerName": "Alice Johnson"
      }
    ],
    "relatedProducts": [
      {
        "title": "Floral Print Midi Dress",
        "currPrice": "₹1,499",
        "image": "assets/images/suggestion1.png"
      },
      {
        "title": "Lace Overlay Evening Gown",
        "currPrice": "₹2,499",
        "image": "assets/images/suggestion2.png"
      },
      {
        "title": "A-Line Summer Dress",
        "currPrice": "₹1,299",
        "image": "assets/images/suggestion3.png"
      },
      {
        "title": "A-Line Summer Dress",
        "currPrice": "₹1,299",
        "image": "assets/images/suggestion4.png"
      }
    ]
  }
};
