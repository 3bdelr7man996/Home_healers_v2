import 'package:flutter/material.dart';

class FiveStarRating extends StatefulWidget {
  final int rating;
  final Function(int) onRatingChanged;

  const FiveStarRating({
    Key? key,
    required this.rating,
    required this.onRatingChanged,
  }) : super(key: key);

  @override
  State<FiveStarRating> createState() => _FiveStarRatingState();
}

class _FiveStarRatingState extends State<FiveStarRating> {
  int _rating = 0;

  @override
  void initState() {
    super.initState();
    _rating = widget.rating;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 1; i <= 5; i++)
          InkWell(
            onTap: () {
              setState(() {
                _rating = i;
                widget.onRatingChanged(_rating);
              });
            },
            child: Icon(
              Icons.star,
              size: 40,
              color: i <= _rating ? Colors.yellow : Colors.grey,
            ),
          ),
      ],
    );
  }
}
