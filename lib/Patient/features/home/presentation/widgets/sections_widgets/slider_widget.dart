import 'package:carousel_slider/carousel_slider.dart';
import 'package:dr/Patient/features/home/presentation/cubit/home_cubit/ads_cubit.dart';
import 'package:dr/Patient/features/home/presentation/cubit/home_state/ads_state.dart';
import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SliderForPatient extends StatefulWidget {
  const SliderForPatient({super.key});

  @override
  State<SliderForPatient> createState() => _SliderForPatientState();
}

class _SliderForPatientState extends State<SliderForPatient> {
  int _currentImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllAdsCubit, GetAllAdsState>(
      builder: (context, state) {
        if (state.data == null) {
          return SizedBox();
        }
        if (state.data != null && state.data.data.length == 0) {
          return SizedBox();
        }
        var items = [];
        for (int i = 0; i < state.data.data.length; i++)
          items.add(Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: Image.network(
                "${AppStrings.imageUrl}${state.data.data[i]['image']}",
                fit: BoxFit.cover,
                width: 1000,
              ),
            ),
          ));
        List<Widget> widgets = items.cast<Widget>();
        var items2 = [];
        for (int i = 0; i < state.data.data.length; i++) {
          int index = state.data.data.indexOf(state.data.data[i]);
          items2.add(Container(
            width: 8.0,
            height: 8.0,
            margin: const EdgeInsets.symmetric(horizontal: 4.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _currentImageIndex == index
                  ? AppColors.primaryColor
                  : Colors.grey,
            ),
          ));
        }
        List<Widget> widgets2 = items2.cast<Widget>();
        return Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: context.height * 0.2,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 2),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentImageIndex = index;
                  });
                },
              ),
              items: widgets,
            ),
            10.ph,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widgets2,
            )
          ],
        );
      },
    );
  }
}
