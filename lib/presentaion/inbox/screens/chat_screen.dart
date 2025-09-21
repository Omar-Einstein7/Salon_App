import 'package:flutter/material.dart';
import 'package:salon_app/core/config/themes/app_theme.dart';

import 'package:salon_app/presentaion/inbox/screens/inbox_screen.dart';

class ChatScreen extends StatefulWidget {
  final ChatItem chatItem;
  const ChatScreen({super.key, required this.chatItem});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with SingleTickerProviderStateMixin {
  final TextEditingController _messageController = TextEditingController();
  final List<ChatMessage> _messages = [];
  final ScrollController _scrollController = ScrollController();
  bool _isRecording = false;

  @override
  void initState() {
    super.initState();
    _messageController.addListener(_onTextChanged);
    _addInitialMessages();
  }

  void _addInitialMessages() {
    _messages.insert(
      0,
      ChatMessage(
        message: 'Hello! How can I help you today?',
        isMe: false,
        senderName: widget.chatItem.name,
        senderAvatar: widget.chatItem.avatar,
        time: '10:00 AM',
        date: 'Today',
      ),
    );
    _messages.insert(
      0,
      ChatMessage(
        message: 'Hello! How can I help you today?',
        isMe: true,
        senderName: widget.chatItem.name,
        senderAvatar: widget.chatItem.avatar,
        time: '10:01 AM',
        date: 'Today',
      ),
    );
  }

  void _onTextChanged() {
    setState(() {}); // Simply rebuild to reflect changes in text field state
  }

  void _sendMessage() {
    final messageText = _messageController.text.trim();
    if (messageText.isNotEmpty) {
      setState(() {
        _messages.insert(
          0,
          ChatMessage(
            message: messageText,
            isMe: true,
            senderName: 'You',
            senderAvatar: 'https://picsum.photos/60/60?random=5',
            time: '${DateTime.now().hour}:${DateTime.now().minute}',
            date: 'Today',
          ),
        );
        _messageController.clear();
      });
    }
  }

  void _handleVoiceNote() {
    setState(() {
      _isRecording = !_isRecording;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        children: [
          _buildMessageList(),
          _buildMessageInput(),
        ],
        
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      elevation: 0,
      leadingWidth: 70,
      leading: _buildLeadingWidget(),
      title: _buildTitle(),
      actions: _buildActions(),
    );
  }

  Widget _buildLeadingWidget() {
    return InkWell(
      onTap: () => Navigator.pop(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.arrow_back, size: 22), // White icon
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
        Text(
          widget.chatItem.name,
          // White text
        ),
        const Text(
          'online',
          style: TextStyle(
             // Lighter white for status
            fontSize: 13,
          ),
        ),
      ],
    );
  }

  List<Widget> _buildActions() {
    return [
      IconButton(
        icon: const Icon(Icons.videocam_off_rounded), // White icon
        onPressed: () {},
      ),
      IconButton(
        icon: const Icon(Icons.call), // White icon
        onPressed: () {},
      ),
    ];
  }

  Widget _buildMessageList() {
    return Expanded(
      child: ListView.builder(
        controller: _scrollController,
        reverse: true,
        itemCount: _messages.length,
        itemBuilder: (context, index) {
          final message = _messages[index];
          final bool showDateSeparator = index == _messages.length - 1 ||
              message.date != _messages[index + 1].date;

          return Column(
            children: [
              if (showDateSeparator) DateSeparator(date: message.date),
              message,
            ],
          );
        },
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
      decoration: const BoxDecoration(
        color: Colors.transparent, // Make background transparent
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.camera_alt),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
          _buildTextInput(),
          const SizedBox(width: 8),
          _buildSendButton(),
        ],
      ),
    );
  }

  Widget _buildTextInput() {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
             color: Colors.white,// White background for text field
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
                style: const TextStyle(
                  color: Colors.black87, // Dark text color
                ),
                controller: _messageController,
                decoration: const InputDecoration(
                  hintText: 'Message',
                  hintStyle: TextStyle(
                    color: Colors.black54, // Dark hint text color
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                ),
              ),
            ),
            // Removed attachment and camera icons from here
          ],
        ),
      ),
    );
  }

  Widget _buildSendButton() {
    return SizedBox(
      width: 48,
      height: 48,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return ScaleTransition(scale: animation, child: child);
        },
        child: _messageController.text.isEmpty
            ? Container(
                key: const ValueKey('mic'),
                decoration: BoxDecoration(
                  color: _isRecording ? Colors.red : AppTheme.primaryOrange, // WhatsApp green
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: Icon(
                    _isRecording ? Icons.stop : Icons.mic,
                    color: Colors.white,
                  ),
                  onPressed: _handleVoiceNote,
                ),
              )
            : Container(
                key: const ValueKey('send'),
                decoration: const BoxDecoration(
                  color: AppTheme.primaryOrange, // WhatsApp green
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
      ),
    );
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    // Removed _animationController.dispose();
    super.dispose();
  }
}

class DateSeparator extends StatelessWidget {
  final String date;

  const DateSeparator({Key? key, required this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
          decoration: BoxDecoration(
            color: Colors.grey[700], // Darker grey for WhatsApp-like date separator
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Text(
            date,
            style: const TextStyle(
              color: Colors.white, // White text for better contrast
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String message;
  final bool isMe;
  final String? senderName;
  final String? senderAvatar;
  final String time;
  final String date;

  const ChatMessage({
    Key? key,
    required this.message,
    required this.isMe,
    this.senderName,
    this.senderAvatar,
    required this.time,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      child: Row(
        mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isMe && senderAvatar != null) ...[
            CircleAvatar(
              radius: 16,
              backgroundImage: NetworkImage(senderAvatar!),
            ),
            const SizedBox(width: 8),
          ],
          Align(
            alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.6,
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                decoration: BoxDecoration(
                  color: isMe ? AppTheme.primaryOrange : Theme.of(context).cardColor, // WhatsApp green for sent, white for received
                  borderRadius: isMe
                      ? const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          bottomLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                          bottomRight: Radius.circular(2),
                        )
                      : const BorderRadius.only(
                          topRight: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                          topLeft: Radius.circular(12),
                          bottomLeft: Radius.circular(2),
                        ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (!isMe && senderName != null) ...[
                      Text(
                        senderName!,
                        style:  TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Theme.of(context).textTheme.bodyLarge?.color ,
                        ),
                      ),
                      const SizedBox(height: 4),
                    ],
                    Text(
                      message,
                      style: TextStyle(
                        color: isMe ? Colors.white : Theme.of(context).textTheme.bodyLarge?.color,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        time,
                        style: TextStyle(
                          
                          color: isMe ? Colors.white : Theme.of(context).textTheme.bodyLarge?.color,
                          fontSize: 10,
                        ),
                      ),

                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
