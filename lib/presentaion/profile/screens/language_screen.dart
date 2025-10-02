import 'package:flutter/material.dart';
import 'package:salon_app/presentaion/profile/widgets/profile_option.dart';


class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  String _selectedLanguage = 'English'; // default selection

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Language'),
      ),
      body: Column(
        children: [
          ProfileOptionTile(
            title: 'العربية',
            trailing: Radio<String>(
              value: 'Arabic',
              groupValue: _selectedLanguage,
              onChanged: (value) {
                setState(() {
                  _selectedLanguage = value!;
                });
              },
            ),
           
          ),
          ProfileOptionTile(
            title: 'English',
            trailing: Radio<String>(
              value: 'English',
              groupValue: _selectedLanguage,
              onChanged: (value) {
                setState(() {
                  _selectedLanguage = value!;
                });
              },
            ),
           
          ),
        ],
      ),
    );
  }
}
