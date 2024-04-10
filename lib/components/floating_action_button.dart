import 'package:diarios_eletronicos/screens/favorites_screen.dart';
import 'package:flutter/material.dart';

class FAB extends StatelessWidget {
  const FAB({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const FavoritesScreen(),
          ),
        );
      },
      backgroundColor: Colors.white,
      foregroundColor: const Color.fromRGBO(87, 118, 176, 1.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: const Icon(
        Icons.favorite,
        size: 35,
      ),
    );
  }
}
