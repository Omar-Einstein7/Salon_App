import 'package:flutter/material.dart';
import 'package:salon_app/core/config/widgets/custom_button.dart';
import 'package:salon_app/core/config/widgets/custom_textfield.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  State<CreateNewPasswordScreen> createState() => _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _obscureNew = true;
  bool _obscureConfirm = true;

  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      // TODO: integrate with backend to reset password
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          'Create New Password',
          style: TextStyle(
            color: Color(0xFF2D3748),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Color(0xFF718096)),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 16),
                  // Professional image from network
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      'https://images.unsplash.com/photo-1583337130417-3346a1be7dee?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=80',
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Your new password must be different from previous used passwords.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF718096),
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  CustomTextfield(
                    controller: _newPasswordController,
                    labelText: 'New Password',
                    obscureText: _obscureNew,
                    suffixIcon: _obscureNew ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                    onSuffixIconPressed: () => setState(() => _obscureNew = !_obscureNew),
                    validator: (v) => v == null || v.length < 8
                        ? 'Password must be at least 8 characters'
                        : null, keyboardType:TextInputType.text ,
                  ),
                  const SizedBox(height: 16),
                  CustomTextfield(
                    controller: _confirmPasswordController,
                    labelText: 'Confirm New Password',
                    obscureText: _obscureConfirm,
                    suffixIcon: _obscureConfirm ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                    onSuffixIconPressed: () =>
                        setState(() => _obscureConfirm = !_obscureConfirm),
                    validator: (v) =>
                        v != _newPasswordController.text
                            ? 'Passwords do not match'
                            : null, keyboardType: TextInputType.text ,
                  ),
                  const SizedBox(height: 40),
                  CustomButton(
                    txt: 'Continue',
                    onPressed: _submit,
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
