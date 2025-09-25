import 'package:flutter/material.dart';
import 'package:salon_app/common/helper/app_navigation.dart';
import 'package:salon_app/core/config/widgets/custom_appbar_wdt.dart';
import 'package:salon_app/core/usecases/usecase.dart';
import 'package:salon_app/domain/auth/usecases/logout_usecase.dart';
import 'package:salon_app/presentaion/auth/screens/login_screen.dart';
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
      appBar: IOSAppBar(context: context,title: Text("Profile"),),
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
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'johndoe@example.com',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),
            _buildProfileOption(
              icon: Icons.person_outline,
              title: 'Edit Profile',
              onTap: () {},
            ),
            _buildProfileOption(
              icon: Icons.notifications_outlined,
              title: 'Notifications',
              onTap: () {},
            ),
            _buildProfileOption(
              icon: Icons.payment_outlined,
              title: 'Payment',
              onTap: () {},
            ),
            _buildProfileOption(
              icon: Icons.security_outlined,
              title: 'Security',
              onTap: () {},
            ),
            _buildProfileOption(
              icon: Icons.language_outlined,
              title: 'Language',
              onTap: () {},
            ),
            _buildProfileOption(
              icon: Icons.dark_mode_outlined,
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
            _buildProfileOption(
              icon: Icons.privacy_tip_outlined,
              title: 'Privacy Policy',
              onTap: () {},
            ),
            _buildProfileOption(
              icon: Icons.person_add_outlined,
              title: 'Invite Friends',
              onTap: () {},
            ),
            _buildProfileOption(
              icon: Icons.logout_outlined,
              title: 'Logout',
              onTap: () async {
                final result = await sl<LogoutUseCase>().call();
                result.fold(
                  (error) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(error)),
                    );
                  },
                  (_) {
Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const LoginScreen()), (route) => false);
                  },
                );
              },
              textColor: Colors.red,
              trailing: Container(width: 1,)
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileOption({
    required IconData icon,
    required String title,
    VoidCallback? onTap,
    Widget? trailing,
    Color? textColor,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          color: textColor,
        ),
      ),
      trailing: trailing ?? const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}
