import 'package:flutter/material.dart';

class ReviewCard extends StatelessWidget {
  final String userName;
  final String date;
  final String content;
  final String imagePath;

  const ReviewCard({
    required this.userName,
    required this.date,
    required this.content,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(backgroundImage: AssetImage(imagePath), radius: 24),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(userName, style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(date, style: TextStyle(color: Colors.grey, fontSize: 12)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(content),
            SizedBox(height: 10),
            Row(
              children: [
                IconButton(icon: Icon(Icons.thumb_up_alt_outlined), onPressed: () {}),
                Text('Helpful?'),
                Spacer(),
                IconButton(icon: Icon(Icons.flag_outlined), onPressed: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
