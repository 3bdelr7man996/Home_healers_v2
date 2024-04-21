// widget to show all orders in this section
// ignore_for_file: must_be_immutable

import 'package:dr/Patient/features/setting/data/models/my_orders_model.dart';
import 'package:dr/Patient/features/setting/presentation/cubit/setting_cubit/my_order_cubit.dart';
import 'package:dr/Patient/features/setting/presentation/cubit/setting_state/my_order_state.dart';
import 'package:dr/Patient/features/setting/presentation/widgets/my_requests_widgets_for_patient/card_for_request_widget.dart';
import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class ListOfOrder extends StatelessWidget {
  int TabIndexClicked;
  ListOfOrder({super.key, required this.TabIndexClicked});

  @override
  Widget build(BuildContext context) {
    List<OrderData>? listOfOrders;
    if (TabIndexClicked == 0)
      listOfOrders = context
              .select((MyOrdersCubit cubit) => cubit.state.reviewingOrders) ??
          [];
    else if (TabIndexClicked == 1)
      listOfOrders = context
              .select((MyOrdersCubit cubit) => cubit.state.waitConfirmOrders) ??
          [];
    else if (TabIndexClicked == 2)
      listOfOrders = context
              .select((MyOrdersCubit cubit) => cubit.state.confirmedOrders) ??
          [];
    else if (TabIndexClicked == 3)
      listOfOrders = context
              .select((MyOrdersCubit cubit) => cubit.state.completedOrders) ??
          [];
    else if (TabIndexClicked == 4)
      listOfOrders =
          context.select((MyOrdersCubit cubit) => cubit.state.canceledOrders) ??
              [];
    else if (TabIndexClicked == 5)
      listOfOrders =
          context.select((MyOrdersCubit cubit) => cubit.state.pendingOrders) ??
              [];
    return BlocBuilder<MyOrdersCubit, MyOrdersState>(
      builder: (context, state) {
        return state.loading == true
            ? Container(
                height: context.height / 2,
                child: Center(child: CircularProgressIndicator()),
              )
            : listOfOrders!.length == 0
                ? Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/images/noOrders.svg",
                          width: 200,
                          height: 200,
                        ),
                        10.ph,
                        Text(
                          "لا يوجد طلبات في الوقت الحالي",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  )
                : listOfOrders.isEmpty
                    ? SizedBox()
                    : Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: listOfOrders.length,
                          itemBuilder: (context, index) {
                            List<String> names = [];
                            String selectedName = "";
                            names.add("الاختصاص");
                            for (var item
                                in listOfOrders![index].advertiser.categories ??
                                    []) {
                              names.add(item.nameAr ?? "");
                            }
                            selectedName = names.isNotEmpty
                                ? names[0]
                                : 'No names available';
                            return CardsForRequests(
                              listOfOrders: listOfOrders[index],
                              categories: names,
                              selectedName: selectedName,
                              TabIndexClicked: TabIndexClicked,
                            );
                          },
                        ),
                      );
      },
    );
  }
}
