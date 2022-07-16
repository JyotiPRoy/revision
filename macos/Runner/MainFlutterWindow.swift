import Cocoa
import FlutterMacOS

class MainFlutterWindow: NSWindow {
  override func awakeFromNib() {
    let flutterViewController = FlutterViewController.init()
    let windowFrame = self.frame
    self.contentViewController = flutterViewController
    self.setFrame(windowFrame, display: true)
    
//    let customToolbar = NSToolbar()
//    customToolbar.showsBaselineSeparator = false
    self.titlebarSeparatorStyle = .none
    self.titlebarAppearsTransparent = true
    self.backgroundColor = NSColor.init(red: 28/255, green: 21/255, blue: 37/255, alpha: 1)
//    self.toolbar = customToolbar
    
    RegisterGeneratedPlugins(registry: flutterViewController)

    super.awakeFromNib()
  }
}
