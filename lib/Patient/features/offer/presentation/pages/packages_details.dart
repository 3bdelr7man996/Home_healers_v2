import 'package:dr/Patient/features/home/presentation/cubit/home_cubit.dart';
import 'package:dr/Patient/features/home/presentation/widgets/sections_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class OfferDetailsScreen extends StatefulWidget {
  var Package;
  OfferDetailsScreen({super.key, this.Package});

  @override
  State<OfferDetailsScreen> createState() => _OfferDetailsScreenState();
}

class _OfferDetailsScreenState extends State<OfferDetailsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ReservationCubit>().OnOfferChange(widget.Package.toJson());
  }

  @override
  Widget build(BuildContext context) {
    print(widget.Package.sessionCount);
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: IconsForSections(
            formOffer: true, sessionCountForOffer: widget.Package.sessionCount),
      )),
    );
  }
}
