import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black87),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Privacy Policy',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            _sectionTitle('Effective Date'),
            _sectionText('January 1, 2024'),
            const SizedBox(height: 24),
            _sectionTitle('Information We Collect'),
            _sectionText(
              'We collect information you provide directly to us, such as when you create an account, book an appointment, or contact us for support.',
            ),
            const SizedBox(height: 16),
            _sectionTitle('How We Use Your Information'),
            _bulletPoint('Process and confirm your bookings'),
            _bulletPoint('Send you appointment reminders'),
            _bulletPoint('Improve our services and app experience'),
            _bulletPoint('Communicate with you about promotions and updates'),
            const SizedBox(height: 16),
            _sectionTitle('Data Security'),
            _sectionText(
              'We implement industry-standard security measures to protect your personal information from unauthorized access, alteration, or destruction.',
            ),
            const SizedBox(height: 16),
            _sectionTitle('Third-Party Services'),
            _sectionText(
              'We may share your information with trusted third-party service providers who assist us in operating our app and conducting our business.',
            ),
            const SizedBox(height: 16),
            _sectionTitle('Your Rights'),
            _sectionText(
              'You have the right to access, update, or delete your personal information at any time by contacting us through the app.',
            ),
            const SizedBox(height: 32),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurpleAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                ),
                onPressed: () => Navigator.of(context).pop(),
                child: const Text(
                  'I Understand',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.deepPurpleAccent,
        ),
      ),
    );
  }

  Widget _sectionText(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 15,
        height: 1.5,
        color: Colors.grey[800],
      ),
    );
  }

  Widget _bulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 6, right: 12),
            child: Icon(
              Icons.circle,
              size: 6,
              color: Colors.deepPurpleAccent,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 15,
                height: 1.5,
                color: Colors.grey[800],
              ),
            ),
          ),
        ],
      ),
    );
  }
}