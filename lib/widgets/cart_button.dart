import 'package:flutter/material.dart';
import 'package:projetomobile/screens/cart_screen.dart';

class CartButton extends StatelessWidget {
  const CartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const CartScreen(),
          ),
        );
      },
      backgroundColor: Colors.grey,
      child: const Icon(Icons.shopping_cart_outlined, color: Colors.white),
    );
  }
}
