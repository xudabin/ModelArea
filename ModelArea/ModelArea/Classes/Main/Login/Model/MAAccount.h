//
//  WBCount.h
//  微博
//
//  Created by jewelz on 15/8/1.
//  Copyright (c) 2015年 yangtzeu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MAAccount : NSObject<NSCoding>

@property (copy, nonatomic) NSString *access_token;
@property (strong, nonatomic) NSNumber *expires_in;
@property (strong, nonatomic) NSNumber *userid;
@property (strong, nonatomic) NSDate *token_date;

+ (instancetype)accountWithDict:(NSDictionary *)dict;

@end
