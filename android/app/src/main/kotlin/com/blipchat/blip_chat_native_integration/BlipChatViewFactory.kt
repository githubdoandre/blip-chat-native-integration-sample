package com.blipchat.blip_chat_native_integration

import android.content.Context
import androidx.fragment.app.FragmentActivity
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory

class BlipChatViewFactory(private val activity: FragmentActivity) :
    PlatformViewFactory(StandardMessageCodec.INSTANCE) {

    override fun create(context: Context, viewId: Int, args: Any?): PlatformView {
        @Suppress("UNCHECKED_CAST")
        val params = args as? Map<String, Any?>

        val appKey = params?.get("appKey") as? String
            ?: error("appKey is required to open BlipChat embedded thread")

        return BlipChatPlatformView(
            context = context,
            activity = activity,
            viewId = viewId,
            appKey = appKey,
        )
    }
}
