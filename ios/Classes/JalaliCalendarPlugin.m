#import "JalaliCalendarPlugin.h"
#import <jalalidatepicker/jalali_calendar-Swift.h>

@implementation JalaliCalendarPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftJalaliCalendarPlugin registerWithRegistrar:registrar];
}
@end
