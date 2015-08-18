//
//  MAActivityHeader.m
//  ModelArea
//
//  Created by mac on 15/7/31.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MAActivityHeader.h"

@implementation MAActivityHeader

+ (instancetype)activityHeader {
    return [[[NSBundle mainBundle] loadNibNamed:@"MAActivityHeader" owner:nil options:nil] lastObject];
}


@end
