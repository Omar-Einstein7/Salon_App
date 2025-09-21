import 'package:flutter/material.dart';
import 'package:salon_app/presentaion/bookmark/screens/book_mark_screen.dart';

class HaircutsScreen extends StatefulWidget {
  const HaircutsScreen({super.key});

  @override
  State<HaircutsScreen> createState() => _HaircutsScreenState();
}

class _HaircutsScreenState extends State<HaircutsScreen> {
  // Example haircut data
  final List<Map<String, dynamic>> _allHaircuts = [
    {
      "id": 1,
      "name": "Classic Cut",
      "category": "Traditional",
      "image":
          "https://images.unsplash.com/photo-1585747860715-2ba37e788b70?q=80&w=1000&auto=format&fit=crop",
    },
    {
      "id": 2,
      "name": "Fade",
      "category": "Modern",
      "image":
          "https://images.unsplash.com/photo-1605497788044-5a32c7078486?q=80&w=1000&auto=format&fit=crop",
    },
    {
      "id": 3,
      "name": "Buzz Cut",
      "category": "Military",
      "image":
          "https://images.unsplash.com/photo-1621605815971-fbc98d665033?q=80&w=1000&auto=format&fit=crop",
    },
    {
      "id": 4,
      "name": "Scissor Cut",
      "category": "Precision",
      "image":
          "https://images.unsplash.com/photo-1622287162716-f311baa1a2b8?q=80&w=1000&auto=format&fit=crop",
    },
    {
      "id": 5,
      "name": "Beard Trim",
      "category": "Grooming",
      "image":
          "https://images.unsplash.com/photo-1621607512214-68297480165c?q=80&w=1000&auto=format&fit=crop",
    },
  ];
  List<Map<String, dynamic>> _foundHaircuts = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    _foundHaircuts = _allHaircuts;
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      results = _allHaircuts;
    } else {
      results = _allHaircuts.where((haircut) {
        final name = haircut["name"].toString().toLowerCase();
        final category = haircut["category"].toString().toLowerCase();
        final searchLower = enteredKeyword.toLowerCase();

        return name.contains(searchLower) || category.contains(searchLower);
      }).toList();
    }

    setState(() {
      _foundHaircuts = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Haircuts')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              onChanged: _runFilter,
              decoration: InputDecoration(
                hintText: 'Search for services...',
                hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14),
                prefixIcon: Icon(
                  Icons.search_rounded,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.tune_rounded,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  onPressed: () {
                    _searchController.clear();
                    _runFilter('');
                  },
                ),
                filled: true,

                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey[200]!, width: 1.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                    width: 1.5,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: _foundHaircuts.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.search_off,
                            size: 64,
                            color: Colors.grey[400],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'No haircuts found',
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      itemCount: _foundHaircuts.length,
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: CustomBookmarkTile(
                            item: _foundHaircuts[index],
                            onRemove: () {
                              // Handle remove action if needed
                            },
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
