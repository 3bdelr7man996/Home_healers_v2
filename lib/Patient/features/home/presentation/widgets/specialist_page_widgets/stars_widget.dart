// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class Stars extends StatelessWidget {
  var rating;
  Stars({super.key, this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          rating >= 1 ? Icons.star : Icons.star_border,
          color: Colors.yellow,
          size: 20,
        ),
        Icon(
          rating >= 2 ? Icons.star : Icons.star_border,
          color: Colors.yellow,
          size: 20,
        ),
        Icon(
          rating >= 3 ? Icons.star : Icons.star_border,
          color: Colors.yellow,
          size: 20,
        ),
        Icon(
          rating >= 4 ? Icons.star : Icons.star_border,
          color: Colors.yellow,
          size: 20,
        ),
        Icon(
          rating == 5 ? Icons.star : Icons.star_border,
          color: Colors.yellow,
          size: 20,
        ),
      ],
    );
  }
}
