part of 'record_cubit.dart';

class RecorderState extends Equatable {
  const RecorderState({
    this.recordDuration = 0,
    this.recordFile,
    this.recordState = RecordState.stop,
  });
  final int recordDuration;
  final File? recordFile;
  final RecordState recordState;

  @override
  List<Object?> get props => [
        recordDuration,
        recordFile,
        recordState,
      ];
  RecorderState copyWith({
    int? recordDuration,
    File? recordFile,
    RecordState? recordState,
  }) =>
      RecorderState(
        recordDuration: recordDuration ?? this.recordDuration,
        recordFile: recordFile ?? this.recordFile,
        recordState: recordState ?? this.recordState,
      );
}
