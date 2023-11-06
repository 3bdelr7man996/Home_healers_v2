// ignore_for_file: must_be_immutable

import 'package:dr/Patient/features/auth/presentation/pages/injury_area_screen.dart';
import 'package:dr/Patient/features/home/presentation/cubit/home_cubit.dart';
import 'package:dr/Patient/features/home/presentation/pages/date_of_session_screen.dart';
import 'package:dr/Patient/features/setting/presentation/pages/reports_screen.dart';
import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/core/utils/app_strings.dart';
import 'package:dr/shared_widgets/photo_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class ApPBarForspecialistScreen extends StatelessWidget {
  const ApPBarForspecialistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: context.width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 108, 210, 233),
            Color.fromARGB(173, 116, 10, 154)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(35.0),
          bottomRight: Radius.circular(35.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      margin: const EdgeInsets.all(8.0),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(95, 255, 255, 255),
                      ),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: const Icon(
                          Icons.arrow_back,
                          color: AppColors.whiteColor,
                        ),
                        onPressed: () {
                          context
                              .read<ReservationCubit>()
                              .makesessions_countOne();
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "صفحة الأخصائي",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                const Spacer()
              ],
            )
          ],
        ),
      ),
    );
  }
}

class PictureForSpecialist extends StatefulWidget {
  var Data;
  PictureForSpecialist({
    this.Data,
    super.key,
  });

  @override
  State<PictureForSpecialist> createState() => _PictureForSpecialistState();
}

class _PictureForSpecialistState extends State<PictureForSpecialist> {
  List<String> names = [];
  String selectedName = "";

  @override
  void initState() {
    super.initState();
    names.add("الاختصاص");
    for (var item in widget.Data["categories"]) {
      names.add(item['name_ar']);
    }
    selectedName = names.isNotEmpty ? names[0] : 'No names available';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              width: 150,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: widget.Data["image"] != null
                    ? DecorationImage(
                        image: NetworkImage(
                          "${AppStrings.imageUrl}${widget.Data["image"]}",
                        ),
                        fit: BoxFit.cover,
                        onError: (exception, stackTrace) => {print(exception)},
                      )
                    : DecorationImage(
                        image: AssetImage("assets/images/doctor.png"),
                        fit: BoxFit.cover,
                      ),
              ),
            ),
          ),
          10.pw,
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.Data["name_ar"],
                  style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500),
                ),
                5.ph,
                if (names.isNotEmpty)
                  Container(
                    height: 20,
                    child: DropdownButton<String>(
                      underline: Container(), // Hide the underline
                      // icon: const SizedBox(), // Hide the arrow icon
                      value: selectedName,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedName = newValue!;
                        });
                      },
                      items:
                          names.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(fontSize: 12.0),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                5.ph,
                const Stars(),
                5.ph,
                widget.Data["status"] == "on"
                    ? const Text(
                        " متاح الان",
                        style: TextStyle(
                            color: Colors.green, fontWeight: FontWeight.bold),
                      )
                    : RichText(
                        text: const TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: '- غير متاح الآن ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                  decoration: TextDecoration.lineThrough,
                                  decorationColor: Colors.grey,
                                  decorationThickness: 2.0,
                                  fontSize: 14),
                            ),
                          ],
                        ),
                      ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Stars extends StatelessWidget {
  const Stars({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          Icons.star,
          color: Colors.yellow,
          size: 20,
        ),
        Icon(
          Icons.star,
          color: Colors.yellow,
          size: 20,
        ),
        Icon(
          Icons.star,
          color: Colors.yellow,
          size: 20,
        ),
        Icon(
          Icons.star_half,
          color: Colors.yellow,
          size: 20,
        ),
        Icon(
          Icons.star_border,
          color: Colors.yellow,
          size: 20,
        ),
      ],
    );
  }
}

class statisticsBox extends StatelessWidget {
  String text1, text2;
  statisticsBox({super.key, required this.text1, required this.text2});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text1,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          5.ph,
          Text(
            text2,
            style: const TextStyle(
              color: AppColors.primaryColor,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class specialistInfo extends StatefulWidget {
  var Data;
  specialistInfo({super.key, this.Data});

  @override
  State<specialistInfo> createState() => _specialistInfoState();
}

class _specialistInfoState extends State<specialistInfo> {
  List<String> names = [];
  String selectedName = "";

  @override
  void initState() {
    super.initState();
    names.add("الأقسام :");
    for (var item in widget.Data["status_advisor"]) {
      names.add(item['name_ar']);
    }
    selectedName = names.isNotEmpty ? names[0] : 'No names available';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            statisticsBox(
              text1: "جلسة طبية",
              text2: "+100",
            ),
            statisticsBox(
              text1: "خبرة",
              text2: "+10 سنوات",
            ),
            statisticsBox(
              text1: "تقييم",
              text2: "${widget.Data["rating"]}",
            )
          ],
        ),
        20.ph,
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SvgPicture.asset(
              "assets/icons/hearing_aids_icon.svg",
              width: 25,
              height: 25,
            ),
            5.pw,
            names.isNotEmpty
                ? Container(
                    height: 25,
                    child: DropdownButton<String>(
                      underline: Container(), // Hide the underline
                      // icon: const SizedBox(), // Hide the arrow icon
                      value: selectedName,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedName = newValue!;
                        });
                      },
                      items:
                          names.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  )
                : Text('No Data available')
          ],
        ),
        5.ph,
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SvgPicture.asset(
              "assets/icons/clock_icon.svg",
              width: 25,
              height: 25,
            ),
            5.pw,
            Text(
              "مدة الجلسة الواحدة: ${widget.Data["session_dur"]} دقيقة",
              style: TextStyle(fontWeight: FontWeight.w500),
            )
          ],
        ),
        5.ph,
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SvgPicture.asset(
              "assets/icons/offer_outlined_icon.svg",
              width: 25,
              height: 25,
            ),
            10.pw,
            const Text(
              "سعر الجلسة الطبية : ",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            Text(
              "${widget.Data["session_price"]} SAR",
              style: TextStyle(
                  fontWeight: FontWeight.w500, color: AppColors.secondryColor),
            ),
            10.pw,
            // Padding(
            //   padding: const EdgeInsets.only(bottom: 4),
            //   child: RichText(
            //     text: const TextSpan(
            //       children: <TextSpan>[
            //         TextSpan(
            //           text: '800 SAR',
            //           style: TextStyle(
            //               color: Colors.grey,
            //               decoration: TextDecoration.lineThrough,
            //               decorationColor: Colors.grey,
            //               decorationThickness: 2.0,
            //               fontSize: 14),
            //         ),
            //       ],
            //     ),
            //   ),
            // )
          ],
        ),
        5.ph,
        Container(
          width: context.width,
          alignment: Alignment.centerRight,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Icon(
                  Icons.location_on_outlined,
                  color: AppColors.primaryColor,
                ),
                10.pw,
                Text(
                  "${widget.Data["address_ar"]}",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class Certificates extends StatefulWidget {
  var Data;
  Certificates({super.key, this.Data});

  @override
  State<Certificates> createState() => _CertificatesState();
}

class _CertificatesState extends State<Certificates> {
  List<String> imageList = [
    "assets/images/certificate.png",
    "assets/images/certificate.png",
    "assets/images/certificate.png",
    "assets/images/certificate.png",
    "assets/images/certificate.png",
    "assets/images/certificate.png",
    "assets/images/certificate.png",
    "assets/images/certificate.png",
    "assets/images/certificate.png",
    "assets/images/certificate.png",
  ];
  var pdfFiles;
  @override
  void initState() {
    super.initState();

    pdfFiles = widget.Data;
    print("pdFiles");
    print(widget.Data);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: context.width,
        height: 150,
        child: pdfFiles != null
            ? ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: pdfFiles.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      // AppConstants.customNavigation(
                      //     context, FullScreenImage(pathImage: imageList[index]), -1, 0);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PhotoViewerRouteWrapper(
                              filePath: "${pdfFiles[index]}"),
                        ),
                      );
                    },
                    child: Container(
                      width: 100,
                      margin: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/certificate.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                  // ListTile(
                  //   title: Text(pdfFiles[index]),
                  //   onTap: () {
                  //
                },
              )
            //   },
            // )
            : SizedBox()
        // child: ListView.builder(
        //   scrollDirection: Axis.horizontal,
        //   itemCount: imageList.length,
        //   itemBuilder: (BuildContext context, int index) {
        //     return InkWell(
        //       onTap: () {
        //         AppConstants.customNavigation(
        //             context, FullScreenImage(pathImage: imageList[index]), -1, 0);
        //       },
        //       child: Container(
        //         width: 100,
        //         margin: EdgeInsets.all(8.0),
        //         decoration: BoxDecoration(
        //           image: DecorationImage(
        //             image: AssetImage(imageList[index]),
        //             fit: BoxFit.cover,
        //           ),
        //         ),
        //       ),
        //     );
        //   },
        // ),
        );
  }
}

class ButtonWithCounter extends StatefulWidget {
  var Data;
  var status_id;
  bool fromOffer;
  var sessionCountForOffer;
  var fromFilter;
  ButtonWithCounter(
      {super.key,
      this.Data,
      this.fromFilter,
      this.status_id,
      this.sessionCountForOffer,
      this.fromOffer = false});

  @override
  State<ButtonWithCounter> createState() => _ButtonWithCounterState();
}

class _ButtonWithCounterState extends State<ButtonWithCounter> {
  int number = 1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.sessionCountForOffer != null)
      context
          .read<ReservationCubit>()
          .OnChangeSessionCount(widget.sessionCountForOffer);
  }

  @override
  Widget build(BuildContext context) {
    print(widget.status_id);
    print("Aliiiii");
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              widget.sessionCountForOffer != null
                  ? SizedBox()
                  : InkWell(
                      onTap: () {
                        setState(() {
                          number++;
                          context
                              .read<ReservationCubit>()
                              .increaseSessionsCount();
                        });
                      },
                      child: const Icon(
                        Icons.add_circle,
                        size: 35,
                        color: AppColors.primaryColor,
                      ),
                    ),
              5.pw,
              Text(
                widget.sessionCountForOffer != null
                    ? '${widget.sessionCountForOffer}'
                    : '${number}',
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              ),
              5.pw,
              widget.sessionCountForOffer != null
                  ? SizedBox()
                  : InkWell(
                      onTap: () {
                        setState(() {
                          if (number > 1) {
                            number--;
                            context
                                .read<ReservationCubit>()
                                .decraseSessionsCount();
                          }
                        });
                      },
                      child: const Icon(
                        Icons.remove_circle,
                        size: 35,
                        color: AppColors.primaryColor,
                      ),
                    ),
            ],
          ),
          Container(
            width: 250,
            child: ElevatedButton(
              onPressed: () {
                AppConstants.customNavigation(
                    context,
                    DateOfSessionScreen(
                        Data: widget.Data,
                        fromFilter: widget.fromFilter,
                        status_id: widget.status_id,
                        fromOffer: widget.fromOffer),
                    -1,
                    0);
              },
              style: ElevatedButton.styleFrom(
                primary: AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'احجز الآن',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
