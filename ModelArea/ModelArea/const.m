//
//  UserDefault.m
//  GoCourse
//
//  Created by jewelz on 15/2/2.
//  Copyright (c) 2015年 yangtzeU. All rights reserved.
//

#import "const.h"

//@implementation UserDefault

CGRect getRectFromText(NSString *text, CGSize size, UIFont *font){
    CGRect textRect = [text boundingRectWithSize:size options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading) attributes:[NSDictionary dictionaryWithObject:font forKey:NSFontAttributeName] context:nil];
    return textRect;
}

//@end
