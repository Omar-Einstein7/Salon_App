import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:salon_app/presentaion/booking/screens/booking_screen.dart';
import 'package:salon_app/presentaion/home/screens/home_screen.dart';
import 'package:salon_app/presentaion/home/screens/explore_screen.dart';
import 'package:salon_app/presentaion/inbox/screens/inbox_screen.dart';
import 'package:salon_app/presentaion/profile/screens/profile_screen.dart';


class BodyScreen extends StatefulWidget {
  const BodyScreen({super.key});

  @override
  State<BodyScreen> createState() => _BodyScreenState();
}

class _BodyScreenState extends State<BodyScreen> {
  int _selectedIndex = 0;

  // List of screens to show in bottom nav bar
  final List<Widget> _screens = [
    const HomeScreen(),
    const ExploreScreen(),
    const BookingScreen(), 
    
    const InboxScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        elevation: 8,
        items: [
          BottomNavigationBarItem(
            icon: Icon(_selectedIndex == 0 ? Iconsax.home_15 : Iconsax.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(_selectedIndex == 1 ? Iconsax.location5 : Iconsax.location),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(_selectedIndex == 2 ? Iconsax.note_1  : Iconsax.note_1),
            label: 'My Booking',
          ),
          BottomNavigationBarItem(
            icon: Icon(_selectedIndex == 3 ? Iconsax.message5 : Iconsax.message),
            label: 'Inbox',
          ),
          BottomNavigationBarItem(
            icon: Icon(_selectedIndex == 4 ? Iconsax.profile_circle5 : Iconsax.profile_circle),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}









