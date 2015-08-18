//
//  AppDelegate.m
//  ModelArea
//
//  Created by mac on 15/7/24.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "AppDelegate.h"
#import "MALoginViewController.h"
#import "MANavigationController.h"
#import "MATabBarController.h"
#import "MAAccount.h"
#import "MAAccountManager.h"
#import <SMS_SDK/SMS_SDK.h>
#import <AFNetworking.h>

#import <ShareSDK/ShareSDK.h>
#import <TencentOpenAPI/QQApiInterface.h>
#import <TencentOpenAPI/TencentOAuth.h>
#import "WXApi.h"
#import "WeiboSDK.h"
#import <RennSDK/RennSDK.h>

NSString * const MANetworkReachabilityStatusNotReachableNotification = @"MANetworkNotReachableNotification";

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //短信框架
    [SMS_SDK registerApp:MSG_APPKEY withSecret:MSG_APPSECRET];
    
    [self setupShardSDK];
    
    //监听网络状态
    NSURL *baseURL = [NSURL URLWithString:@"http://www.baidu.com/"];
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:baseURL];
    NSOperationQueue *operationQueue = manager.operationQueue;
    [manager.reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusReachableViaWWAN:
            case AFNetworkReachabilityStatusReachableViaWiFi:
                self.networkReachable = YES;
                [operationQueue setSuspended:NO];
                break;
            case AFNetworkReachabilityStatusNotReachable:
            default:
                [operationQueue setSuspended:YES];
                [SVProgressHUD showInfoWithStatus:@"网络连接不太顺畅"];
                self.networkReachable = NO;
                [[NSNotificationCenter defaultCenter] postNotificationName:MANetworkReachabilityStatusNotReachableNotification object:nil userInfo:nil];
                break;
        }
    }];
    
    [manager.reachabilityManager startMonitoring];
    
//    NSString *path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]stringByAppendingPathComponent:@"account.data"];
//    
//    NSLog(@"path: %@", path);
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    [UINavigationBar appearance].barTintColor = kDefaultColor;
    //[UINavigationBar appearance].tintColor = kDefaultTextColor;
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    MALoginViewController *loginVC = [[MALoginViewController alloc] init];

    
    //如果用户已经登录且token有效，则跳转到首页， 否则跳转到登录页面
    MAAccount *account = [MAAccountManager account];
    
    if (!account) {
        self.window.rootViewController = [[MANavigationController alloc ]initWithRootViewController:loginVC];
    } else {
        self.window.rootViewController = [[MATabBarController alloc] init];
    }
    
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)setupShardSDK {

     [ShareSDK registerApp:@"9aed07af39fa"];  //如果需要看下广告效果，可以把Appkey换成"737dfd5147db"
     
     //2. 初始化社交平台
     //2.1 代码初始化社交平台的方法
     [self initializePlat];

}

- (void)initializePlat {
    /**
     连接新浪微博开放平台应用以使用相关功能，此应用需要引用SinaWeiboConnection.framework
     http://open.weibo.com上注册新浪微博开放平台应用，并将相关信息填写到以下字段
     **/
    [ShareSDK connectSinaWeiboWithAppKey:@"813370806"
                               appSecret:@"fe40ebdddb7ca17b866f0d82b9879d71"
                             redirectUri:@"http://www.baidu.com"
                             weiboSDKCls:[WeiboSDK class]];
    
    /**
     连接QQ空间应用以使用相关功能，此应用需要引用QZoneConnection.framework
     http://connect.qq.com/intro/login/上申请加入QQ登录，并将相关信息填写到以下字段
     
     如果需要实现SSO，需要导入TencentOpenAPI.framework,并引入QQApiInterface.h和TencentOAuth.h，将QQApiInterface和TencentOAuth的类型传入接口
     **/
    [ShareSDK connectQZoneWithAppKey:@"dMRHgYKwH4m0POIk"
                           appSecret:@"aed9b0303e3ed1e27bae87c33761161d"
                   qqApiInterfaceCls:[QQApiInterface class]
                     tencentOAuthCls:[TencentOAuth class]];
    
    /**
     连接微信应用以使用相关功能，此应用需要引用WeChatConnection.framework和微信官方SDK
     http://open.weixin.qq.com上注册应用，并将相关信息填写以下字段
     **/
    //    [ShareSDK connectWeChatWithAppId:@"wx4868b35061f87885" wechatCls:[WXApi class]];
    [ShareSDK connectWeChatWithAppId:@"wx4868b35061f87885"
                           appSecret:@"64020361b8ec4c99936c0e3999a9f249"
                           wechatCls:[WXApi class]];
    /**
     连接QQ应用以使用相关功能，此应用需要引用QQConnection.framework和QQApi.framework库
     http://mobile.qq.com/api/上注册应用，并将相关信息填写到以下字段
     **/
    //旧版中申请的AppId（如：QQxxxxxx类型），可以通过下面方法进行初始化
    //    [ShareSDK connectQQWithAppId:@"QQ075BCD15" qqApiCls:[QQApi class]];
    
    [ShareSDK connectQQWithQZoneAppKey:@"dMRHgYKwH4m0POIk"
                     qqApiInterfaceCls:[QQApiInterface class]
                       tencentOAuthCls:[TencentOAuth class]];
//    [ShareSDK connectQQWithQZoneAppKey:@"801312852"
//                     qqApiInterfaceCls:[QQApiInterface class]
//                       tencentOAuthCls:[TencentOAuth class]];
    
    /**
     连接Facebook应用以使用相关功能，此应用需要引用FacebookConnection.framework
     https://developers.facebook.com上注册应用，并将相关信息填写到以下字段
     **/
    [ShareSDK connectFacebookWithAppKey:@"107704292745179"
                              appSecret:@"38053202e1a5fe26c80c753071f0b573"];
    
    /**
     连接Twitter应用以使用相关功能，此应用需要引用TwitterConnection.framework
//     https://dev.twitter.com上注册应用，并将相关信息填写到以下字段
//     **/
     [ShareSDK connectTwitterWithConsumerKey:@"LRBM0H75rWrU9gNHvlEAA2aOy"
                             consumerSecret:@"gbeWsZvA9ELJSdoBzJ5oLKX0TU09UOwrzdGfo9Tg7DjyGuMe8G"
                                redirectUri:@"http://mob.com"];
    
//    /**
//     连接豆瓣应用以使用相关功能，此应用需要引用DouBanConnection.framework
//     http://developers.douban.com上注册豆瓣社区应用，并将相关信息填写到以下字段
//     **/
//    [ShareSDK connectDoubanWithAppKey:@"02e2cbe5ca06de5908a863b15e149b0b"
//                            appSecret:@"9f1e7b4f71304f2f"
//                          redirectUri:@"http://www.sharesdk.cn"];
//    
//    /**
//     连接印象笔记应用以使用相关功能，此应用需要引用EverNoteConnection.framework
//     http://dev.yinxiang.com上注册应用，并将相关信息填写到以下字段
//     **/
//    [ShareSDK connectEvernoteWithType:SSEverNoteTypeSandbox
//                          consumerKey:@"sharesdk-7807"
//                       consumerSecret:@"d05bf86993836004"];
//    
}

- (BOOL)application:(UIApplication *)application
      handleOpenURL:(NSURL *)url
{
    return [ShareSDK handleOpenURL:url
                        wxDelegate:self];
}

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation
{
    return [ShareSDK handleOpenURL:url
                 sourceApplication:sourceApplication
                        annotation:annotation
                        wxDelegate:self];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
