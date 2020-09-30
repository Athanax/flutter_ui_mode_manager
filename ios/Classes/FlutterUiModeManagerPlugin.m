#import "FlutterUiModeManagerPlugin.h"
#if __has_include(<flutter_ui_mode_manager/flutter_ui_mode_manager-Swift.h>)
#import <flutter_ui_mode_manager/flutter_ui_mode_manager-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_ui_mode_manager-Swift.h"
#endif

@implementation FlutterUiModeManagerPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterUiModeManagerPlugin registerWithRegistrar:registrar];
}
@end
