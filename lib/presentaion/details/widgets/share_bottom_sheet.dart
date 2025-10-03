import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ShareBottomSheet extends StatelessWidget {
  const ShareBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final socialApps = [
      {'name': 'WhatsApp', 'icon': FontAwesomeIcons.whatsapp, 'color': Colors.green},
      {'name': 'Facebook', 'icon': FontAwesomeIcons.facebook, 'color': Colors.blue},
      {'name': 'Instagram', 'icon': FontAwesomeIcons.instagram, 'color': Colors.purple},
      {'name': 'Twitter', 'icon': FontAwesomeIcons.twitter, 'color': Colors.lightBlue},
      {'name': 'Telegram', 'icon': FontAwesomeIcons.telegram, 'color': Colors.blueAccent},
      {'name': 'Snapchat', 'icon': FontAwesomeIcons.snapchat, 'color': Colors.yellow},
      {'name': 'Messenger', 'icon': FontAwesomeIcons.facebookMessenger, 'color': Colors.blue.shade600},
      {'name': 'Copy Link', 'icon': FontAwesomeIcons.link, 'color': Colors.grey},
    ];

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Handle bar
          Container(
            width: 40,
            height: 4,
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const Text(
            'Share Salon',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 0.9,
            ),
            itemCount: socialApps.length,
            itemBuilder: (context, index) {
              final app = socialApps[index];
              return GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Column(
                  children: [
                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        color: (app['color'] as Color).withOpacity(0.12),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        app['icon'] as IconData,
                        color: app['color'] as Color,
                        size: 28,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      app['name'] as String,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            },
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'Cancel',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}