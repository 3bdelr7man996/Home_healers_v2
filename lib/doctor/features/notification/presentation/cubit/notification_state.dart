part of 'notification_cubit.dart';

class NotificationState extends Equatable {
  const NotificationState({
    this.notifList,
    this.notifState = RequestState.initial,
  });
  final List<Notifications>? notifList;
  final RequestState notifState;
  @override
  List<Object?> get props => [
        notifList,
        notifState,
      ];

  NotificationState copyWith({
    List<Notifications>? notifList,
    RequestState? notifState,
  }) =>
      NotificationState(
        notifList: notifList ?? this.notifList,
        notifState: notifState ?? this.notifState,
      );
}
