import 'package:flutter/material.dart';

class NotificationProfileScreen extends StatefulWidget {
  const NotificationProfileScreen({super.key});

  @override
  State<NotificationProfileScreen> createState() => _NotificationProfileScreenState();
}

class _NotificationProfileScreenState extends State<NotificationProfileScreen> {
  final List<bool> _switches = List.generate(10, (_) => false);

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
          itemCount: 10,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            return ListTile(
        
            
              leading: const Icon(
                Icons.notifications_outlined,
                color: Colors.indigo,
              ),
              title: Text(
                'Notification ${index + 1}',
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              trailing: Switch(
            
                value: _switches[index],
                onChanged: (val) {
                  setState(() {
                    _switches[index] = val;
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
