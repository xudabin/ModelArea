//
//  User.m
//  cell
//
//  Created by mac on 15/8/5.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "DUser.h"

@implementation DUser
- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        _content  = dict[@"content"];
        _userImage = dict[@"userImage"];
        _userName =dict[@"userName"];
        _time =dict[@"time"];
        _loveCount =dict[@"loveCount"];
        _commentCount =dict[@"commentCount"];
        _imageString =dict[@"imageString"];
        _loveImage =dict[@"loveImage"];
        _commentImage =dict[@"commentImage"];
        _Array =dict[@"Array"];
        _detailCommentArray =dict[@"detailCommentArray"];
    }
    return self;
}

+ (instancetype)userWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}
-(instancetype)initWithArr:(NSArray *)array
{
    self =[super init];
    if (self) {
      
    }
    return self;
}
+ (instancetype)userWithArr:(NSArray *)array
{
    return [[self alloc]initWithArray:array];
}
@end
