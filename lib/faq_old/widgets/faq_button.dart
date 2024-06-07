import 'package:flutter/material.dart';
import 'package:salescode_project/faq_old/screens/faq_screen.dart';

class FAQButton extends StatelessWidget {
  const FAQButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        print('Button clicked!');
        Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FAQScreen()),
            );
      },
      child: const Text('Click here to go the FAQ section!'),
    );
  }
}