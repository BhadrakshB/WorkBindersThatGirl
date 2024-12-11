import 'package:flutter/material.dart';

class FooterActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      color: Colors.white,
      child: Row(
        children: [
          IconButton(
            visualDensity: VisualDensity.compact,
            style: ButtonStyle(
              padding: WidgetStateProperty.all(EdgeInsets.all(0).copyWith(right:10)),
            ),
            onPressed: () {},
            icon: Icon(Icons.favorite_border, size: 30,),
          ),
          SizedBox(width: 10),
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
                backgroundColor: Colors.black,
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
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
                backgroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 16),
                side: BorderSide(color: Colors.black, width: 1),
              ),
              onPressed: () {},
              child: Text('BUY NOW', style: TextStyle(color: Colors.black)),
            ),
          ),
        ],
      ),
    );
  }
}
