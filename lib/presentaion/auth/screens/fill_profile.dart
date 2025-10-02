import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:salon_app/common/helper/app_navigation.dart';
import 'package:salon_app/core/config/widgets/custom_textfield.dart';
import 'package:salon_app/core/config/widgets/custom_dropdown_textfield.dart';
import 'package:salon_app/core/config/widgets/custom_button.dart';
import 'package:salon_app/data/auth/model/signup_req_params.dart';
import 'package:salon_app/domain/auth/usecases/signup.dart';
import 'package:salon_app/presentaion/auth/screens/login_screen.dart';
import 'package:salon_app/service_locator.dart';

class FillProfileScreen extends StatefulWidget {
  final String email;
  final String password;

  const FillProfileScreen({
    super.key,
    required this.email,
    required this.password,
  });

  @override
  State<FillProfileScreen> createState() => _FillProfileScreenState();
}

class _FillProfileScreenState extends State<FillProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _nicknameController = TextEditingController();
  final _phoneController = TextEditingController();
  DateTime? _selectedDate;
  String? _selectedGender;
  String? _selectedCountryCode;

  File? _profileImage;

  final List<Map<String, String>> _countryCodes = [
    {'code': '+1', 'name': 'US'},
    {'code': '+20', 'name': 'EG'},
    {'code': '+44', 'name': 'UK'},
    {'code': '+91', 'name': 'IN'},
    {'code': '+966', 'name': 'SA'},
  ];

  @override
  void initState() {
    super.initState();
    _emailController.text = widget.email;
    _selectedCountryCode = _countryCodes.first['code'];
  }

  Future<void> _pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        _profileImage = File(picked.path);
      });
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _nicknameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fill Your Profile'), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Profile Image Picker
              GestureDetector(
                onTap: _pickImage,
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.grey.shade200,
                  backgroundImage: _profileImage != null
                      ? FileImage(_profileImage!)
                      : null,
                  child: _profileImage == null
                      ? const Icon(
                          Icons.camera_alt,
                          size: 40,
                          color: Colors.grey,
                        )
                      : null,
                ),
              ),
              const SizedBox(height: 32),

              // Full Name
              CustomTextfield(
                controller: _fullNameController,
                labelText: 'Full Name',
                prefixIcon: Icons.person,
                keyboardType: TextInputType.text,
                validator: (value) =>
                    value == null || value.isEmpty ? 'Enter full name' : null,
              ),
              const SizedBox(height: 16),

              // Date of Birth
              GestureDetector(
                onTap: () => _selectDate(context),
                child: AbsorbPointer(
                  child: CustomTextfield(
                    keyboardType: TextInputType.text,
                    controller: TextEditingController(
                      text: _selectedDate == null
                          ? ''
                          : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
                    ),
                    labelText: 'Date of Birth',
                    prefixIcon: Icons.calendar_today,
                    validator: (_) =>
                        _selectedDate == null ? 'Select date of birth' : null,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Email
              CustomTextfield(
                keyboardType: TextInputType.text,
                controller: _emailController,
                labelText: 'Email',
                prefixIcon: Icons.email,
                validator: (value) =>
                    value == null || value.isEmpty ? 'Enter email' : null,
              ),
              const SizedBox(height: 16),

              // Gender
              CustomDropdownTextfield(
                value: _selectedGender,
                items: ['Male', 'Female', 'Other']
                    .map((g) => DropdownMenuItem(value: g, child: Text(g)))
                    .toList(),
                onChanged: (val) => setState(() => _selectedGender = val),
                labelText: 'Gender',
                prefixIcon: Icons.wc,
                validator: (_) =>
                    _selectedGender == null ? 'Select gender' : null,
              ),
              const SizedBox(height: 16),

              // Phone Number with Country Code
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Country Code Dropdown
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: const BoxDecoration(
                        border: Border(
                          right: BorderSide(
                            color: const Color(0xFFF5F5F5),
                            width: 0.5,
                          ),
                        ),
                      ),
                      child: DropdownButton<String>(
                        value: _selectedCountryCode,
                        items: _countryCodes
                            .map(
                              (e) => DropdownMenuItem(
                                value: e['code'],
                                child: Text(
                                  e['code']!,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: (val) =>
                            setState(() => _selectedCountryCode = val),
                        underline: const SizedBox(),
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black54,
                        ),
                        dropdownColor: const Color(0xFFF5F5F5),
                        borderRadius: BorderRadius.circular(12),
                        elevation: 4,
                      ),
                    ),
                    const SizedBox(width: 8),
                    // Phone Number Field
                    Expanded(
                      child: CustomTextfield(
                        controller: _phoneController,
                        labelText: 'Phone Number',
                        keyboardType: TextInputType.phone,
                        validator: (value) => value == null || value.isEmpty
                            ? 'Enter phone number'
                            : null,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Nickname
              CustomTextfield(
                controller: _nicknameController,
                labelText: 'Nickname',
                prefixIcon: Icons.badge,
                validator: (value) =>
                    value == null || value.isEmpty ? 'Enter nickname' : null,
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 32),

              // Save Button
              SizedBox(
                width: double.infinity,
                child: CustomButton(
                  txt: 'Continue',
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      try {
                        final result = await sl<SignupUseCase>().call(
                          params: SignupReqParams(
                            name: _fullNameController.text,
                            email: widget.email,
                            password: widget.password,
                            confirmPassword: widget.password,
                            role: 'user',
                            phoneNumber:
                                '$_selectedCountryCode${_phoneController.text}',
                            profileImage: _profileImage?.path,
                          ),
                        );
                        print('Signup successful: $result');
                        AppNavigator.pushReplacement(context, LoginScreen());
                      } catch (e) {
                        print('Signup failed: $e');
                      }
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
