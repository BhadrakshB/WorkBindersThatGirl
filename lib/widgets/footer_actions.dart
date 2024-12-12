import 'package:flutter/material.dart';

class FooterActions extends StatelessWidget {
  const FooterActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      color: Colors.white,
      child: Row(
        children: [
          IconButton(
            visualDensity: VisualDensity.compact,
            style: ButtonStyle(
              padding: WidgetStateProperty.all(const EdgeInsets.all(0).copyWith(right: 10)),
            ),
            onPressed: () {},
            icon: const Icon(
              Icons.favorite_border,
              size: 30,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
                backgroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              onPressed: () {},
              child: const Text('ADD TO BAG', style: TextStyle(color: Colors.white)),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
                backgroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                side: const BorderSide(color: Colors.black, width: 1),
              ),
              onPressed: () {},
              child: const Text('BUY NOW', style: TextStyle(color: Colors.black)),
            ),
          ),
        ],
      ),
    );
  }
}
