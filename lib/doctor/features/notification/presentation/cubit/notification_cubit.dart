import 'package:bloc/bloc.dart';
import 'package:dr/core/utils/http_helper.dart';
import 'package:dr/core/utils/toast_helper.dart';
import 'package:dr/doctor/features/notification/data/models/notifications_model.dart';
import 'package:dr/doctor/features/notification/data/repositories/notifications_repo.dart';
import 'package:equatable/equatable.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit({required this.repository})
      : super(const NotificationState());
  final NotificationsRepo repository;

  List<Notifications>? allNotif = [];
  Future<void> getAllNotifications() async {
    try {
      emit(state.copyWith(notifState: RequestState.loading));
      allNotif = await repository.getAllNotifications();
      emit(state.copyWith(
          notifState: RequestState.success, notifList: allNotif));
    } catch (e) {
      emit(state.copyWith(notifState: RequestState.failed));
      ShowToastHelper.showToast(msg: e.toString(), isError: true);
    }
  }
}
