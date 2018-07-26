#import <Cordova/CDV.h>
#import "CDVKeychainUUID.h"
#import "KeychainHelper.h"

#define kIsStringValid(text) (text && text!=NULL && text.length>0)

NSString *key = @"com.jason-z.test.uuid";


@implementation CDVKeychainUUID {
    
}

- (void)deleteDeviceID:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSDictionary *args = [command.arguments objectAtIndex:0];
    
    if( args.count > 0) {
        if([args objectForKey:@"key"]) {
            key = [args objectForKey:@"key"];
        }
    }
    
    [KeychainHelper delete:key];
    
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@""];
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];    
}

- (void)getDeviceID:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;

    NSDictionary *args = [command.arguments objectAtIndex:0];

    if( args.count > 0) {
       if([args objectForKey:@"key"]) {
            key = [args objectForKey:@"key"];
       }
    }

    //  read cache
    NSString *deviceID = [CDVKeychainUUID getUUIDString];
    if (kIsStringValid(deviceID))
    {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:deviceID];
    } else {

            deviceID = [[CDVKeychainUUID randomUUID] lowercaseString];
            [CDVKeychainUUID setUUIDString:deviceID];
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:deviceID];

    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

+ (NSString *)randomUUID
{
    if(NSClassFromString(@"NSUUID")) { // only available in iOS >= 6.0
        return [[NSUUID UUID] UUIDString];
    }

    CFUUIDRef uuidRef = CFUUIDCreate(kCFAllocatorDefault);
    CFStringRef cfuuid = CFUUIDCreateString(kCFAllocatorDefault, uuidRef);
    CFRelease(uuidRef);
    NSString *uuid = [((__bridge NSString *) cfuuid) copy];
    CFRelease(cfuuid);
    return uuid;
}

+ (NSString*)getUUIDString
{
    NSString *uuidStr = [KeychainHelper load:key];
    if (kIsStringValid(uuidStr))
    {
        return uuidStr;
    }
    else
    {
        return nil;
    }
}

+ (BOOL)setUUIDString:(NSString *)secValue
{
    if (kIsStringValid(secValue))
    {
        [KeychainHelper save:key data:secValue];
        return YES;
    }
    else
    {
        return NO;
    }
}


@end
