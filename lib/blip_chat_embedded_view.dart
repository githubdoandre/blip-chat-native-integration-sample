import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BlipChatEmbeddedView extends StatelessWidget {
  const BlipChatEmbeddedView({super.key, required this.appKey});

  final String appKey;

  static const _viewType = 'com.blipchat.embedded_view';

  @override
  Widget build(BuildContext context) {
    final creationParams = <String, String>{'appKey': appKey};

    if (defaultTargetPlatform == TargetPlatform.android) {
      return SizedBox.expand(
        child: AndroidView(
          viewType: _viewType,
          layoutDirection: TextDirection.ltr,
          gestureRecognizers: const <Factory<OneSequenceGestureRecognizer>>{},
          creationParams: creationParams,
          creationParamsCodec: const StandardMessageCodec(),
        ),
      );
    }

    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return SizedBox.expand(
        child: UiKitView(
          viewType: _viewType,
          layoutDirection: TextDirection.ltr,
          gestureRecognizers: const <Factory<OneSequenceGestureRecognizer>>{},
          creationParams: creationParams,
          creationParamsCodec: const StandardMessageCodec(),
        ),
      );
    }

    return const SizedBox.shrink();
  }
}
