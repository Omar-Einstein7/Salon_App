import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:salon_app/domain/inbox/repositories/message_repository.dart';
import 'package:salon_app/presentaion/inbox/bloc/message_event.dart';
import 'package:salon_app/presentaion/inbox/bloc/message_state.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  final MessageRepository messageRepository;
  StreamSubscription? _messagesSubscription;

  MessageBloc({required this.messageRepository}) : super(MessageInitial()) {
    on<LoadMessages>(_onLoadMessages);
    on<SendMessage>(_onSendMessage);
    on<DeleteMessage>(_onDeleteMessage);
    on<UpdateMessageStatus>(_onUpdateMessageStatus);
    on<MessageReceived>(_onMessageReceived);
  }

  Future<void> _onLoadMessages(
    LoadMessages event,
    Emitter<MessageState> emit,
  ) async {
    emit(MessageLoading());
    
    final result = await messageRepository.getMessages(event.chatId);
    
    result.fold(
      (failure) => emit(MessageError(message: failure.toString())),
      (messages) {
        emit(MessagesLoaded(messages: messages));
        // Start listening to message stream
        _messagesSubscription?.cancel();
        _messagesSubscription = messageRepository
            .getMessagesStream(event.chatId)
            .listen((messages) {
          add(MessageReceived(message: messages.last));
        });
      },
    );
  }

  Future<void> _onSendMessage(
    SendMessage event,
    Emitter<MessageState> emit,
  ) async {
    emit(MessageSending());
    
    final result = await messageRepository.sendMessage(event.message);
    
    result.fold(
      (failure) => emit(MessageError(message: failure.toString())),
      (message) => emit(MessageSent(message: message)),
    );
  }

  Future<void> _onDeleteMessage(
    DeleteMessage event,
    Emitter<MessageState> emit,
  ) async {
    final result = await messageRepository.deleteMessage(event.messageId);
    
    result.fold(
      (failure) => emit(MessageError(message: failure.toString())),
      (_) => emit(MessageDeleted(messageId: event.messageId)),
    );
  }

  Future<void> _onUpdateMessageStatus(
    UpdateMessageStatus event,
    Emitter<MessageState> emit,
  ) async {
    final result = await messageRepository.updateMessageStatus(
      event.messageId,
      event.status,
    );
    
    result.fold(
      (failure) => emit(MessageError(message: failure.toString())),
      (_) => emit(MessageStatusUpdated(
        messageId: event.messageId,
        status: event.status,
      )),
    );
  }

  void _onMessageReceived(
    MessageReceived event,
    Emitter<MessageState> emit,
  ) {
    if (state is MessagesLoaded) {
      final currentMessages = (state as MessagesLoaded).messages;
      emit(MessagesLoaded(
        messages: List.from(currentMessages)..add(event.message),
      ));
    }
  }

  @override
  Future<void> close() {
    _messagesSubscription?.cancel();
    return super.close();
  }
}