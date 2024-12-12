import 'package:flutter/material.dart';

class ProductHeader extends StatelessWidget implements PreferredSizeWidget {
  const ProductHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => Navigator.pop(context),
      ),
      title: const Text(
        'THAT GIRL',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.pink,
        ),
      ),
      centerTitle: true,
      actions: [
        IconButton(icon: const Icon(Icons.search), onPressed: () {}),
        IconButton(icon: const Icon(Icons.shopping_cart_outlined), onPressed: () {}),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
