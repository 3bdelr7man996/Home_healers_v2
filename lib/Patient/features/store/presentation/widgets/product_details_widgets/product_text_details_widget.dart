import 'package:flutter/material.dart';

class ProductTextDetailsWidget extends StatelessWidget {
  const ProductTextDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "التفاصيل : ",
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              Expanded(
                  child: Divider(
                thickness: 0.5,
              ))
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            "قماش بمزيج قطني يغلق بزر امامى قماش بمزيج قطني يغلق بزر امامى قما  ش بمزيج قطني يغلق بزر امامى قماش بمزيج قطني يغلق بزر امامى قماش بمزيج قطني يغلق بزر امامى قماش بمزيج قطني يغلق بزر امامى قماش بمزيج قطني يغلق بزر امامى قماش بمزيج قطني يغلق بزر امامى ",
            style: TextStyle(fontSize: 14.0),
          ),
        ),
      ],
    );
  }
}
