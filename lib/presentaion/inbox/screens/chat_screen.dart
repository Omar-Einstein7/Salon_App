import 'package:flutter/material.dart';
import 'package:salon_app/core/config/themes/app_theme.dart';
import 'package:salon_app/presentaion/inbox/screens/inbox_screen.dart';
import 'package:salon_app/presentaion/inbox/widgets/message_bubble.dart';
import 'package:salon_app/presentaion/inbox/widgets/message_model.dart';

class ChatScreen extends StatefulWidget {
  final ChatItem chatItem;
  const ChatScreen({super.key, required this.chatItem});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  final List<Message> _messages = [
    Message(
      chatId: "0",
      senderId: "user1",
      receiverId: "user2", 
      message: "Hello! How can I help you today?",
      messageType: "text",
      timestamp: DateTime.now(),
      status: "read"
    ),
    Message(
      chatId: "1",
      senderId: "user2",
      receiverId: "user1",
      message: "Hi! I need assistance with booking.",
      messageType: "text", 
      timestamp: DateTime.now(),
      status: "delivered"
    ),
  ];

  void _sendMessage() {
    final messageText = _messageController.text.trim();
    if (messageText.isNotEmpty) {
      setState(() {
        _messages.insert(
          0,
          Message(
            chatId: DateTime.now().toString(),
            senderId: "user1",
            receiverId: "user2",
            message: messageText,
            messageType: "text",
            timestamp: DateTime.now(),
            status: "sent",
          ),
        );
      });
      _messageController.clear();
    }
  }

  Widget _buildLeadingWidget() {
    return InkWell(
      onTap: () => Navigator.pop(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.arrow_back, size: 22),
          const SizedBox(width: 4),
          Hero(
            tag: widget.chatItem.avatar,
            child: CircleAvatar(
              radius: 16,
              backgroundColor: Colors.black.withOpacity(0.2),
              backgroundImage: NetworkImage(widget.chatItem.avatar),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.chatItem.name),
        Text(
          'online',
          style: TextStyle(fontSize: 13),
        ),
      ],
    );
  }

  List<Widget> _buildActions() {
    return [
      IconButton(
        icon: const Icon(Icons.videocam_off_rounded),
        onPressed: () {},
      ),
      IconButton(
        icon: const Icon(Icons.call),
        onPressed: () {},
      ),
    ];
  }

  Widget _buildMessageInput() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.camera_alt),
            onPressed: () {},
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.emoji_emotions_outlined),
                    color: Colors.grey,
                    onPressed: () {},
                  ),
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      style: const TextStyle(color: Colors.black87),
                      decoration: const InputDecoration(
                        hintText: 'Message',
                        hintStyle: TextStyle(color: Colors.black54),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 8),
          Container(
            decoration: BoxDecoration(
              color: AppTheme.primaryOrange,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(
                Icons.send,
                color: Colors.white,
              ),
              onPressed: _sendMessage,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        elevation: 0,
        leadingWidth: 70,
        leading: _buildLeadingWidget(),
        title: _buildTitle(),
        actions: _buildActions(),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                final bool isSender = message.senderId == "user1";
                
                return BubbleSpecialOne(
                  text: message.message,
                  status: message.status,
                  isSender: isSender,
                );
              },
            ),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }
}
