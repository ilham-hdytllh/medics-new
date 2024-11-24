package id.tbr.reminder

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import io.flutter.embedding.engine.FlutterEngineCache
import io.flutter.plugin.common.MethodChannel
import io.flutter.view.FlutterMain

class RebootBroadcastReceiver : BroadcastReceiver() {
    override fun onReceive(context: Context?, intent: Intent) {
        if (context != null && Intent.ACTION_BOOT_COMPLETED == intent.action) {
            FlutterMain.startInitialization(context)
            val flutterEngine = FlutterEngineCache.getInstance().get("flutter_engine")
            if (flutterEngine != null) {
                MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "alarm_channel")
                    .invokeMethod("rescheduleAlarms", null)
            }
        }
    }
}
