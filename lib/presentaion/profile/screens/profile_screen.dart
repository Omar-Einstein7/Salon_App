import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salon_app/common/helper/app_navigation.dart';
import 'package:salon_app/core/config/widgets/custom_appbar_wdt.dart';

import 'package:salon_app/domain/auth/usecases/logout_usecase.dart';
import 'package:salon_app/domain/theme_entity.dart';
import 'package:salon_app/presentaion/auth/screens/login_screen.dart';

import 'package:salon_app/presentaion/profile/screens/edit_profile_screen.dart';
import 'package:salon_app/presentaion/profile/screens/invite_friends_screen.dart';
import 'package:salon_app/presentaion/profile/screens/language_screen.dart';
import 'package:salon_app/presentaion/profile/screens/notification_screen.dart';
import 'package:salon_app/presentaion/profile/screens/privacy_policy_screen.dart';
import 'package:salon_app/presentaion/profile/screens/secuirty_screen.dart';

import 'package:salon_app/presentaion/profile/widgets/profile_option.dart';
import 'package:salon_app/presentaion/theme/cubit/theme_cubit.dart';
import 'package:salon_app/service_locator.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: IOSAppBar(
        context: context,
        title: const Text("Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage('https://images.unsplash.com/photo-1522075469751-3a6694fb2f61?w=150'),
                ),
                GestureDetector(
                  onTap: () {
                    AppNavigator.push(context, EditProfileScreen());
                  },
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.edit,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
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
              onTap: () {
                AppNavigator.push(context, EditProfileScreen());
              },
            ),
            ProfileOptionTile(
              icon: Icons.notifications_none_outlined,
              title: 'Notifications',
              onTap: () {
                AppNavigator.push(context, NotificationProfileScreen());
              },
            ),
            ProfileOptionTile(
              icon: Icons.credit_card_outlined,
              title: 'Payment',
              onTap: () {},
            ),
            ProfileOptionTile(
              icon: Icons.lock_outline,
              title: 'Security',
              onTap: () {
                AppNavigator.push(context, SecurityScreen());
              },
            ),
            ProfileOptionTile(
              icon: Icons.translate_outlined,
              title: 'Language',
              onTap: () {
                 AppNavigator.push(context, LanguageScreen());
              },
            ),
            ProfileOptionTile(
              icon: Icons.nightlight_round_outlined,
              title: 'Dark Mode',
              trailing: BlocBuilder<ThemeCubit, AppThemeMode>(
                builder: (context, state) {
                  final isDark = state == AppThemeMode.dark;
                  return Switch(
                    value: isDark,
                    onChanged: (value) {
                      context.read<ThemeCubit>().changeTheme(
                        value ? AppThemeMode.dark : AppThemeMode.light,
                      );
                    },
                  );
                },
              ),
            ),
            ProfileOptionTile(
              icon: Icons.policy_outlined,
              title: 'Privacy Policy',
              onTap: () {
                AppNavigator.push(context, PrivacyPolicyScreen());
              },
            ),
            ProfileOptionTile(
              icon: Icons.group_add_outlined,
              title: 'Invite Friends',
              onTap: () {
                   AppNavigator.push(context, InviteFriendsScreen());
              },
            ),
            ProfileOptionTile(
              icon: Icons.logout,
              title: 'Logout',
              color: Colors.red,
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(24),
                    ),
                  ),
                  builder: (_) => Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 20,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: 4,
                          width: 40,
                          margin: const EdgeInsets.only(bottom: 16),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        const Icon(
                          Icons.logout,
                          size: 48,
                          color: Colors.redAccent,
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Logout',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Are you sure you want to logout?',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 24),
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () => Navigator.pop(context),
                                style: OutlinedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 14,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: const Text(
                                  'Cancel',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () async {
                                  Navigator.pop(context);
                                  final result = await sl<LogoutUseCase>()
                                      .call();
                                  result.fold(
                                    (error) {
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        SnackBar(content: Text(error)),
                                      );
                                    },
                                    (_) {
                                      Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(
                                          builder: (_) => const LoginScreen(),
                                        ),
                                        (route) => false,
                                      );
                                    },
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.redAccent,
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 14,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: const Text(
                                  'Logout',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
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
