import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:salon_app/core/config/themes/app_theme.dart';
import 'package:salon_app/presentaion/bookmark/screens/book_mark_screen.dart';
import 'package:salon_app/presentaion/details/widgets/action_button.dart';
import 'package:salon_app/presentaion/home/screens/another_screens/haircuts_screen.dart';
import 'package:salon_app/presentaion/home/widgets/custom_list_tile.dart';
import 'package:salon_app/presentaion/notification/screens/notifications_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  List<String> selectedFilters = [];
  List<String> possibleFilters = ['Haircut', 'Makeup', 'Manicure', 'Massage', 'Pedicure'];
  
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Casca'),
        actions: [
          IconButton(
            icon: const Icon(Iconsax.notification),
            onPressed: () {
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => const NotificationsScreen())
              );
            },
          ),
          IconButton(
            icon: const Icon(Iconsax.favorite_chart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BookMarkScreen())
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Morning, Daniel 👋',
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              const SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  color: theme.colorScheme.surface,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey[200]!, width: 1.5),
                ),
                child: InkWell(
                  onTap: () {
                    showSearch<String?>(
                      context: context, 
                      delegate: CustomSearchDelegate(selectedFilters: selectedFilters)
                    );
                  },
                  borderRadius: BorderRadius.circular(12),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    child: Row(
                      children: [
                        Icon(Icons.search_rounded, color: theme.colorScheme.onSurface),
                        const SizedBox(width: 8),
                        Text(
                          'Search for services...',
                          style: TextStyle(color: Colors.grey[400], fontSize: 14)
                        ),
                        const Spacer(),
                        IconButton(
                          icon: Icon(Icons.tune_rounded, color: theme.colorScheme.onSurface),
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (BuildContext ctx) {
                                return StatefulBuilder(
                                  builder: (BuildContext context, StateSetter setModalState) {
                                    return Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Search Filters',
                                            style: Theme.of(context).textTheme.titleLarge
                                          ),
                                          const SizedBox(height: 16),
                                          Wrap(
                                            spacing: 8,
                                            runSpacing: 8,
                                            children: possibleFilters.map((filter) {
                                              return FilterChip(
                                                label: Text(filter),
                                                selected: selectedFilters.contains(filter),
                                                onSelected: (bool value) {
                                                  setModalState(() {
                                                    setState(() {
                                                      if (value) {
                                                        selectedFilters.add(filter);
                                                      } else {
                                                        selectedFilters.remove(filter);
                                                      }
                                                    });
                                                  });
                                                },
                                              );
                                            }).toList(),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                decoration: BoxDecoration(
                  gradient: AppTheme.mainGradient,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.orange.withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.local_offer_rounded,
                                color: Colors.white,
                                size: 24,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                "Today's Special",
                                style: theme.textTheme.titleLarge?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '50% OFF on all premium services! Limited time offer, book now!',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: Colors.white.withOpacity(0.9),
                              height: 1.2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.arrow_forward_rounded,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ActionButtonWidget(
                    label: 'Haircuts',
                    icon: Icons.cut,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const HaircutsScreen())
                      );
                    },
                  ),
                  ActionButtonWidget(label: 'Make up', icon: Icons.brush),
                  ActionButtonWidget(label: 'Manicure', icon: Icons.h_mobiledata),
                  ActionButtonWidget(label: 'Massage', icon: Icons.spa),
                ],
              ),
              const SizedBox(height: 24),
              Text(
                'Nearby Your Location',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _buildFilterChip('All', true),
                    const SizedBox(width: 8),
                    _buildFilterChip('Haircuts', false),
                    const SizedBox(width: 8),
                    _buildFilterChip('Make up', false),
                    const SizedBox(width: 8),
                    _buildFilterChip('Manicure', false),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return CustomListTile(index: index);
                },
              ),
              const SizedBox(height: 24),
              Text(
                'Most Popular',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _buildFilterChip('All', true),
                    const SizedBox(width: 8),
                    _buildFilterChip('Haircut', false),
                    const SizedBox(width: 8),
                    _buildFilterChip('Manicure', false),
                    const SizedBox(width: 8),
                    _buildFilterChip('Make up', false),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return CustomListTile(index: index);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilterChip(String label, bool isSelected) {
    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (bool value) {
        setState(() {
          // Handle filter selection
        });
      },
      labelStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
        color: isSelected ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.onSurface,
      ),
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
      selectedColor: Theme.of(context).colorScheme.primary,
      checkmarkColor: Theme.of(context).colorScheme.onPrimary,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color: isSelected ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.outline,
        ),
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate<String?> {
  List<String> selectedFilters;
  List<String> selectedCategories = [];
  double selectedRating = 0;
  double selectedDistance = 0;
  
  CustomSearchDelegate({required this.selectedFilters});
  
  final List<String> recentSearches = ['Haircut', 'Manicure'];
  final List<String> allServices = ['Haircut', 'Makeup', 'Manicure', 'Massage', 'Pedicure'];
  final List<String> categories = ['Hair Salon', 'Nail Salon', 'Spa', 'Barbershop', 'Beauty Center'];
  final List<double> ratings = [1,2,3, 4, 5];
  final List<double> distances = [1, 2, 5, 10, 20]; // in km

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.tune_rounded),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            builder: (BuildContext ctx) {
              return StatefulBuilder(
                builder: (BuildContext context, StateSetter setModalState) {
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.55,
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Filters',
                              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          
                          ],
                        ),
                        const Divider(),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Category',
                                  style: Theme.of(context).textTheme.titleMedium,
                                ),
                                const SizedBox(height: 12),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: categories.map((category) {
                                      final isSelected = selectedCategories.contains(category);
                                      return Padding(
                                        padding: const EdgeInsets.only(right: 8),
                                        child: FilterChip(
                                          label: Text(category),
                                          selected: isSelected,
                                          onSelected: (bool value) {
                                            setModalState(() {
                                              if (value) {
                                                selectedCategories.add(category);
                                              } else {
                                                selectedCategories.remove(category);
                                              }
                                            });
                                          },
                                          backgroundColor: Colors.white,
                                          selectedColor: Colors.orange[100],
                                          checkmarkColor: Colors.orange,
                                          labelStyle: TextStyle(
                                            color: isSelected ? Colors.orange : Colors.black87,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(25),
                                            side: BorderSide(
                                              color: isSelected ? Colors.orange : Colors.grey[300]!,
                                            ),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                                const SizedBox(height: 24),
                                Text(
                                  'Rating',
                                  style: Theme.of(context).textTheme.titleMedium,
                                ),
                                const SizedBox(height: 12),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: ratings.map((rating) {
                                      final isSelected = selectedRating == rating;
                                      return Padding(
                                        padding: const EdgeInsets.only(right: 8),
                                        child: FilterChip(
                                          label: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text('$rating'),
                                              const Icon(Icons.star, size: 16),
                                            ],
                                          ),
                                          selected: isSelected,
                                          onSelected: (bool value) {
                                            setModalState(() {
                                              selectedRating = value ? rating : 0;
                                            });
                                          },
                                          backgroundColor: Colors.white,
                                          selectedColor: Colors.orange[100],
                                          checkmarkColor: Colors.orange,
                                          labelStyle: TextStyle(
                                            color: isSelected ? Colors.orange : Colors.black87,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(25),
                                            side: BorderSide(
                                              color: isSelected ? Colors.orange : Colors.grey[300]!,
                                            ),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                                const SizedBox(height: 24),
                                Text(
                                  'Distance',
                                  style: Theme.of(context).textTheme.titleMedium,
                                ),
                                const SizedBox(height: 12),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: distances.map((distance) {
                                      final isSelected = selectedDistance == distance;
                                      return Padding(
                                        padding: const EdgeInsets.only(right: 8),
                                        child: FilterChip(
                                          label: Text('Within ${distance.toInt()} km'),
                                          selected: isSelected,
                                          onSelected: (bool value) {
                                            setModalState(() {
                                              selectedDistance = value ? distance : 0;
                                            });
                                          },
                                          backgroundColor: Colors.white,
                                          selectedColor: Colors.orange[100],
                                          checkmarkColor: Colors.orange,
                                          labelStyle: TextStyle(
                                            color: isSelected ? Colors.orange : Colors.black87,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(25),
                                            side: BorderSide(
                                              color: isSelected ? Colors.orange : Colors.grey[300]!,
                                            ),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Divider(),
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () {
                                  setModalState(() {
                                    selectedCategories.clear();
                                    selectedRating = 0;
                                    selectedDistance = 0;
                                    selectedFilters.clear();
                                  });
                                },
                                child: const Text('Reset'),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: FilledButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  showResults(context);
                                },
                                child: const Text('Apply Filters'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          );
        },
      ),
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.isNotEmpty && !recentSearches.contains(query)) {
      recentSearches.add(query);
    }
    
    final List<String> matchQuery = allServices
        .where((service) => 
            service.toLowerCase().contains(query.toLowerCase()) && 
            (selectedFilters.isEmpty || selectedFilters.contains(service)))
        .toList();
        
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Results for "$query" (${matchQuery.length} found)',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (selectedFilters.isNotEmpty || selectedCategories.isNotEmpty || selectedRating > 0 || selectedDistance > 0) ...[
                const SizedBox(height: 8),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...selectedFilters.map((filter) => Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Chip(
                          label: Text(filter),
                          onDeleted: () {
                            selectedFilters.remove(filter);
                            query = query;
                          },
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                            side: BorderSide(color: Colors.grey[300]!),
                          ),
                        ),
                      )),
                      ...selectedCategories.map((category) => Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Chip(
                          label: Text(category),
                          onDeleted: () {
                            selectedCategories.remove(category);
                            query = query;
                          },
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                            side: BorderSide(color: Colors.grey[300]!),
                          ),
                        ),
                      )),
                      if (selectedRating > 0)
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Chip(
                            label: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('$selectedRating'),
                                const Icon(Icons.star, size: 16),
                              ],
                            ),
                            onDeleted: () {
                              selectedRating = 0;
                              query = query;
                            },
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                              side: BorderSide(color: Colors.grey[300]!),
                            ),
                          ),
                        ),
                      if (selectedDistance > 0)
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Chip(
                            label: Text('Within ${selectedDistance.toInt()} km'),
                            onDeleted: () {
                              selectedDistance = 0;
                              query = query;
                            },
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                              side: BorderSide(color: Colors.grey[300]!),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: matchQuery.length,
            itemBuilder: (context, index) {
              return CustomListTile(index: index % 3);
            },
          ),
        ),
      ],
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<String> suggestions = query.isEmpty 
        ? recentSearches 
        : allServices.where((service) => 
            service.toLowerCase().startsWith(query.toLowerCase())).toList();
            
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];
        return ListTile(
          leading: const Icon(Icons.history),
          title: Text(suggestion),
          trailing: query.isEmpty ? IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              recentSearches.remove(suggestion);
              query = query;
            },
          ) : null,
          onTap: () {
            query = suggestion;
            showResults(context);
          },
        );
      },
    );
  }
}
