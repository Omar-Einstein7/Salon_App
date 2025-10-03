import 'package:flutter/material.dart';
import 'package:salon_app/core/config/widgets/custom_container_wdt.dart';

class AboutUsSection extends StatelessWidget {
  const AboutUsSection({super.key});

  void _showFullAboutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const SingleChildScrollView(
          child: Text(
            textAlign: TextAlign.center,
            'We are a premium salon dedicated to providing the highest quality service. Our team of skilled professionals brings years of experience and expertise to every service we offer. We believe in creating a luxurious and relaxing environment where clients can unwind while receiving top-notch beauty treatments. From cutting-edge styling techniques to rejuvenating spa services, we are committed to exceeding your expectations and helping you look and feel your absolute best.',
            style: TextStyle(fontSize: 16, height: 1.5),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About Our Salon',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'We are a premium salon dedicated to providing the highest quality service. Our team of skilled professionals brings years of experience and expertise to every service we offer. We believe in creating a luxurious and relaxing environment where clients can unwind while receiving top-notch beauty treatments. From cutting-edge styling techniques to rejuvenating spa services, we are committed to exceeding your expectations and helping you look and feel your absolute best.',
                style: Theme.of(context).textTheme.bodyMedium,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              InkWell(
                onTap: () => _showFullAboutDialog(context),
                child: Text(
                  'Read More',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            'Working Hours',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Text(
            'Monday - Friday: 9:00 AM - 8:00 PM\n'
            'Saturday: 10:00 AM - 6:00 PM\n'
            'Sunday: Closed',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 20),
          const Text(
            'Contact Us',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'Phone: +1 234 567 8900\n'
            'Email: info@salonspa.com',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 20),
          const Text(
            'Location',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            '123 Salon Street, Beauty District\n'
            'New York, NY 10001',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 12),
          CustomContainerWdt(
            height: 180,
            child: Center(
              child: Icon(
                Icons.location_on,
                size: 40,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

