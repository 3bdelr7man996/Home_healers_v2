import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dr/doctor/features/chats/presentation/cubit/chat_cubit/chats_cubit.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:io';
import 'dart:typed_data';

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';

part 'record_state.dart';

class RecorderCubit extends Cubit<RecorderState> {
  RecorderCubit() : super(RecorderState());
  final AudioRecorder recorder = AudioRecorder();
  Timer? timer;

  //STREAMS
  Stream<double> get amplitudeStream => recorder
      .onAmplitudeChanged(const Duration(milliseconds: 160))
      .map((amp) => amp.current);
  Stream<RecordState> get recordStateStream => recorder.onStateChanged();

  ///Starts new recording session.
  Future<void> recordFile(RecordConfig config) async {
    final path = await _getPath();

    await recorder.start(config, path: path);
  }

  ///Same as [start] with output stream instead of a path.
  Future<void> recordStream(RecordConfig config) async {
    final path = await _getPath();

    final file = File(path);

    final stream = await recorder.startStream(config);

    stream.listen(
      (data) {
        // ignore: avoid_print
        print(
          recorder.convertBytesToInt16(Uint8List.fromList(data)),
        );
        file.writeAsBytesSync(data, mode: FileMode.append);
      },
      // ignore: avoid_print
      onDone: () {
        // ignore: avoid_print
        print('End of stream. File written to $path.');
      },
    );
  }

  ///GET CURRENT AUDIO PATH
  Future<String> _getPath() async {
    final dirPath = (await getApplicationDocumentsDirectory()).path;
    final dir = Directory(p.join(dirPath, 'healers_audio'));
    if (!await dir.exists()) {
      dir.create();
    }
    return p.join(
      dir.path,
      'audio_${DateTime.now().millisecondsSinceEpoch}.m4a',
    );
  }

  ///handle start record button
  Future<void> start() async {
    try {
      if (await recorder.hasPermission()) {
        const config = RecordConfig();

        // Record to file
        await recordFile(config);
        emit(state.copyWith(recordDuration: 0));
        // log("Start timer from start ");
        // startTimer();
      }
    } catch (e) {
      print(e);
    }
  }

  ///handle srop record button
  Future<void> stop(BuildContext context) async {
    final path = await recorder.stop();

    if (path != null) {
      BlocProvider.of<ChatsCubit>(context).onChangeFile(() => File(path));
      BlocProvider.of<ChatsCubit>(context)
          .onChangeFiletype(() => FileType.record.name);
    }
  }

  ///handle pause record button
  Future<void> pause() => recorder.pause();

  ///handle resume record button
  Future<void> resume() => recorder.resume();

  ///change state of record
  void updateRecordState(RecordState recordState) {
    emit(state.copyWith(recordState: recordState));

    switch (recordState) {
      case RecordState.pause:
        timer?.cancel();
        break;
      case RecordState.record:
        log("Start timer fro update state");
        startTimer();
        break;
      case RecordState.stop:
        timer?.cancel();
        emit(state.copyWith(recordDuration: 0));
        break;
    }
  }

  ///Edit timer format
  String formatNumber() {
    StringBuffer minutes = StringBuffer(state.recordDuration ~/ 60);
    StringBuffer seconds = StringBuffer(state.recordDuration % 60);

    // String numberStr = number.toString();

    return '${minutes.toString().padLeft(2, '0')} : ${seconds.toString().padLeft(2, '0')}';
  }

  ///start timer of record
  void startTimer() {
    timer?.cancel();

    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      emit(state.copyWith(recordDuration: state.recordDuration + 1));
    });
  }
}
