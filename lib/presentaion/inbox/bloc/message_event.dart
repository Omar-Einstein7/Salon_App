import 'package:equatable/equatable.dart';
import 'package:salon_app/domain/inbox/entities/message_entity.dart';

abstract class MessageEvent extends Equatable {
  const MessageEvent();

  @override
  List<Object?> get props => [];
}

class LoadMessages extends MessageEvent {
  final String chatId;

  const LoadMessages({required this.chatId});

  @override
  List<Object?> get props => [chatId];
}

class SendMessage extends MessageEvent {
  final MessageEntity message;

  const SendMessage({required this.message});

  @override
  List<Object?> get props => [message];
}

class DeleteMessage extends MessageEvent {
  final String messageId;

  const DeleteMessage({required this.messageId});

  @override
  List<Object?> get props => [messageId];
}

class UpdateMessageStatus extends MessageEvent {
  final String messageId;
  final String status;

  const UpdateMessageStatus({
    required this.messageId,
    required this.status,
  });

  @override
  List<Object?> get props => [messageId, status];
}

class MessageReceived extends MessageEvent {
  final MessageEntity message;

  const MessageReceived({required this.message});

  @override
  List<Object?> get props => [message];
}