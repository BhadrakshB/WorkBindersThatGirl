import 'package:flutter/material.dart';

class DeliveryDetailsWidget extends StatelessWidget {
  final String aboutProduct;
  final String washCareInstructions;
  final String servicePolicy;

  const DeliveryDetailsWidget(
      {super.key,
      required this.aboutProduct,
      required this.washCareInstructions,
      required this.servicePolicy});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ZIP Code Input
          const Row(
            children: [
              Text(
                'DELIVER TO: ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                'Mumbai',
                style: TextStyle(fontWeight: FontWeight.w500, color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 50, // Match CheckBox height
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey), // Border color
                    borderRadius: BorderRadius.zero, // No rounded corners
                  ),
                  child: TextField(
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.number,
                    maxLength: 6,
                    decoration: InputDecoration(
                      counter: const Offstage(),
                      suffixIcon: Container(
                        height: 50, // Match TextField height
                        width: 150,
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.zero, // No rounded corners
                        ),
                        child: TextButton(
                          onPressed: () {
                            // Implement ZIP check logic
                          },
                          child: const Text(
                            'CHECK',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                      hintText: 'Enter ZIP Code',
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Delivery Options
          Row(
            children: [
              Icon(Icons.money, size: 20, color: Colors.grey[700]),
              const SizedBox(width: 8),
              const Text(
                'Cash On Delivery Available',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.local_shipping, size: 20, color: Colors.grey[700]),
              const SizedBox(width: 8),
              Expanded(
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(fontSize: 14, color: Colors.grey[600], height: 1.5),
                    // Default style
                    children: const [
                      TextSpan(
                        text: 'Standard Delivery: \n',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black), // Bold black text
                      ),
                      TextSpan(
                        text: 'Free Shipping on this product. Save ₹99\nEstimated Delivery by ',
                      ),
                      TextSpan(
                        text: 'Tue, 26 Mar - Thu 28 Mar',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black), // Bold black text
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Expandable Sections
          const Divider(),
          _buildExpandableTile('About the Product', aboutProduct),
          const Divider(),
          _buildExpandableTile('Wash Care Instructions', washCareInstructions),
          const Divider(),
          _buildExpandableTile('Service & Policy', servicePolicy),
        ],
      ),
    );
  }

  // Helper Widget for Expandable Tiles
  Widget _buildExpandableTile(String title, String details) {
    return ExpansionTile(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
        side: BorderSide(color: Colors.transparent),
      ),
      backgroundColor: Colors.transparent,
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            details,
            style: TextStyle(fontSize: 14, color: Colors.grey[600]),
          ),
        ),
      ],
    );
  }
}
