part of 'chats_cubit.dart';

class ChatsState extends Equatable {
  ChatsState({
    this.content = "",
    this.messagesList,
    this.getMsgState = RequestState.initial,
    this.sendMsgState = RequestState.initial,
  });

  final String? content;
  final List<Messages>? messagesList;
  final RequestState sendMsgState;
  final RequestState getMsgState;
  @override
  List<Object?> get props => [
        content,
        messagesList,
        sendMsgState,
        getMsgState,
      ];
  ChatsState copyWith({
    String? content,
    List<Messages>? messagesList,
    RequestState? sendMsgState,
    RequestState? getMsgState,
  }) =>
      ChatsState(
        content: content ?? this.content,
        getMsgState: getMsgState ?? this.getMsgState,
        messagesList: messagesList ?? this.messagesList,
        sendMsgState: sendMsgState ?? this.sendMsgState,
      );
}
