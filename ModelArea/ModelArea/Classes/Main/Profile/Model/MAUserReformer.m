//
//  MAUserReformer.m
//  ModelArea
//
//  Created by mac on 15/8/13.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MAUserReformer.h"
#import "MAReformerDelegate.h"
#import "MAUser.h"

@implementation MAUserReformer

- (id)reformDataWithOriginData:(id)data {
    NSLog(@"data---------: %@", data);
    MAUser *user = nil;
    if ([data[@"status"] intValue] > 0) {
        user = [MAUser objectWithKeyValues:data[@"user"]];
    }
    
    return user;
}

@end
