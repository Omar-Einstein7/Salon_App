import 'package:flutter/material.dart';
import 'package:salon_app/core/config/themes/app_theme.dart';
import 'package:salon_app/core/config/widgets/custom_container_wdt.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample notification data with dates
    final notifications = List.generate(10, (index) {
      return {
        'date': DateTime.now().subtract(Duration(days: index ~/ 3)),
        'title': 'Notification ${index + 1}',
        'message': 'This is a sample notification message. Tap to view more details.',
      };
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: notifications.length * 2 - 1,
        itemBuilder: (context, index) {
          if (index.isOdd) {
            return const Divider(color: Colors.transparent);
          }
      
          final notificationIndex = index ~/ 2;
          final notification = notifications[notificationIndex];
          final date = notification['date'] as DateTime;
      
          if (notificationIndex == 0 ||
              date.day != (notifications[notificationIndex - 1]['date'] as DateTime).day) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    _formatDate(date),
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                ),
                _buildNotificationCard(context, notification, date),
              ],
            );
          }
      
          return _buildNotificationCard(context, notification, date);
        },
      ),
    );
  }

  Widget _buildNotificationCard(BuildContext context, Map<String, dynamic> notification, DateTime date) {
    return CustomContainerWdt(
      
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          child: Icon(
            Icons.notifications_outlined,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        title: Text(
          notification['title'] as String,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(
            notification['message'] as String,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            '${date.hour}:${date.minute.toString().padLeft(2, '0')}',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
        ),
        onTap: () {
          // Handle notification tap
        },
      ),
    );
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    if (date.year == now.year &&
        date.month == now.month &&
        date.day == now.day) {
      return 'Today';
    } else if (date.year == now.year &&
        date.month == now.month &&
        date.day == now.day - 1) {
      return 'Yesterday';
    }
    return '${date.day}/${date.month}/${date.year}';
  }
}