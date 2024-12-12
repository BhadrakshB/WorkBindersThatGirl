import 'package:flutter/material.dart';
import 'package:working_demo/models/color_option.dart';
import 'package:working_demo/models/size_option.dart';

class ProductDetails extends StatefulWidget {
  final String productTitle;
  final String productDescription;
  final String productCurrPrice;
  final String productOrigPrice;
  final String productDiscount;
  final List<ColorOption> colorOptions;
  final List<SizeOption> sizeOptions;

  ProductDetails({
    required this.productTitle,
    required this.productDescription,
    required this.productCurrPrice,
    required this.productOrigPrice,
    required this.productDiscount,
    required this.colorOptions,
    required this.sizeOptions,
  });

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  var selectedColor = 0;

  var selectedSize = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.productTitle,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.productCurrPrice,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.pink,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                widget.productOrigPrice,
                style: TextStyle(
                    fontSize: 14, color: Colors.grey, decoration: TextDecoration.lineThrough),
              ),
              SizedBox(
                width: 8,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                decoration: BoxDecoration(
                  color: Colors.pink,
                ),
                child: Text(
                  "-${widget.productDiscount}",
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
              )
            ],
          ),
          Text(
            'Inclusive of all taxes',
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(height: 10),
          Text(
            widget.productDescription,
            style: TextStyle(color: Colors.black87),
          ),
          SizedBox(height: 20),
          Divider(
            color: Colors.grey[500],
            thickness: 1,
          ),

          SizedBox(height: 20),
          // Color Options
          Text('COLOR: ${widget.colorOptions[selectedColor].colorName}'),
          SizedBox(height: 10),
          SizedBox(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.colorOptions.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: GestureDetector(
                    onTap: () {
                      print('Color selected: ${widget.colorOptions[index].colorName}');
                      setState(() {
                        selectedColor = index;
                      });
                    },
                    child: Container(
                      child: selectedColor == index
                          ? Icon(
                              Icons.check,
                              color: Colors.white,
                            )
                          : null,
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: widget.colorOptions[index].getColor(),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 20),
          // Size Options

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('SIZE: ${widget.sizeOptions[selectedSize].sizeName}'),
              Text(
                'Size Guide',
                style: TextStyle(
                    color: Colors.pink,
                    decorationStyle: TextDecorationStyle.solid,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.pink),
              ),
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.sizeOptions.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        if (!widget.sizeOptions[index].available) {
                          return;
                        }
                        selectedSize = index;
                      });
                    },
                    child: Container(
                      width: 50,
                      height: 40,
                      decoration: BoxDecoration(
                        color: widget.sizeOptions[index].available
                            ? Colors.transparent
                            : Colors.grey[400],
                        border: Border.all(
                          color: selectedSize == index ? Colors.black : Colors.grey,
                          width: widget.sizeOptions[index].available ? 1.5 : 0,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          widget.sizeOptions[index].sizeCode,
                          style: TextStyle(
                            color: widget.sizeOptions[index].available
                                ? Colors.black
                                : Colors.grey[700],
                            fontWeight: selectedSize == index ? FontWeight.bold : FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          Divider(
            color: Colors.grey[500],
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
