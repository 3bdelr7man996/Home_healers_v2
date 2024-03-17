import 'dart:convert';

import 'package:dr/Patient/features/home/presentation/pages/filter_screen.dart';
import 'package:dr/Patient/features/home/presentation/pages/search_screen.dart';
import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/core/utils/app_strings.dart';
import 'package:dr/core/utils/cache_helper.dart';
import 'package:flutter/material.dart';

class CustumAppBarForPatient extends StatefulWidget {
  const CustumAppBarForPatient({super.key});

  @override
  State<CustumAppBarForPatient> createState() => _CustumAppBarForPatientState();
}

class _CustumAppBarForPatientState extends State<CustumAppBarForPatient> {
  TextEditingController _searchController = TextEditingController();

  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  var userInfo;
  var jsonData;
  String FirstName = '';
  bool IsUserGuest = false;

  IsGuest() async {
    IsUserGuest = CacheHelper.dataSaved(key: 'guest');

    Future.delayed(Duration.zero, () {
      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    IsGuest();
    if (!IsUserGuest)
      getAttributeFromSharedPreferences().then((value) {
        setState(() {
          userInfo = value;
          jsonData = jsonDecode(userInfo);
          List<String> words = jsonData["name"].split(" ");
          FirstName = words[0];
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.28,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(10),
          bottomLeft: Radius.circular(10),
        ),
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            Color.fromARGB(255, 103, 157, 252),
            Color.fromARGB(255, 155, 60, 172),
          ],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: context.height * 0.03),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IsUserGuest == true
                      ? Expanded(
                          child: Text(
                            "مرحبا ! \n قم بتسجيل الدخول \n وتمتع بجميع ميزات التطبيق",
                            textAlign: TextAlign.right,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              height: 1.5,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      : Text(
                          "مرحبا ! \n ${FirstName} , كيف حالك !",
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      image: jsonData != null && jsonData["image"] != null
                          ? DecorationImage(
                              image: NetworkImage(
                                "${AppStrings.baseUrl}/upload/${jsonData["image"]}",
                              ),
                              fit: BoxFit.cover,
                              onError: (exception, stackTrace) =>
                                  {print(exception)},
                            )
                          : DecorationImage(
                              image: AssetImage("assets/images/patient.png"),
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: context.height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    AppConstants.customNavigation(context, FiterScreen(), 0, 0);
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color.fromARGB(157, 55, 209, 244),
                          Color(0xFFB61EEF),
                        ],
                      ),
                    ),
                    child: const Icon(
                      Icons.filter_list,
                      size: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
                10.pw,
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  width: context.width * 0.7,
                  child: Stack(
                    children: [
                      TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: " بحث ...",
                          suffixIcon: Icon(Icons.search),
                          border: InputBorder.none,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          AppConstants.customNavigation(
                              context, SearchScreen(), -1, 0);
                        },
                        child: Container(
                          width: context.width,
                          height: 50,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
