import 'package:flutter/material.dart';
import 'package:salon_app/common/helper/app_navigation.dart';
import 'package:salon_app/core/config/widgets/custom_textfield.dart';
import 'package:salon_app/core/config/widgets/custom_button.dart';
import 'package:salon_app/presentaion/auth/screens/otp_screen.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  bool _useEmail = true;
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text('Forgot Password'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: kToolbarHeight + 24),
            const Icon(Icons.lock_reset, size: 80, color: Colors.blueAccent),
            const SizedBox(height: 24),
            Text(
              'Reset your password',
              style: theme.textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.onSurface,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              'Choose how you’d like to receive your reset link',
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.onSurface.withOpacity(0.7),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            // Choice chips with glass effect
            Row(
              children: [
                Expanded(
                  child: _buildGlassChoiceChip(
                    label: 'Email',
                    selected: _useEmail,
                    onSelected: (_) => setState(() => _useEmail = true),
                    icon: Icons.email_outlined,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildGlassChoiceChip(
                    label: 'Phone',
                    selected: !_useEmail,
                    onSelected: (_) => setState(() => _useEmail = false),
                    icon: Icons.phone_outlined,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            // Animated text field
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: _useEmail
                  ? CustomTextfield(
                      key: const ValueKey('email'),
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      labelText: 'Email Address',
                      prefixIcon: Icons.email,
                    )
                  : CustomTextfield(
                      key: const ValueKey('phone'),
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      labelText: 'Phone Number',
                      prefixIcon: Icons.phone,
                    ),
            ),
            const SizedBox(height: 40),
            // Custom button replacing gradient button
            CustomButton(
              txt: 'Send Reset Link',
              onPressed: () {
                final value = _useEmail
                    ? _emailController.text.trim()
                    : _phoneController.text.trim();
                if (value.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('Please enter a value'),
                      backgroundColor: theme.colorScheme.error,
                    ),
                  );
                  return;
                }
                AppNavigator.push(context, OtpScreen(phoneNumber: '+123456789', onVerify: (String p1) {  },));
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGlassChoiceChip({
    required String label,
    required bool selected,
    required ValueChanged<bool> onSelected,
    required IconData icon,
  }) {
    return GestureDetector(
      onTap: () => onSelected(!selected),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: selected
              ? Theme.of(context).colorScheme.primary.withOpacity(0.15)
              : Colors.white.withOpacity(0.6),
          border: Border.all(
            color: selected
                ? Theme.of(context).colorScheme.primary
                : Colors.transparent,
            width: 2,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: selected
                  ? Theme.of(context).colorScheme.primary
                  : Colors.grey[700],
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                color: selected
                    ? Theme.of(context).colorScheme.primary
                    : Colors.grey[700],
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
