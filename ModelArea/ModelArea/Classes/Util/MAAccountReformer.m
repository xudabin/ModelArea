//
//  MAUserReformer.m
//  ModelArea
//
//  Created by mac on 15/8/12.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MAAccountReformer.h"
#import "MAUser.h"
#import "MAAccount.h"

@implementation MAAccountReformer

- (id)reformDataWithOriginData:(id)data{
    NSLog(@"data---------: %@", data);
    MAAccount *account = nil;
    if ([data[@"status"] intValue] > 0) {
         account = [MAAccount accountWithDict:data[@"result"]];
    }

    return account;
}

@end
