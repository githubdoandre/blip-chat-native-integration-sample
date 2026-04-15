package com.blipchat.blip_chat_native_integration

import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine

class MainActivity : FlutterFragmentActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        flutterEngine.platformViewsController.registry
            .registerViewFactory(
                "com.blipchat.embedded_view",
                BlipChatViewFactory(this),
            )
    }
}
