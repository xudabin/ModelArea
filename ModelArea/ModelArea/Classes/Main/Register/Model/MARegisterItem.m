//
//  MARegisterItem.m
//  ModelArea
//
//  Created by mac on 15/7/28.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MARegisterItem.h"

@implementation MARegisterItem

+ (instancetype)itemWithDictionary:(NSDictionary *)dict {
    MARegisterItem *item = [[MARegisterItem alloc] init];
    [item setValuesForKeysWithDictionary:dict];
    return item;
}

@end
