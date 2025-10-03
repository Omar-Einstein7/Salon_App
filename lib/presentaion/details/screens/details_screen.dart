import 'package:flutter/material.dart';
import 'package:salon_app/common/helper/app_navigation.dart';
import 'package:salon_app/core/config/widgets/custom_button.dart';
import 'package:salon_app/core/config/widgets/custom_container_wdt.dart';
import 'package:salon_app/presentaion/details/screens/sections/about_us_section.dart';
import 'package:salon_app/presentaion/details/screens/sections/gallary_section.dart';
import 'package:salon_app/presentaion/details/screens/sections/package_section.dart';
import 'package:salon_app/presentaion/details/screens/sections/review_section.dart';
import 'package:salon_app/presentaion/details/screens/sections/services_section.dart';
import 'package:salon_app/presentaion/details/screens/sups/barber_screen.dart';
import 'package:salon_app/presentaion/details/widgets/action_button.dart';
import 'package:salon_app/presentaion/details/widgets/filter_chip.dart';
import 'package:salon_app/presentaion/details/widgets/share_bottom_sheet.dart';
import 'package:salon_app/presentaion/inbox/screens/call_screen.dart';
import 'package:salon_app/presentaion/inbox/screens/chat_screen.dart';
import 'package:salon_app/presentaion/inbox/screens/inbox_screen.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});
  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  String selectedFilter = 'About Us';

  void _showShareBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) => const ShareBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    int? _currentPage;
    final theme = Theme.of(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        scrolledUnderElevation: 0,
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
                Column(
                  children: [
                    SizedBox(
                      height: 300,
                      child: PageView.builder(
                        itemCount: 3,
                        onPageChanged: (index) {
                          setState(() {
                            _currentPage = index;
                          });
                        },
                        itemBuilder: (context, index) {
                          return CustomContainerWdt(
                            height: 300,
                            width: double.infinity,
                            decoration: BoxDecoration(
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
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 16),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: List.generate(3, (dotIndex) {
                                      return Container(
                                        margin: const EdgeInsets.symmetric(
                                          horizontal: 4,
                                        ),
                                        width: 8,
                                        height: 8,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: _currentPage == dotIndex
                                              ? Colors.white
                                              : Colors.white.withOpacity(0.4),
                                        ),
                                      );
                                    }),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(3, (index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentPage == index
                                ? Theme.of(context).colorScheme.primary
                                : Colors.grey,
                          ),
                        );
                      }),
                    ),
                  ],
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
                              onTap: () {
                                AppNavigator.push(
                                  context,
                                  ChatScreen(
                                    chatItem: ChatItem(
                                      chatId: "chat1",
                                      name: 'SKRN',
                                      message: 'When is my next appointment?',
                                      time: '10:30 AM',
                                      date: 'Today',
                                      avatar:
                                          'https://picsum.photos/60/60?random=1',
                                      unreadCount: 3,
                                    ),
                                  ),
                                );
                              },
                            ),
                            ActionButtonWidget(
                              label: 'Call',
                              icon: Icons.phone,
                              onTap: () {
                                AppNavigator.push(
                                  context,
                                  CallScreen(name: 'SKRN', avatar: ''),
                                );
                              },
                            ),
                            ActionButtonWidget(
                              label: 'Direction',
                              icon: Icons.directions,
                            ),
                            ActionButtonWidget(
                              label: 'Share',
                              icon: Icons.share,
                              onTap: _showShareBottomSheet,
                            ),
                          ],
                        ),
                        const SizedBox(height: 32),

                        // Barber Specialists
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Our Barber Specialists',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                AppNavigator.push(context, BarberScreen());
                              },
                              child: const Text(
                                'See all',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
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
                        FilterContentWidget(selectedFilter: selectedFilter),

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
              decoration: BoxDecoration(color: theme.cardColor),
              child: CustomButton(txt: "Book Now"),
            ),
          ),
        ],
      ),
    );
  }
}

class FilterContentWidget extends StatelessWidget {
  final String selectedFilter;

  const FilterContentWidget({super.key, required this.selectedFilter});

  @override
  Widget build(BuildContext context) {
    switch (selectedFilter) {
      case 'About Us':
        return const AboutUsSection();
      case 'Services':
        return const ServicesSection();
      case 'Package':
        return const PackageSection();
      case 'Gallery':
        return const GallerySection();
      case 'Review':
        return const ReviewSection();
      default:
        return const SizedBox.shrink();
    }
  }
}

