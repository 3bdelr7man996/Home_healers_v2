import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/http_helper.dart';
import 'package:dr/doctor/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:dr/doctor/features/diagnose_report/presentation/cubit/diagnose_form_cubit.dart';
import 'package:dr/doctor/features/home/data/models/reservations_model.dart';
import 'package:dr/shared_widgets/custom_loader.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddReportScreen extends StatefulWidget {
  const AddReportScreen({super.key, required this.reservation});
  final ReservationData reservation;
  @override
  State<AddReportScreen> createState() => _AddReportScreenState();
}

class _AddReportScreenState extends State<AddReportScreen> {
  @override
  void initState() {
    context.read<DiagnoseFormCubit>().getDiagnoseForm(widget.reservation);
    super.initState();
  }

  final GlobalKey key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      appBar: customAppBar(context, title: "report_template", backButton: true),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          15.ph,
          RepaintBoundary(
            key: key,
            child: Container(
              color: AppColors.backGroundColor,
              child: Column(
                children: [
                  _ListDiagnoseFormInput(),
                  const _AddTreatement(),
                  _ListTreatmentInput(),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _ShopButton(globalKey: key),
              const SizedBox(
                width: 10,
              ),
              //   _CancelButton()
            ],
          )
        ],
      ),
    );
  }
}

class _AddTreatement extends StatelessWidget {
  const _AddTreatement();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiagnoseFormCubit, DiagnoseFormState>(
      builder: (context, state) {
        if (state.status == RequestState.loading) {
          return const SizedBox.shrink();
        } else {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Treatment',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              IconButton(
                  onPressed: () =>
                      {context.read<DiagnoseFormCubit>().addTreatmentChanged()},
                  icon: const Icon(
                    Icons.add_circle_outline,
                    color: Colors.black54,
                  ))
            ],
          );
        }
      },
    );
  }
}

class _ListTreatmentInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiagnoseFormCubit, DiagnoseFormState>(
        buildWhen: (previous, current) =>
            previous.treatments != current.treatments ||
            previous.status != current.status,
        builder: (context, state) {
          // if (state.treatments == null || state.treatments!.isEmpty) {
          //   return const Center(
          //     child: Text('Add new treatment'),
          //   );
          // }
          if (state.status == RequestState.loading) {
            return const SizedBox.shrink();
          } else if (state.treatments != null && state.treatments!.isNotEmpty) {
            final List<Widget> listInpit = [];
            for (var index = 0; index < state.treatments!.length; index++) {
              listInpit.add(_TreatmentTextInput(
                index: index,
                title: 'Treatment #$index',
              ));
            }
            return Column(
              children: listInpit,
            );
          } else {
            return const SizedBox.shrink();
          }
        });
  }
}

class _ListDiagnoseFormInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiagnoseFormCubit, DiagnoseFormState>(
        buildWhen: (previous, current) =>
            previous.listDiagnoseSection != current.listDiagnoseSection ||
            previous.status != current.status,
        builder: (context, state) {
          if (state.status == RequestState.loading) {
            return const CustomLoader();
          }
          final List<Widget> listInpit = [];
          for (var item in state.listDiagnoseSection!.keys) {
            listInpit.add(_TextInput(
              nameKey: item,
              title: state.listDiagnoseSection?[item],
            ));
          }
          return Column(
            children: listInpit,
          );
        });
  }
}

class _TextInput extends StatelessWidget {
  const _TextInput({
    Key? key,
    required this.title,
    required this.nameKey,
  }) : super(key: key);

  final String title;
  final String nameKey;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiagnoseFormCubit, DiagnoseFormState>(
      buildWhen: (previous, current) =>
          previous.diagnoseValues != current.diagnoseValues ||
          previous.errors != current.errors,
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
          child: TextFormField(
            key: Key('${nameKey}_TextInput_textField'),
            onChanged: (value) =>
                context.read<DiagnoseFormCubit>().nameChanged(nameKey, value),
            initialValue: (state.diagnoseValues != null)
                ? state.diagnoseValues![nameKey]
                : '',
            keyboardType: TextInputType.name,
            style: const TextStyle(fontSize: 16),
            decoration: InputDecoration(
              labelText: title,
              labelStyle: const TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
              // filled: true,
              // fillColor: Colors.grey.shade100,
              // contentPadding:
              //     const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
              // errorText: (state.errors != null && state.errors[nameKey] != null)
              //     ? '${state.errors[nameKey].map((item) => item).toList()}'
              //     : null,
            ),
          ),
        );
      },
    );
  }
}

class _TreatmentTextInput extends StatelessWidget {
  const _TreatmentTextInput({
    Key? key,
    this.title,
    this.index,
  }) : super(key: key);
  final String? title;
  final int? index;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiagnoseFormCubit, DiagnoseFormState>(
      buildWhen: (previous, current) => previous.errors != current.errors,
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.all(10.0),
          child: TextFormField(
            key: Key('${index}_TextInput_textField'),
            onChanged: (name) => context
                .read<DiagnoseFormCubit>()
                .treatmentChanged(index!, name),
            initialValue:
                (state.treatments != null) ? state.treatments![index!] : '',
            keyboardType: TextInputType.name,
            style: const TextStyle(fontSize: 16),
            decoration: InputDecoration(
              labelText: title,
              labelStyle: const TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
              // filled: true,
              // fillColor: Colors.grey.shade100,
            ),
          ),
        );
      },
    );
  }
}

class _ShopButton extends StatelessWidget {
  final GlobalKey<State<StatefulWidget>> globalKey;
  const _ShopButton({required this.globalKey});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiagnoseFormCubit, DiagnoseFormState>(
        buildWhen: (previous, current) => previous.status != current.status,
        builder: (context, state) {
          if (state.status == RequestState.loading) {
            return const SizedBox.shrink();
          } else {
            return SizedBox(
              width: context.width * 0.9,
              height: context.height * 0.06,
              child: ElevatedButton(
                onPressed: () {
                  context
                      .read<DiagnoseFormCubit>()
                      .generateReportFile(context, globalKey: globalKey);
                  //.submitFormReport();
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(AppColors.primaryColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                child: Text(
                  'send_report'.tr(),
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            );
          }
        });
  }
}

// class _CancelButton extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<DiagnoseFormCubit, DiagnoseFormState>(
//         buildWhen: (previous, current) => previous.status != current.status,
//         builder: (context, state) {
//           return TextButton(
//               key: const Key('payment_continue_TextButton'),
//               child: Text(
//                 'الغاء',
//                 style: Styles.btnTextWhiteStyle,
//               ),
//               style: TextButton.styleFrom(
//                 backgroundColor: Colors.grey,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(30.0),
//                 ),
//               ),
//               onPressed: () =>
//                   context.read<DiagnoseFormCubit>().typeScreenChanged(
//                         TypeScreen.body,
//                       ));
//         });
//   }
// }
