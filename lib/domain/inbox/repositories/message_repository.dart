import 'package:dartz/dartz.dart';
import 'package:salon_app/domain/inbox/entities/message_entity.dart';

class Failure {
  final String message;
  final int code;

  const Failure({
    required this.message,
    this.code = 0,
  });

  @override
  String toString() => 'Failure(message: $message, code: $code)';
}

abstract class MessageRepository {
  Future<Either<Failure, List<MessageEntity>>> getMessages(String chatId);
  Future<Either<Failure, MessageEntity>> sendMessage(MessageEntity message);
  Future<Either<Failure, void>> deleteMessage(String messageId);
  Future<Either<Failure, void>> updateMessageStatus(String messageId, String status);
  Stream<List<MessageEntity>> getMessagesStream(String chatId);
}
