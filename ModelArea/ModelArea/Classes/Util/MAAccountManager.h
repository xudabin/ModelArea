//
//  WBAccountManager.h
//  微博
//
//  Created by jewelz on 15/8/1.
//  Copyright (c) 2015年 yangtzeu. All rights reserved.
//

#import <Foundation/Foundation.h>
@class MAAccount;
@interface MAAccountManager : NSObject

+ (void)saveAccount:(MAAccount *)account;
+ (MAAccount *)account;

@end
