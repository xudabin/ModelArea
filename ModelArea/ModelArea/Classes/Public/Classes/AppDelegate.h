//
//  AppDelegate.h
//  ModelArea
//
//  Created by mac on 15/7/24.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString * const MANetworkReachabilityStatusNotReachableNotification;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, assign, getter=isNetworkReachable) BOOL networkReachable;

@end

