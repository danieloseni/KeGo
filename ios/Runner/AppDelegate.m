#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
 
  // Override point for customization after application launch.
  [GMSServices provideAPIKey:@"AIzaSyAbeiWgyme6XcOHd0TjSbL41pURbRkgfTk"];
  [GeneratedPluginRegistrant registerWithRegistry:self];
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

@end
