import 'package:flutter/material.dart';
import 'package:salon_app/core/config/widgets/custom_button.dart';
import 'package:salon_app/core/config/widgets/custom_container_wdt.dart';
import 'package:salon_app/presentaion/details/widgets/action_button.dart';
import 'package:salon_app/presentaion/details/widgets/filter_chip.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});
  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  String selectedFilter = 'About Us';
  Widget _buildFilterContent() {
    switch (selectedFilter) {
      case 'About Us':
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
                    onTap: () {
                      // Show dialog with full text
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          content: SingleChildScrollView(
                            child: Text(
                              textAlign: TextAlign.center,
                              'We are a premium salon dedicated to providing the highest quality service. Our team of skilled professionals brings years of experience and expertise to every service we offer. We believe in creating a luxurious and relaxing environment where clients can unwind while receiving top-notch beauty treatments. From cutting-edge styling techniques to rejuvenating spa services, we are committed to exceeding your expectations and helping you look and feel your absolute best.',
                              style: TextStyle(fontSize: 16, height: 1.5),
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text('Close'),
                            ),
                          ],
                        ),
                      );
                    },
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
 case 'Services':
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.spa_outlined,
              size: 32,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(width: 12),
            Text(
              'Our Services',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
            ),
          ],
        ),

        const SizedBox(height: 20),

        // استبدل ListView.builder بــ Column + List.generate
        Column(
          children: List.generate(3, (index) {
            final services = [
              {'name': 'Haircut & Styling', 'price': 35, 'duration': '45 mins'},
              {'name': 'Hair Coloring', 'price': 75, 'duration': '90 mins'},
              {'name': 'Facial Treatment', 'price': 55, 'duration': '60 mins'},
              {'name': 'Manicure & Pedicure', 'price': 45, 'duration': '75 mins'},
              {'name': 'Hair Treatment', 'price': 65, 'duration': '45 mins'},
            ];

            return CustomContainerWdt(
              margin: const EdgeInsets.only(bottom: 16),
              child: CustomContainerWdt(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.spa,
                          color: Theme.of(context).colorScheme.primary,
                          size: 24,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          services[index]['name'] as String,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            services[index]['duration'] as String,
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Text(
                          '\$${services[index]['price']}',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ],
    ),
  );

      case 'Package':

        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.card_giftcard, 
                    color: Theme.of(context).colorScheme.primary,
                    size: 28,
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Special Packages',
                    style: TextStyle(
                      fontSize: 24, 
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Column(
                children: List.generate(3, (index) {
                  final packages = [
                    {'name': 'Premium Package', 'price': 99},
                    {'name': 'Deluxe Package', 'price': 149}, 
                    {'name': 'Royal Package', 'price': 199},
                     {'name': 'Royal Package', 'price': 199},
                      {'name': 'Royal Package', 'price': 199},
                  ];
                  return CustomContainerWdt(
                    margin: const EdgeInsets.only(bottom: 16),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                packages[index]['name'] as String,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.primary,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  '\$${packages[index]['price']}',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            '• Premium Haircut\n• Professional Styling\n• Deep Treatment\n• Head Massage\n• Free Consultation',
                            style: TextStyle(
                              fontSize: 16,
                              height: 1.5,
                            ),
                          ),
                          const SizedBox(height: 16),
                         CustomButton(txt: "Book Now")
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        );
      case 'Gallery':
        return Container(
          padding: const EdgeInsets.all(16),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemCount: 9,
            itemBuilder: (context, index) {
              return CustomContainerWdt(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: NetworkImage(
                      "https://picsum.photos/200/200?random=$index",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    "https://picsum.photos/200/200?random=$index",
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[200],
                        child: const Icon(
                          Icons.error_outline,
                          color: Colors.red,
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          ),
        );
      case 'Review':
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.amber, size: 28),
                  const SizedBox(width: 12),
                  Text(
                    'Customer Reviews',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return CustomContainerWdt(
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 24,
                              backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
                              child: Icon(
                                Icons.person,
                                color: Theme.of(context).primaryColor,
                                size: 28,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Sarah Johnson',
                                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  Text(
                                    '2 days ago',
                                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                          color: Colors.grey,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: Colors.amber.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(Icons.star, color: Colors.amber, size: 16),
                                  const SizedBox(width: 4),
                                  Text(
                                    '5.0',
                                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                          color: Colors.amber,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Absolutely amazing experience! The staff was professional and friendly. The salon atmosphere was relaxing and the results exceeded my expectations. Will definitely be coming back!',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                height: 1.5,
                              ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        );
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomContainerWdt(
                  height: 300,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        "https://images.unsplash.com/photo-1562322140-8baeececf3df?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1169&q=80",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withAlpha(179),
                          Colors.transparent,
                          Colors.black.withAlpha(76),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  transform: Matrix4.translationValues(0, -30, 0),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Service Title
                        const Text(
                          'Hair Cut & Style',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        // Location
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Icon(Icons.location_on, color: Colors.blue),
                            SizedBox(width: 8),
                            Text(
                              '123 Salon Street, City',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),

                        // Rating
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Icon(Icons.star, color: Colors.amber),
                            SizedBox(width: 4),
                            Text(
                              '4.8',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(' (234 reviews)'),
                          ],
                        ),
                        const SizedBox(height: 10),

                        // Action Icons Row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ActionButtonWidget(
                              label: 'Website',
                              icon: Icons.language,
                            ),
                            ActionButtonWidget(
                              label: 'Message',
                              icon: Icons.message,
                            ),
                            ActionButtonWidget(
                              label: 'Call',
                              icon: Icons.phone,
                            ),
                            ActionButtonWidget(
                              label: 'Direction',
                              icon: Icons.directions,
                            ),
                            ActionButtonWidget(
                              label: 'Share',
                              icon: Icons.share,
                            ),
                          ],
                        ),
                        const SizedBox(height: 32),

                        // Barber Specialists
                        const Text(
                          'Our Barber Specialists',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5,
                          ),
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          height: 130,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: CustomContainerWdt(
                                  width: 90,
                                  height: 130,
                                
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(23),
                                        child: Image.network(
                                          "https://images.unsplash.com/photo-1503951914875-452162b0f3f1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=200&q=80",
                                          height: 70,
                                          width: 80,
                                          fit: BoxFit.cover,
                                          loadingBuilder: (context, child, loadingProgress) {
                                            if (loadingProgress == null) {
                                              return child;
                                            }
                                            return Center(
                                              child: CircularProgressIndicator(
                                                value:
                                                    loadingProgress
                                                            .expectedTotalBytes !=
                                                        null
                                                    ? loadingProgress
                                                              .cumulativeBytesLoaded /
                                                          loadingProgress
                                                              .expectedTotalBytes!
                                                    : null,
                                              ),
                                            );
                                          },
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                                return Container(
                                                  height: 70,
                                                  width: 80,
                                                  color: Colors.grey[200],
                                                  child: const Icon(
                                                    Icons.error_outline,
                                                    color: Colors.red,
                                                  ),
                                                );
                                              },
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        'Barber ${index + 1}',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 32),

                        // Filter Chips
                        SizedBox(
                          height: 50,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                CustomFilterChip(
                                  width: 80,
                                  label: 'About Us',
                                  isSelected: selectedFilter == 'About Us',
                                  onSelected: (bool) {
                                    setState(() {
                                      selectedFilter = 'About Us';
                                    });
                                  },
                                ),
                                const SizedBox(width: 12),
                                CustomFilterChip(
                                  width: 80,
                                  label: 'Services',
                                  isSelected: selectedFilter == 'Services',
                                  onSelected: (bool) {
                                    setState(() {
                                      selectedFilter = 'Services';
                                    });
                                  },
                                ),
                                const SizedBox(width: 12),
                                CustomFilterChip(
                                  width: 80,
                                  label: 'Package',
                                  isSelected: selectedFilter == 'Package',
                                  onSelected: (bool) {
                                    setState(() {
                                      selectedFilter = 'Package';
                                    });
                                  },
                                ),
                                const SizedBox(width: 12),
                                CustomFilterChip(
                                  width: 80,
                                  label: 'Gallery',
                                  isSelected: selectedFilter == 'Gallery',
                                  onSelected: (bool) {
                                    setState(() {
                                      selectedFilter = 'Gallery';
                                    });
                                  },
                                ),
                                const SizedBox(width: 12),
                                CustomFilterChip(
                                  width: 80,
                                  label: 'Review',
                                  isSelected: selectedFilter == 'Review',
                                  onSelected: (bool) {
                                    setState(() {
                                      selectedFilter = 'Review';
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),

                        // Filter Content
                        _buildFilterContent(),

                        const SizedBox(height: 100),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Book Now Button
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: theme.cardColor,
              
              ),
              child: CustomButton(txt: "Book Now"),
            ),
          ),
        ],
      ),
    );
  }
}
