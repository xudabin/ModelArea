//
//  MACity.m
//  ModelArea
//
//  Created by mac on 15/8/13.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MACity.h"

@implementation MACity

/**
 *  将属性名换为其他key去字典中取值
 *
 *  @return 字典中的key是属性名，value是从字典中取值用的key
 */
+ (NSDictionary *)replacedKeyFromPropertyName {
    return @{@"cid":@"id"};
}

@end
