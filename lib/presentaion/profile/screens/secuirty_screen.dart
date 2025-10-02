import 'package:flutter/material.dart';
import 'package:salon_app/core/config/widgets/custom_button.dart';

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
      appBar: AppBar(
        title: const Text('Security'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            // Security toggles
            _buildSecurityCard(
              children: [
                _buildSwitchTile(
                  title: 'Face ID',
                  value: _faceId,
                  onChanged: (v) => setState(() => _faceId = v),
                ),
                _divider(),
                _buildSwitchTile(
                  title: 'Remember Me',
                  value: _rememberMe,
                  onChanged: (v) => setState(() => _rememberMe = v),
                ),
                _divider(),
                _buildSwitchTile(
                  title: 'Touch ID',
                  value: _touchId,
                  onChanged: (v) => setState(() => _touchId = v),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Change password
            _buildSecurityCard(
              children: [
                ListTile(
                  title: const Text('Change Password'),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    // TODO: navigate to change-password screen
                  },
                ),
              ],
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
      ),
    );
  }

  Widget _divider() => const Divider(height: 1, indent: 16, endIndent: 16);
}
