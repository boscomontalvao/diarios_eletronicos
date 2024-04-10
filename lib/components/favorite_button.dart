import 'package:flutter/material.dart';

class FavoriteButton extends StatefulWidget {
  final bool isFavorite;
  final String date;
  final void Function()? onTap;

  const FavoriteButton(
      {super.key,
      required this.isFavorite,
      required this.onTap,
      required this.date});

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Icon(
        widget.isFavorite ? Icons.favorite : Icons.favorite_border,
        color: const Color.fromRGBO(32, 112, 125, 1.0),
        size: 30,
      ),
    );
  }
}
