//
//  WBCount.m
//  微博
//
//  Created by jewelz on 15/8/1.
//  Copyright (c) 2015年 yangtzeu. All rights reserved.
//

#import "MAAccount.h"

@implementation MAAccount

+ (instancetype)accountWithDict:(NSDictionary *)dict {
    MAAccount *account = [[MAAccount alloc] init];
    account.access_token = dict[@"access_token"];
    account.expires_in = dict[@"expires_in"];
    account.userid = dict[@"userid"];
    account.token_date = [NSDate date];
    
    return account;
}

// 对象归档
- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.access_token forKey:@"access_token"];
    [aCoder encodeObject:self.expires_in forKey:@"expires_in"];
    [aCoder encodeObject:self.userid forKey:@"userid"];
    [aCoder encodeObject:self.token_date forKey:@"token_date"];
}

// 对象解档
- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        self.access_token = [aDecoder decodeObjectForKey:@"access_token"];
        self.expires_in = [aDecoder decodeObjectForKey:@"expires_in"];
        self.userid = [aDecoder decodeObjectForKey:@"userid"];
        self.token_date = [aDecoder decodeObjectForKey:@"token_date"];
    }
    return self;
}

@end
