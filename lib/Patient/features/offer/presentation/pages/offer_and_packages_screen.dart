import 'package:dr/Patient/features/home/presentation/cubit/home_cubit/reservation_cubit.dart';
import 'package:dr/Patient/features/offer/data/models/get_offers_model.dart';
import 'package:dr/Patient/features/offer/data/models/get_packages_model.dart';
import 'package:dr/Patient/features/offer/presentation/cubit/offer_cubit/offer_cubit.dart';
import 'package:dr/Patient/features/offer/presentation/cubit/offer_cubit/package_cubit.dart';
import 'package:dr/Patient/features/offer/presentation/pages/packages_screen.dart';

import 'package:dr/doctor/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'offer_screen.dart';

class OfferAndPackagesScreen extends StatefulWidget {
  const OfferAndPackagesScreen({super.key});

  @override
  State<OfferAndPackagesScreen> createState() => _OfferAndPackagesScreenState();
}

class _OfferAndPackagesScreenState extends State<OfferAndPackagesScreen> {
  @override
  void initState() {
    super.initState();
    context.read<GetPackagesCubit>().GetPackages(context);
    context.read<GetOffersCubit>().GetOffers(context);
    context.read<ReservationCubit>().onChangestatus_id(-1);
  }

  GetOffersModel? Offers;
  GetPackagesModel? Packages;
  @override
  Widget build(BuildContext context) {
    Packages =
        context.select((GetPackagesCubit cubit) => cubit.state.AllPackages);
    Offers = context.select((GetOffersCubit cubit) => cubit.state.AllOffers);
    return Scaffold(
      appBar: customAppBar(context, title: "Offer", backButton: false),
      body: Packages == null || Offers == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : DefaultTabController(
              length: 2,
              child: Scaffold(
                appBar: PreferredSize(
                  preferredSize: Size.fromHeight(kToolbarHeight),
                  child: Container(
                    child: SafeArea(
                      child: Column(
                        children: <Widget>[
                          Expanded(child: Container()),
                          TabBar(
                            tabs: [
                              Text(
                                "حزم العروض",
                                style: TextStyle(color: Colors.black),
                              ),
                              Text(
                                "العروض الفردية",
                                style: TextStyle(color: Colors.black),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                body: TabBarView(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        PackagesScreen(
                          Packages: Packages,
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        OfferScreen(
                          Offers: Offers!,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
