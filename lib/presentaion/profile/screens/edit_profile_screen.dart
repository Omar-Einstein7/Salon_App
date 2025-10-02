import 'package:flutter/material.dart';
import 'package:salon_app/core/config/widgets/custom_button.dart';
import 'package:salon_app/core/config/widgets/custom_textfield.dart';


class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _dateController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _genderController = TextEditingController();
  final _addressController = TextEditingController();

  String? _selectedCountry;
  String? _selectedGender;

  // Map of country to dialing code
  final Map<String, String> _countryCodes = {
    'United States': '+1',
    'Canada': '+1',
    'United Kingdom': '+44',
    'Australia': '+61',
    'Germany': '+49',
    'France': '+33',
    'Egypt': '+20',
    'Saudi Arabia': '+966',
    'United Arab Emirates': '+971',
    'Other': '',
  };

  final List<String> _genders = ['Male', 'Female', 'Other'];

  @override
  void dispose() {
    _fullNameController.dispose();
    _dateController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _genderController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _dateController.text = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  void _saveProfile() {
    if (_formKey.currentState!.validate()) {
      // TODO: Implement save profile logic
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        elevation: 0,
     
        title: const Text(
          'Edit Profile',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 24,
  
          ),
        ),
     
    
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            children: [
              
            
              const SizedBox(height: 40),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextfield(
                      controller: _fullNameController,
                      labelText: 'Full Name',
                      prefixIcon: Icons.person_outline,
                      validator: (value) =>
                          value?.isEmpty ?? true ? 'Please enter your full name' : null,
                      keyboardType: TextInputType.text,
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () => _selectDate(context),
                      child: AbsorbPointer(
                        child: CustomTextfield(
                          controller: _dateController,
                          labelText: 'Date of Birth',
                          prefixIcon: Icons.calendar_today_outlined,
                          validator: (value) =>
                              value?.isEmpty ?? true ? 'Please select your date of birth' : null,
                          keyboardType: TextInputType.datetime,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    CustomTextfield(
                      controller: _emailController,
                      labelText: 'Email Address',
                      prefixIcon: Icons.email_outlined,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Please enter your email';
                        }
                        if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                            .hasMatch(value!)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    // Combined country code and phone field
                    TextFormField(
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: 'Phone Number',
                        prefixIcon: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: _selectedCountry ?? 'United States',
                            icon: const Icon(Icons.arrow_drop_down, size: 20),
                            onChanged: (String? newValue) {
                              setState(() {
                                _selectedCountry = newValue;
                              });
                            },
                            items: _countryCodes.keys.map<DropdownMenuItem<String>>((String country) {
                              return DropdownMenuItem<String>(
                                value: country,
                                child: Row(
                                  children: [
                                    const Icon(Icons.flag_outlined, size: 22),
                                    const SizedBox(width: 8),
                                    Text(
                                      _countryCodes[country]!,
                                      style: const TextStyle(fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.9),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                      ),
                      validator: (value) =>
                          value?.isEmpty ?? true ? 'Please enter your phone number' : null,
                    ),
                    const SizedBox(height: 20),
                    DropdownButtonFormField<String>(
                      value: _selectedGender,
                      decoration: InputDecoration(
                        labelText: 'Gender',
                        prefixIcon: const Icon(Icons.wc_outlined),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.9),
                      ),
                      items: _genders.map((gender) {
                        return DropdownMenuItem(
                          value: gender,
                          child: Text(gender),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedGender = value;
                          _genderController.text = value ?? '';
                        });
                      },
                      validator: (value) =>
                          value == null ? 'Please select your gender' : null,
                    ),
                    const SizedBox(height: 20),
                    CustomTextfield(
                      controller: _addressController,
                      labelText: 'Address',
                      prefixIcon: Icons.home_outlined,
                      keyboardType: TextInputType.streetAddress,
                      validator: (value) =>
                          value?.isEmpty ?? true ? 'Please enter your address' : null,
                    ),
                    const SizedBox(height: 40),
                    CustomButton(
                      txt: 'Save Changes',
                      onPressed: _saveProfile,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
