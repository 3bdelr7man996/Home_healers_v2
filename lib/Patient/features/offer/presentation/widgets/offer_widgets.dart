import 'package:dr/Patient/features/home/presentation/cubit/home_cubit/reservation_cubit.dart';
import 'package:dr/Patient/features/home/presentation/pages/section_details_screen.dart';
import 'package:dr/Patient/features/offer/presentation/pages/packages_details.dart';
import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/doctor/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class OfferCard extends StatefulWidget {
  var Package;
  OfferCard({super.key, this.Package});

  @override
  State<OfferCard> createState() => _OfferCardState();
}

class _OfferCardState extends State<OfferCard> {
  late bool IsUserGuest;

  IsGuest() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    context.read<AuthCubit>().getAllStatus();

    setState(() {
      IsUserGuest = prefs.containsKey('guest');
    });
  }

  @override
  void initState() {
    super.initState();
    IsUserGuest = false;
    IsGuest();
  }

  @override
  Widget build(BuildContext context) {
    // var newPrice = widget.Package.oldPrice - int.parse(widget.Package.discount);

    return InkWell(
      onTap: () {
        IsUserGuest == true
            ? ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: AppColors.redColor,
                  padding:
                      EdgeInsets.only(bottom: 50, top: 50, left: 50, right: 50),
                  content: Text(
                    'قم بتسجيل الدخول لتتمتع بهذه المميزات',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  duration: const Duration(seconds: 2), // Optional duration
                ),
              )
            : (
                widget.Package.status_id == null
                    ? AppConstants.customNavigation(context,
                        OfferDetailsScreen(Package: widget.Package), -1, 0)
                    : AppConstants.customNavigation(
                        context,
                        SectionDetailsScreen(
                          fromPackages: true,
                          fromOffer: true,
                          SectiondetailsTitle: "اختر الأخصائي ",
                          sessionCountForOffer: widget.Package.sessionCount,
                          numberOfIcon: widget.Package.status_id,
                        ),
                        -1,
                        0),
                context.read<ReservationCubit>().OnOfferChange(widget.Package)
              );
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        width: context.width * 0.42,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: context.width,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/offer.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                        top: 0,
                        right: 0,
                        child: CustomPaint(
                          painter: TrianglePainter(),
                          child: Container(
                            width: 200,
                            height: 200,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10, right: 5),
                              child: Text(
                                "${widget.Package.discount} %",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        )),
                    // const Center(
                    //     child: Text(
                    //   "الآم \n العمود الفقري",
                    //   textAlign: TextAlign.center,
                    //   style: TextStyle(
                    //       color: Colors.white,
                    //       fontSize: 20.0,
                    //       fontWeight: FontWeight.bold),
                    // ))
                  ],
                ),
              ),
              10.ph,
              Text(
                widget.Package.description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500),
              ),
              10.ph,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "${widget.Package.price} SAR",
                    style: TextStyle(
                        color: AppColors.secondryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  5.pw,
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: '${widget.Package.oldPrice} SAR',
                          style: const TextStyle(
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough,
                              decorationColor: Colors.grey,
                              decorationThickness: 2.0,
                              fontSize: 14),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              20.ph,
              SizedBox(
                width: context.width,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0),
                      ),
                    ),
                  ),
                  onPressed: () {
                    IsUserGuest == true
                        ? ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: AppColors.redColor,
                              padding: EdgeInsets.only(
                                  bottom: 50, top: 50, left: 50, right: 50),
                              content: Text(
                                'قم بتسجيل الدخول لتتمتع بهذه المميزات',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              duration: const Duration(
                                  seconds: 2), // Optional duration
                            ),
                          )
                        : (
                            widget.Package.status_id == null
                                ? AppConstants.customNavigation(
                                    context,
                                    OfferDetailsScreen(Package: widget.Package),
                                    -1,
                                    0)
                                : AppConstants.customNavigation(
                                    context,
                                    SectionDetailsScreen(
                                      fromPackages: true,
                                      fromOffer: true,
                                      SectiondetailsTitle: "اختر الأخصائي ",
                                      sessionCountForOffer:
                                          widget.Package.sessionCount,
                                      numberOfIcon: widget.Package.status_id,
                                    ),
                                    -1,
                                    0),
                            context
                                .read<ReservationCubit>()
                                .OnOfferChange(widget.Package)
                          );
                  },
                  child: const Text('استمتع بالعرض'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = AppColors.primaryColor;
    var path = Path();
    path.moveTo(200, 0);
    path.lineTo(200, 65);
    path.lineTo(135, 0);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
