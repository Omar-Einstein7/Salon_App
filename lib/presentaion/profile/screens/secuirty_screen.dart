import 'package:flutter/material.dart';
import 'package:salon_app/core/config/widgets/custom_appbar_wdt.dart';
import 'package:salon_app/core/config/widgets/custom_button.dart';
import 'package:salon_app/presentaion/profile/widgets/profile_option.dart';

class SecurityScreen extends StatefulWidget {
  const SecurityScreen({super.key});
  @override
  State<SecurityScreen> createState() => _SecurityScreenState();
}
class _SecurityScreenState extends State<SecurityScreen> {
  bool _faceId = true;
  bool _rememberMe = false;
  bool _touchId = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: IOSAppBar(
        title: const Text('Security'),
        context: context,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
         
            // Security toggles
   
              children: [
                ProfileOptionTile(
                  title: 'Face ID',
                  trailing: Switch.adaptive(
                    value: _faceId,
                    onChanged: (v) => setState(() => _faceId = v),
                    applyCupertinoTheme: true,
                  ),
                ),
                ProfileOptionTile(
                  title: 'Remember Me',
                  trailing: Switch.adaptive(
                    value: _rememberMe,
                    onChanged: (v) => setState(() => _rememberMe = v),
                    applyCupertinoTheme: true,
                  ),
                ),
                ProfileOptionTile(
                  title: 'Touch ID',
                  trailing: Switch.adaptive(
                    value: _touchId,
                    onChanged: (v) => setState(() => _touchId = v),
                    applyCupertinoTheme: true,
                  ),
                ),

                const SizedBox(height: 16),

                ProfileOptionTile(
                  title: 'Google Authanticator',
                  onTap: () {
                    // TODO: navigate to change-password screen
                  },
                ),

            const Spacer(),

            // Save button
           CustomButton(txt: "Change Password"),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildSecurityCard({required List<Widget> children}) {
    return Material(
      borderRadius: BorderRadius.circular(12),
      color: Theme.of(context).cardColor,
      elevation: 1,
      child: Column(children: children),
    );
  }

  Widget _buildSwitchTile({
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return ListTile(
      title: Text(title),
      trailing: Switch.adaptive(
    
        value: value,
        onChanged: onChanged,
        applyCupertinoTheme: true,
      ),
    );
  }

  Widget _divider() => const Divider(height: 1, indent: 16, endIndent: 16);
}
