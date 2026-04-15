package com.blipchat.blip_chat_native_integration

import android.content.Context
import android.view.View
import android.widget.FrameLayout
import androidx.fragment.app.FragmentActivity
import io.flutter.plugin.platform.PlatformView
import net.take.blipchat.BlipClient
import net.take.blipchat.AuthType
import net.take.blipchat.models.AuthConfig
import net.take.blipchat.models.BlipOptions

class BlipChatPlatformView(
    context: Context,
    private val activity: FragmentActivity,
    private val viewId: Int,
    private val appKey: String,
) : PlatformView {

    private val container: FrameLayout = FrameLayout(context).apply {
        id = View.generateViewId()
    }

    init {
        val blipOptions = BlipOptions()
        blipOptions.setAuthConfig(AuthConfig(AuthType.Guest))

        android.util.Log.d("BlipChat", "AppKey: $appKey")
        android.util.Log.d("BlipChat", "PackageName: ${activity.packageName}")

        val chatFragment = BlipClient.openEmbeddedThread(appKey, blipOptions)
        activity.supportFragmentManager.beginTransaction()
            .replace(container.id, chatFragment)
            .commitAllowingStateLoss()
    }

    override fun getView(): View = container

    override fun dispose() {
        activity.supportFragmentManager.findFragmentById(container.id)?.let { fragment ->
            activity.supportFragmentManager.beginTransaction()
                .remove(fragment)
                .commitAllowingStateLoss()
        }
    }
}
