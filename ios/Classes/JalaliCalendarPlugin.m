#import "JalaliCalendarPlugin.h"
#import <jalalidatepicker/jalalidatepicker-Swift.h>

@implementation JalaliCalendarPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftJalaliCalendarPlugin registerWithRegistrar:registrar];
}
@end
