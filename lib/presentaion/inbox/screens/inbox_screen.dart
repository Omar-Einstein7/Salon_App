import 'package:flutter/material.dart';
import 'package:salon_app/core/config/widgets/custom_container_wdt.dart';
import 'package:salon_app/presentaion/details/widgets/filter_chip.dart';
import 'package:salon_app/presentaion/inbox/screens/call_screen.dart';
import 'package:salon_app/presentaion/inbox/screens/chat_screen.dart';

class ChatItem {
  final String name;
  final String message;
  final String time;
  final String date;
  final String avatar;
  final int unreadCount;

  ChatItem({
    required this.name,
    required this.message,
    required this.time,
    required this.date,
    required this.avatar,
    required this.unreadCount,
  });
}

class CallItem {
  final String name;
  final String status;
  final String time;
  final String avatar;
  final bool isMissed;

  CallItem({
    required this.name,
    required this.status,
    required this.time,
    required this.avatar,
    required this.isMissed,
  });
}

class InboxScreen extends StatefulWidget {
  const InboxScreen({super.key});

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  List<String> filterOptions = ['Chat', 'Call'];
  String selectedFilter = 'Chat';

  final List<ChatItem> chatItems = [
    ChatItem(
      name: 'Sarah Johnson',
      message: 'When is my next appointment?',
      time: '10:30 AM',
      date: 'Today',
      avatar: 'https://picsum.photos/60/60?random=1',
      unreadCount: 3,
    ),
    ChatItem(
      name: 'Mike Smith',
      message: 'Thanks for the great service!',
      time: '9:15 AM',
      date: 'Today',
      avatar: 'https://picsum.photos/60/60?random=2',
      unreadCount: 0,
    ),
  ];

  final List<CallItem> callItems = [
    CallItem(
      name: 'DAD',
      status: 'Missed Call (2)',
      time: '2:45 PM',
      avatar: 'https://picsum.photos/60/60?random=3',
      isMissed: true,
    ),
    CallItem(
      name: 'SKRN',
      status: 'Outgoing Call',
      time: '11:20 AM',
      avatar: 'https://picsum.photos/60/60?random=4',
      isMissed: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inbox'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          CustomContainerWdt(
            color: Theme.of(context).scaffoldBackgroundColor,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            height: 60,
            child: Row(
              children: filterOptions.map((option) {
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: CustomFilterChip(
                      width: 120,
                      label: option,
                      isSelected: selectedFilter == option,
                      onSelected: (selected) {
                        setState(() {
                          selectedFilter = option;
                        });
                      },
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          Expanded(
            child: selectedFilter == 'Chat' ? _buildChatList() : _buildCallList(),
          ),
        ],
      ),
    );
  }

  Widget _buildChatList() {
    return ListView.builder(
      itemCount: chatItems.length,
      itemBuilder: (context, index) {
        final item = chatItems[index];
        return ChatItemWidget(
          item: item,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatScreen(chatItem: item), // Fixed block
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildCallList() {
    return ListView.builder(
      itemCount: callItems.length,
      itemBuilder: (context, index) {
        final item = callItems[index];
        return CallItemWidget(item: item , onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CallScreen(name: item.name , avatar: item.avatar,),
            ),
          );
        },);
      },
    );
  }
}

class ChatItemWidget extends StatelessWidget {
  final ChatItem item;
  final VoidCallback onTap;

  const ChatItemWidget({
    super.key,
    required this.item,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CustomContainerWdt(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(item.avatar),
                  ),
                  if (item.unreadCount > 0)
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          '${item.unreadCount}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          item.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              item.time,
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              item.date,
                              style: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.message,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14,
                        fontWeight: item.unreadCount > 0 ? FontWeight.bold : FontWeight.normal,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CallItemWidget extends StatelessWidget {
  final CallItem item;
   final VoidCallback onTap;
  

  const CallItemWidget({super.key, required this.item, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CustomContainerWdt(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(item.avatar),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          item.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          item.time,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(
                          item.isMissed ? Icons.call_missed : Icons.call_made,
                          size: 16,
                          color: item.isMissed ? Colors.red : Colors.green,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          item.status,
                          style: TextStyle(
                            color: item.isMissed ? Colors.red : Colors.grey[600],
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}