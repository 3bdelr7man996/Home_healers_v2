import 'package:dr/Patient/features/offer/presentation/widgets/offer_widgets.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PackagesScreen extends StatefulWidget {
  var Packages;
  PackagesScreen({super.key, this.Packages});

  @override
  State<PackagesScreen> createState() => _PackagesScreenState();
}

class _PackagesScreenState extends State<PackagesScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            height: 350,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.63,
              ),
              itemCount: widget.Packages.packages.length,
              itemBuilder: (context, index) {
                return widget.Packages.packages[index].status_id != null
                    ? OfferCard(Package: widget.Packages.packages[index])
                    : SizedBox();
              },
            ),
          )
        ]));
  }
}
