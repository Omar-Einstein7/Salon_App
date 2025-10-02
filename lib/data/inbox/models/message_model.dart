import 'package:salon_app/domain/inbox/entities/message_entity.dart';

class MessageModel extends MessageEntity {
  const MessageModel({
    String? messageId,
    required String chatId,
    required String senderId,
    required String receiverId,
    required String message,
    required String messageType,
    String? mediaUrl,
    required DateTime timestamp,
    required String status,
    bool isDeleted = false,
  }) : super(
          messageId: messageId,
          chatId: chatId,
          senderId: senderId,
          receiverId: receiverId,
          message: message,
          messageType: messageType,
          mediaUrl: mediaUrl,
          timestamp: timestamp,
          status: status,
          isDeleted: isDeleted,
        );

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      messageId: json['messageId'] as String?,
      chatId: json['chatId'] as String,
      senderId: json['senderId'] as String,
      receiverId: json['receiverId'] as String,
      message: json['message'] as String,
      messageType: json['messageType'] as String,
      mediaUrl: json['mediaUrl'] as String?,
      timestamp: DateTime.parse(json['timestamp'] as String),
      status: json['status'] as String,
      isDeleted: json['isDeleted'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'messageId': messageId,
      'chatId': chatId,
      'senderId': senderId,
      'receiverId': receiverId,
      'message': message,
      'messageType': messageType,
      'mediaUrl': mediaUrl,
      'timestamp': timestamp.toIso8601String(),
      'status': status,
      'isDeleted': isDeleted,
    };
  }

  MessageModel copyWith({
    String? messageId,
    String? chatId,
    String? senderId,
    String? receiverId,
    String? message,
    String? messageType,
    String? mediaUrl,
    DateTime? timestamp,
    String? status,
    bool? isDeleted,
  }) {
    return MessageModel(
      messageId: messageId ?? this.messageId,
      chatId: chatId ?? this.chatId,
      senderId: senderId ?? this.senderId,
      receiverId: receiverId ?? this.receiverId,
      message: message ?? this.message,
      messageType: messageType ?? this.messageType,
      mediaUrl: mediaUrl ?? this.mediaUrl,
      timestamp: timestamp ?? this.timestamp,
      status: status ?? this.status,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }
}