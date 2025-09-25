import 'package:equatable/equatable.dart';

class MessageEntity extends Equatable {
  final String? messageId;
  final String chatId;
  final String senderId;
  final String receiverId;
  final String message;
  final String messageType;
  final String? mediaUrl;
  final DateTime timestamp;
  final String status;
  final bool isDeleted;

  const MessageEntity({
    this.messageId,
    required this.chatId,
    required this.senderId,
    required this.receiverId,
    required this.message,
    required this.messageType,
    this.mediaUrl,
    required this.timestamp,
    required this.status,
    this.isDeleted = false,
  });

  @override
  List<Object?> get props => [
        messageId,
        chatId,
        senderId,
        receiverId,
        message,
        messageType,
        mediaUrl,
        timestamp,
        status,
        isDeleted,
      ];
}