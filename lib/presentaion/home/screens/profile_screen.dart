import 'package:flutter/material.dart';
import 'package:salon_app/common/helper/app_navigation.dart';
import 'package:salon_app/core/config/widgets/custom_appbar_wdt.dart';
import 'package:salon_app/core/usecases/usecase.dart';
import 'package:salon_app/domain/auth/usecases/logout_usecase.dart';
import 'package:salon_app/presentaion/auth/screens/login_screen.dart';
import 'package:salon_app/presentaion/profile/widgets/profile_option.dart';
import 'package:salon_app/service_locator.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isDarkMode = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: IOSAppBar(context: context, title: Text("Profile")),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/profile_placeholder.jpg'),
            ),
            const SizedBox(height: 5),
            const Text(
              'John Doe',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              'johndoe@example.com',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            ProfileOptionTile(
              icon: Icons.edit_outlined,
              title: 'Edit Profile',
              onTap: () {},
            ),
            ProfileOptionTile(
              icon: Icons.notifications_none_outlined,
              title: 'Notifications',
              onTap: () {},
            ),
            ProfileOptionTile(
              icon: Icons.credit_card_outlined,
              title: 'Payment',
              onTap: () {},
            ),
            ProfileOptionTile(
              icon: Icons.lock_outline,
              title: 'Security',
              onTap: () {},
            ),
            ProfileOptionTile(
              icon: Icons.translate_outlined,
              title: 'Language',
              onTap: () {},
            ),
            ProfileOptionTile(
              icon: Icons.nightlight_round_outlined,
              title: 'Dark Mode',
              trailing: Switch(
                value: isDarkMode,
                onChanged: (value) {
                  setState(() {
                    isDarkMode = value;
                  });
                },
              ),
            ),
            ProfileOptionTile(
              icon: Icons.policy_outlined,
              title: 'Privacy Policy',
              onTap: () {},
            ),
            ProfileOptionTile(
              icon: Icons.group_add_outlined,
              title: 'Invite Friends',
              onTap: () {},
            ),
            ProfileOptionTile(
              icon: Icons.logout,
              title: 'Logout',
              onTap: () async {
                final result = await sl<LogoutUseCase>().call();
                result.fold(
                  (error) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(error)));
                  },
                  (_) {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                      (route) => false,
                    );
                  },
                );
              },
              textColor: Colors.red,
              trailing: Container(width: 1),
            ),
          ],
        ),
      ),
    );
  }
}
