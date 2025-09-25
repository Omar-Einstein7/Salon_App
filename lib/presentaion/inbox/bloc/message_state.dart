import 'package:equatable/equatable.dart';
import 'package:salon_app/domain/inbox/entities/message_entity.dart';

abstract class MessageState extends Equatable {
  const MessageState();

  @override
  List<Object?> get props => [];
}

class MessageInitial extends MessageState {}

class MessageLoading extends MessageState {}

class MessagesLoaded extends MessageState {
  final List<MessageEntity> messages;

  const MessagesLoaded({required this.messages});

  @override
  List<Object?> get props => [messages];
}

class MessageSending extends MessageState {}

class MessageSent extends MessageState {
  final MessageEntity message;

  const MessageSent({required this.message});

  @override
  List<Object?> get props => [message];
}

class MessageError extends MessageState {
  final String message;

  const MessageError({required this.message});

  @override
  List<Object?> get props => [message];
}

class MessageDeleted extends MessageState {
  final String messageId;

  const MessageDeleted({required this.messageId});

  @override
  List<Object?> get props => [messageId];
}

class MessageStatusUpdated extends MessageState {
  final String messageId;
  final String status;

  const MessageStatusUpdated({
    required this.messageId,
    required this.status,
  });

  @override
  List<Object?> get props => [messageId, status];
}