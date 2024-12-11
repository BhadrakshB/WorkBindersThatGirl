import 'package:flutter/material.dart';

void showImagePreview(BuildContext context, String imageUrl) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 400,child: isNetworkImage(imageUrl) ? Image.network(imageUrl) : Image.asset(imageUrl, fit: BoxFit.cover,)),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Close"),
            ),
          ],
        ),
      );
    },
  );
}

bool isNetworkImage(String imagePath) {
  // Check if the string starts with 'http' or 'https'
  return imagePath.startsWith('http://') || imagePath.startsWith('https://');
}
