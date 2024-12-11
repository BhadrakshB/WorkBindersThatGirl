import 'package:flutter/material.dart';

class FooterActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
              onPressed: () {},
              child: Text('ADD TO BAG', style: TextStyle(color: Colors.white)),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
              onPressed: () {},
              child: Text('BUY NOW', style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
