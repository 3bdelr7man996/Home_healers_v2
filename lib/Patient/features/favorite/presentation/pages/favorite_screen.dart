import 'package:dr/Patient/features/favorite/presentation/cubit/favorite_cubit/favorite_cubit.dart';
import 'package:dr/Patient/features/favorite/presentation/cubit/favorite_state/favorite_state.dart';
import 'package:dr/Patient/features/home/presentation/widgets/filter_result_widgets/doctor_card_widget.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/core/utils/app_images.dart';
import 'package:dr/doctor/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  late bool IsUserGuest;

  IsGuest() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      IsUserGuest = prefs.containsKey('guest');
    });
    if (IsUserGuest == false)
      context.read<FavoriteCubit>().GetFavorite(context, reload: true);
  }

  @override
  void initState() {
    super.initState();
    IsUserGuest = false;
    IsGuest();
  }

  @override
  Widget build(BuildContext context) {
    // print("Token ${CacheHelper.getData(key: AppStrings.userToken)}");
    return Scaffold(
        appBar: customAppBar(context, backButton: false, title: "favorite"),
        body: BlocBuilder<FavoriteCubit, FavoriteState>(
            builder: (context, state) {
          return IsUserGuest == true
              ? Center(child: Text("قم بتسجيل الدخول للوصول إلى هذه الخدمة"))
              : state.Loading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : (state.favList?.length == 0 || state.favList == null)
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AppConstants.customAssetImage(
                                imagePath: AppImages.no_fav_icon,
                                height: 150,
                                width: 250,
                              ),
                              20.ph,
                              Text(
                                "لا يوجد مفضلة ",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 179, 181, 181),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        )
                      : Stack(children: [
                          ListView.builder(
                            itemCount: state.favList?.length,
                            itemBuilder: (context, index) {
                              return DoctorCard(
                                fromFav: true,
                                doctorInfo: state.favList![index].advertiser!,
                                year: null,
                                fromfavorite: true,
                              );
                            },
                          ),
                        ]);
        }));
  }
}
