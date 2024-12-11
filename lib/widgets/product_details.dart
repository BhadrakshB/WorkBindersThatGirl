import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Printed Slip Dress',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('₹1434', style: TextStyle(fontSize: 20, color: Colors.pink, fontWeight: FontWeight.bold,),),
              SizedBox(width: 8,),
              Text('₹2300', style: TextStyle(fontSize: 14, color: Colors.grey, decoration: TextDecoration.lineThrough),),
              SizedBox(width: 8,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                decoration: BoxDecoration(
                  color: Colors.pink,
                ),
                child: Text('-38%', style: TextStyle(fontSize: 12, color: Colors.white),),
              )
            ],
          ),
          Text('Inclusive of all taxes', style: TextStyle(color: Colors.grey),),
          SizedBox(height: 10),
          Text('Short slip dress with printed details.Short slip dress with printed details.Short slip dress with printed details.Short slip dress with printed details.',
            style: TextStyle(color: Colors.black87),
          ),
          SizedBox(height: 20),
          Divider(
            color: Colors.grey[500],
            thickness: 1,
          ),

          SizedBox(height: 20),
          // Color Options
          Text('COLOR: {{Color Name}}'),
          SizedBox(height: 10),
          SizedBox(
            height: 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CircleAvatar(backgroundColor: Colors.pink, radius: 20, child: Icon(Icons.check, color: Colors.white, size: 18),),
                SizedBox(width: 10),
                CircleAvatar(backgroundColor: Colors.black, radius: 20),
              ],
            ),
          ),
          SizedBox(height: 20),
          // Size Options

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('SIZE: {{SIZE NAME}}'),
              Text('Size Guide', style: TextStyle(color: Colors.pink, decorationStyle: TextDecorationStyle.solid, decoration: TextDecoration.underline, decorationColor: Colors.pink),),

            ],
          ),
          SizedBox(height: 10),
          SizedBox(

            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ...['XS', 'S', 'M', 'L', 'XL'].map((size) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ElevatedButton(
                      child: Text(size),
                      style: ElevatedButton.styleFrom(
              elevation: 0, backgroundColor: Colors.transparent,
                        shape: const RoundedRectangleBorder(
                          side: BorderSide(color: Colors.grey),

                        ),
                      ),
                      onPressed: () {},
                    ),
                  );
                }).toList(),
              ],
            ),
          ),
          SizedBox(height: 20),
          Divider(
            color: Colors.grey[500],
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
