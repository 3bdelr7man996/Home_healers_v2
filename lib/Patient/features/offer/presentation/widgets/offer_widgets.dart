import 'package:dr/Patient/features/offer/presentation/pages/offer_details_screen.dart';
import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:flutter/material.dart';

class OfferCard extends StatefulWidget {
  const OfferCard({super.key});

  @override
  State<OfferCard> createState() => _OfferCardState();
}

class _OfferCardState extends State<OfferCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: context.width * 0.42,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
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
                        child: const Padding(
                          padding: const EdgeInsets.only(top: 10, right: 5),
                          child: Text(
                            "15 %",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )),
                const Center(
                    child: Text(
                  "الآم \n العمود الفقري",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ))
              ],
            ),
          ),
          10.ph,
          const Text(
            "12 جلسة علاج طبيعي \n لالام العمود الفقري",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
                fontWeight: FontWeight.w500),
          ),
          10.ph,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "500 SAR",
                style: TextStyle(
                    color: AppColors.secondryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              5.pw,
              RichText(
                text: const TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: '800 SAR',
                      style: TextStyle(
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
                primary: AppColors.primaryColor,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                  ),
                ),
              ),
              onPressed: () {
                AppConstants.customNavigation(
                    context, OfferDetailsScreen(), -1, 0);
              },
              child: const Text('استمتع بالعرض'),
            ),
          )
        ],
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
