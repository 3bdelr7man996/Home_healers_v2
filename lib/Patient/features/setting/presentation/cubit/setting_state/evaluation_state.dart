// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class evaluationsState extends Equatable {
  evaluationsState({
    this.Data = false,
    this.rate,
    this.showEvaluationPopUp = 0,
  });
  var Data, rate, showEvaluationPopUp;

  @override
  @override
  List<Object?> get props => [Data, rate, showEvaluationPopUp];
  evaluationsState copyWith({var Data, rate, showEvaluationPopUp}) =>
      evaluationsState(
        Data: Data ?? this.Data,
        rate: rate ?? this.rate,
        showEvaluationPopUp: showEvaluationPopUp ?? this.showEvaluationPopUp,
      );
}
