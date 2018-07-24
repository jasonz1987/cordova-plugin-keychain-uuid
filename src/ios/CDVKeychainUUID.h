#import <Foundation/Foundation.h>
#import <Cordova/CDVPlugin.h>
#import <Cordova/CDVPluginResult.h>

@interface CDVKeychainUUID : CDVPlugin

- (void)getDeviceID:(CDVInvokedUrlCommand*)command;
- (void)deleteDeviceID:(CDVInvokedUrlCommand*)command;

@end
