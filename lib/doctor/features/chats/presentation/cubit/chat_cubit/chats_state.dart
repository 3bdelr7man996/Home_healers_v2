part of 'chats_cubit.dart';

class ChatsState extends Equatable {
  ChatsState({
    this.content = "",
    this.messagesList,
    this.conversationsList,
    this.onlineUsers,
    this.getMsgState = RequestState.initial,
    this.sendMsgState = RequestState.initial,
    this.conversationState = RequestState.initial,
    this.fileType,
    this.msgFile,
    this.playedAudioName = '',
    this.audioPlay = false,
  });

  final String? content;
  final List<Messages>? messagesList;
  final List<Conversations>? conversationsList;
  final List<OnlineUsers>? onlineUsers;
  final RequestState sendMsgState;
  final RequestState getMsgState;
  final RequestState conversationState;
  final String? fileType;
  final File? msgFile;
  final String playedAudioName;
  final bool audioPlay;

  @override
  List<Object?> get props => [
        content,
        messagesList,
        conversationsList,
        onlineUsers,
        sendMsgState,
        getMsgState,
        conversationState,
        fileType,
        msgFile,
        playedAudioName,
        audioPlay,
      ];
  ChatsState copyWith({
    String? content,
    List<Messages>? messagesList,
    List<Conversations>? conversationsList,
    List<OnlineUsers>? onlineUsers,
    List<OnlineAdvs>? onlineAdvs,
    RequestState? sendMsgState,
    RequestState? getMsgState,
    RequestState? conversationState,
    String? Function()? fileType,
    File? Function()? msgFile,
    String? playedAudioName,
    bool? audioPlay,
  }) =>
      ChatsState(
        content: content ?? this.content,
        getMsgState: getMsgState ?? this.getMsgState,
        messagesList: messagesList ?? this.messagesList,
        onlineUsers: onlineUsers ?? this.onlineUsers,
        sendMsgState: sendMsgState ?? this.sendMsgState,
        conversationsList: conversationsList ?? this.conversationsList,
        conversationState: conversationState ?? this.conversationState,
        fileType: fileType != null ? fileType() : this.fileType,
        msgFile: msgFile != null ? msgFile() : this.msgFile,
        playedAudioName: playedAudioName ?? this.playedAudioName,
        audioPlay: audioPlay ?? this.audioPlay,
      );
}
