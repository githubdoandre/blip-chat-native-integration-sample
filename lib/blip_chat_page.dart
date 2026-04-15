import 'package:flutter/material.dart';

import 'blip_chat_embedded_view.dart';

class BlipChatPage extends StatelessWidget {
  const BlipChatPage({super.key, required this.appKey});

  final String appKey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BlipChatEmbeddedView(appKey: appKey),
          Positioned(
            top: MediaQuery.of(context).padding.top,
            right: 0,
            child: BackButton(onPressed: () => Navigator.of(context).pop()),
          ),
        ],
      ),
    );
  }
}
