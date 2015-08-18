//
//  CZMessageModel.m
//  QQ聊天布局02
//
//  Created by S.J on 14-8-18.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MAMessageModel.h"

@implementation MAMessageModel

+ (instancetype)messageWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    
    return self;
}
@end
