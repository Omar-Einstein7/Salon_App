import 'package:flutter/material.dart';

class NotificationProfileScreen extends StatefulWidget {
  const NotificationProfileScreen({super.key});

  @override
  State<NotificationProfileScreen> createState() => _NotificationProfileScreenState();
}

class _NotificationProfileScreenState extends State<NotificationProfileScreen> {
  final Map<String, bool> _settings = {
    'General Notification': true,
    'Sound': true,
    'Vibrate': true,
    'Special Offers': false,
    'Promo & Discount': false,
    'Payments': true,
    'Cashback': false,
    'App Updates': true,
    'New Service Available': false,
    'New Tips Available': false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Notifications',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: ListView.separated(
          itemCount: _settings.length,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final key = _settings.keys.elementAt(index);
            return ListTile(
              leading: const Icon(
                Icons.notifications_outlined,
                color: Colors.indigo,
              ),
              title: Text(
                key,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              trailing: Switch(
                value: _settings[key]!,
                onChanged: (val) {
                  setState(() {
                    _settings[key] = val;
                  });
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
