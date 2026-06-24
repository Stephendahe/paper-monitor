import AppKit
import SolidBatteryMonitorCore

let app = NSApplication.shared
let delegate = AppDelegate(launchOptions: AppLaunchOptions())
app.delegate = delegate
app.setActivationPolicy(.regular)
app.run()
