import 'package:flutter/material.dart';
import 'package:salon_app/core/config/widgets/custom_container_wdt.dart';
import 'package:salon_app/presentaion/details/widgets/filter_chip.dart';

class BookMarkScreen extends StatefulWidget {
  const BookMarkScreen({super.key});

  @override
  State<BookMarkScreen> createState() => _BookMarkScreenState();
}

class _BookMarkScreenState extends State<BookMarkScreen> {
  String selectedFilter = 'All';
  final List<String> filterOptions = ['All', 'Hair', 'Nails', 'Makeup', 'Spa'];

  // Sample bookmarked items data
  List<Map<String, String>> bookmarkedItems = [
    {
      'name': 'Hair Cut',
      'category': 'Hair',
      'image':
          'https://images.unsplash.com/photo-1585747860715-2ba37e788b70?q=80',
    },
    {
      'name': 'Manicure',
      'category': 'Nails',
      'image':
          'https://images.unsplash.com/photo-1610992015732-2449b0dd2e3f?q=80',
    },
    {
      'name': 'Face Makeup',
      'category': 'Makeup',
      'image':
          'https://images.unsplash.com/photo-1596704017254-9b121068fb31?q=80',
    },
    {
      'name': 'Massage',
      'category': 'Spa',
      'image': 'https://images.unsplash.com/photo-1544161515-4ab6ce6db874?q=80',
    },
  ];

  void removeBookmark(int index) {
    setState(() {
      bookmarkedItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final filteredItems = selectedFilter == 'All'
        ? bookmarkedItems
        : bookmarkedItems
              .where((item) => item['category'] == selectedFilter)
              .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookmarks'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            height: 60,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filterOptions.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: CustomFilterChip(
                    label: filterOptions[index],
                    isSelected: selectedFilter == filterOptions[index],
                    width: 80,
                    onSelected: (bool selected) {
                      setState(() {
                        selectedFilter = filterOptions[index];
                      });
                    },
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: filteredItems.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.bookmark_border,
                          size: 64,
                          color: Colors.grey[400],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'No bookmarks found',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: filteredItems.length,
                    itemBuilder: (context, index) {
                      final item = filteredItems[index];
                      return CustomBookmarkTile(
                        item: item,
                        onRemove: () {
                          showModalBottomSheet(
                            context: context,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20),
                              ),
                            ),
                            builder: (BuildContext context) {
                              return RemoveBookmarkSheet(
                                item: item,
                                onConfirm: () {
                                  removeBookmark(index);
                                  Navigator.pop(context);
                                },
                              );
                            },
                          );
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

class CustomBookmarkTile extends StatelessWidget {
  final Map<String, dynamic> item;
  final VoidCallback onRemove;

  const CustomBookmarkTile({
    Key? key,
    required this.item,
    required this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomContainerWdt(
      height: 100,
      margin: EdgeInsetsDirectional.only(bottom: 10),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(
                item['image']!,
                width: 100,
                height: 100,
                cacheHeight: 100,
                cacheWidth: 100,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(
                    width: 100,
                    height: double.infinity,

                    child: Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                            : null,
                        color: Colors.orange,
                      ),
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 100,
                    height: double.infinity,
                    color: Colors.grey[200],
                    child: const Icon(
                      Icons.error_outline,
                      color: Colors.red,
                      size: 32,
                    ),
                  );
                },
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['name']!,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.orange.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            item['category']!,
                            style: const TextStyle(
                              color: Colors.orange,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.bookmark,
                      color: Colors.orange,
                      size: 24,
                    ),
                    onPressed: onRemove,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RemoveBookmarkSheet extends StatelessWidget {
  final Map<String, String> item;
  final VoidCallback onConfirm;

  const RemoveBookmarkSheet({
    Key? key,
    required this.item,
    required this.onConfirm,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Remove from Bookmarks',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Divider(thickness: .5, height: 20, indent: 20, endIndent: 20),
          CustomBookmarkTile(
            item: item,
            onRemove:
                () {}, // Empty callback since we don't need removal functionality here
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 140,
                height: 50,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.orange.withOpacity(0.2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 140,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  onPressed: onConfirm,
                  child: const Text(
                    'Remove',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
