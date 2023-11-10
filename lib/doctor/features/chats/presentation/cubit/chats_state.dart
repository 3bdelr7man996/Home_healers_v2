part of 'chats_cubit.dart';

class ChatsState extends Equatable {
  ChatsState({
    this.content = "",
    this.allMessages,
  });

  final String? content;
  var allMessages;
  @override
  List<Object?> get props => [content, allMessages];
  ChatsState copyWith({
    String? content,
    var allMessages,
  }) =>
      ChatsState(
        content: content ?? this.content,
        allMessages: allMessages ?? this.allMessages,
      );
}
