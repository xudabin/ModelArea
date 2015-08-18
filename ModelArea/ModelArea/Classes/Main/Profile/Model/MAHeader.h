//
//  MAHeader.h
//  ModelArea
//
//  Created by 123 on 15/7/28.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//
#define Font(F) [UIFont systemFontOfSize:(F)]

#define UIColorRGBA(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

#define kWindowWidth                        ([[UIScreen mainScreen] bounds].size.width)
#define kWindowHeight                       ([[UIScreen mainScreen] bounds].size.height)

#define PROPERTION_X  kWindowWidth/375.0
#define PROPERTION_Y  kWindowHeight/667.0

#define CG(r, g, b, a) CGRectMake(r*PROPERTION_X,g*PROPERTION_Y, b, a)
//#define CG(r, g, b, a) CGRectMake(r*PROPERTION_X,g*PROPERTION_Y, b*PROPERTION_X, a*PROPERTION_Y)