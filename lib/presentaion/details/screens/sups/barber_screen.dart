import 'package:flutter/material.dart';
import 'package:salon_app/core/config/widgets/custom_appbar_wdt.dart';
import 'package:salon_app/core/config/widgets/custom_container_wdt.dart';

class BarberScreen extends StatelessWidget {
  const BarberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> barbers = [
      {'name': 'John Doe', 'rating': 4.8, 'specialty': 'Classic Cuts'},
      {'name': 'Jane Smith', 'rating': 4.9, 'specialty': 'Color & Style'},
      {'name': 'Mike Johnson', 'rating': 4.7, 'specialty': 'Beard Grooming'},
      {'name': 'Sarah Williams', 'rating': 4.9, 'specialty': 'Kids Haircuts'},
      {'name': 'David Brown', 'rating': 4.6, 'specialty': 'Trendy Styles'},
    ];

    return Scaffold(
      appBar: IOSAppBar(

        context: context,
        title: Text("Barber"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: barbers.length,
        itemBuilder: (context, index) {
          final barber = barbers[index];
          return CustomContainerWdt(
            margin: const EdgeInsets.only(bottom: 12),
           
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () {
                // Handle barber selection
              },
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 28,
                      
                      child: const Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            barber['name'],
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            barber['specialty'],
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
