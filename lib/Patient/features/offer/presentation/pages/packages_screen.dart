// ignore_for_file: unnecessary_null_comparison

import 'package:dr/Patient/features/offer/data/models/get_packages_model.dart';
import 'package:dr/Patient/features/offer/presentation/widgets/offer_widgets.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PackagesScreen extends StatefulWidget {
  GetPackagesModel? Packages;
  PackagesScreen({super.key, this.Packages});

  @override
  State<PackagesScreen> createState() => _PackagesScreenState();
}

class _PackagesScreenState extends State<PackagesScreen> {
  @override
  Widget build(BuildContext context) {
    return Packages == null
        ? CircularProgressIndicator()
        : Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                height: 350,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.63,
                  ),
                  itemCount: widget.Packages!.packages.length,
                  itemBuilder: (context, index) {
                    return OfferCard(Package: widget.Packages!.packages[index]);
                  },
                ),
              )
            ]));
  }
}
