#import "UmengStatisticsPlugin.h"

#import <UMCommon/UMConfigure.h>
#import <UMCommon/MobClick.h>

@implementation UmengStatisticsPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"umeng_statistics"
            binaryMessenger:[registrar messenger]];
  UmengStatisticsPlugin* instance = [[UmengStatisticsPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

#pragma mark - 调用方法入口
- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    if ([@"initAppKey" isEqualToString:call.method]) {
        [self initAppKeyWithCall:call result:result];
    } else if ([@"onEvent" isEqualToString:call.method]) {
        [self onEvent:call result:result];
    } else if ([@"onProfileSignIn" isEqualToString:call.method]) {
        [self onProfileSignIn:call result:result];
    } else if ([@"onProfileSignOff" isEqualToString:call.method]) {
        [self onProfileSignOff:result];
    } else if ([@"setPageCollectionModeAuto" isEqualToString:call.method]) {
        [self setPageCollectionModeAuto:result];
    } else if ([@"setPageCollectionModeManual" isEqualToString:call.method]) {
        [self setPageCollectionModeManual:result];
    } else if ([@"onPageStart" isEqualToString:call.method]) {
        [self onPageStart:call result:result];
    } else if ([@"onPageEnd" isEqualToString:call.method]) {
        [self onPageEnd:call result:result];
    } else if ([@"reportError" isEqualToString:call.method]) {
        [self reportError:result];
    } else {
        result(FlutterMethodNotImplemented);
    }
}

#pragma mark 初始化Appkey
- (void)initAppKeyWithCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    NSDictionary *arguments = call.arguments;
    //    NSString *android = [arguments objectForKey:@"android"];
    NSString *ios = [arguments objectForKey:@"ios"];
    NSString *channel = [arguments objectForKey:@"channel"];
    if (ios == nil || channel == nil) {
        result([NSNumber numberWithBool:NO]);
    }
    [UMConfigure initWithAppkey:ios channel:channel];
    result([NSNumber numberWithBool:YES]);
}
//
#pragma mark 事件统计功能
- (void)onEvent:(FlutterMethodCall*)call result:(FlutterResult)result {
    NSDictionary *arguments = call.arguments;
    NSString *id = [arguments objectForKey:@"id"];
    NSDictionary *data = [arguments objectForKey:@"data"];
    if (id == nil) {
        result([NSNumber numberWithBool:NO]);
    }
    [MobClick event:id attributes:data];
    result([NSNumber numberWithBool:YES]);
}

#pragma mark 设置用户账户
- (void)onProfileSignIn:(FlutterMethodCall*)call result:(FlutterResult)result {
    NSDictionary *arguments = call.arguments;
    NSString *userID = [arguments objectForKey:@"userID"];
    if (userID == nil) {
        result([NSNumber numberWithBool:NO]);
    }
    [MobClick profileSignInWithPUID:userID];
    result([NSNumber numberWithBool:YES]);
}

#pragma mark 取消用户账户
- (void)onProfileSignOff:(FlutterResult)result {
    [MobClick profileSignOff];
    result([NSNumber numberWithBool:YES]);
}

#pragma mark 自动采集页面
- (void)setPageCollectionModeAuto:(FlutterResult)result {
    [MobClick setAutoPageEnabled:YES];
    result([NSNumber numberWithBool:YES]);
}

#pragma mark 手动采集页面
- (void)setPageCollectionModeManual:(FlutterResult)result {
    [MobClick setAutoPageEnabled:NO];
    result([NSNumber numberWithBool:YES]);
}

#pragma mark 自动页面时长统计，必须配对使用
- (void)onPageStart:(FlutterMethodCall*)call result:(FlutterResult)result {
    NSDictionary *arguments = call.arguments;
    NSString *viewName = [arguments objectForKey:@"viewName"];
    if (viewName == nil) {
        result([NSNumber numberWithBool:NO]);
    }
    [MobClick beginLogPageView:viewName];
    result([NSNumber numberWithBool:YES]);
}

#pragma mark 结束页面时长统计，必须配对使用
- (void)onPageEnd:(FlutterMethodCall*)call result:(FlutterResult)result {
    NSDictionary *arguments = call.arguments;
    NSString *viewName = [arguments objectForKey:@"viewName"];
    if (viewName == nil) {
        result([NSNumber numberWithBool:NO]);
    }
    [MobClick endLogPageView:viewName];
    result([NSNumber numberWithBool:YES]);
}

#pragma mark 错误统计Api不存在
- (void)reportError:(FlutterResult)result {
    NSLog(@"%@", @"错误统计Api不存在！");
    result([NSNumber numberWithBool:YES]);
}

@end
