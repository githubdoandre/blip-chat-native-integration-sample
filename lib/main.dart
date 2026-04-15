import 'package:flutter/material.dart';

import 'blip_chat_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BlipChat Native Integration',
      theme: ThemeData(colorSchemeSeed: Colors.blue),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // Replace with your actual BlipChat app key
  static const _appKey =
      'Y2xvdWRhcGlwcm9kOjVjNDJjNDYyLTVlYTYtNDEzZS1iNjJlLTY1ZDdiM2MyOTRlZQ==';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BlipChat Native Integration')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => const BlipChatPage(appKey: _appKey),
            ),
          ),
          child: const Text('Open BlipChat'),
        ),
      ),
    );
  }
}
