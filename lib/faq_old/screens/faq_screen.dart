import 'package:flutter/material.dart';

class FAQScreen extends StatelessWidget {
  const FAQScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Frequently Asked Questions!'),
      ),
      body: ListView.builder(
        itemCount: faqData.length,
        itemBuilder: (context, index) {
          return ExpansionTile(
            title: Text(faqData[index]['question']!),
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  faqData[index]['answer']!,
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

List<Map<String, String>> faqData = [
  {
    'question': 'What is Flutter?',
    'answer':
        'Flutter is an open-source UI software development kit created by Google. It is used to develop applications for Android, iOS, Linux, Mac, Windows, Google Fuchsia, and the web from a single codebase.',
  },
  {
    'question': 'How do I install Flutter?',
    'answer':
        'You can install Flutter by following the instructions on the official Flutter website (https://flutter.dev/docs/get-started/install).',
  },
  {
    'question': 'What are the benefits of using Flutter?',
    'answer':
        'Flutter offers benefits such as hot reload, a single codebase for multiple platforms, high performance, customizable widgets, and a rich set of development tools.',
  },
];