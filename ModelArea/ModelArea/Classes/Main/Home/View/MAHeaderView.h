//
//  MAHeaderView.h
//  ModelArea
//
//  Created by mac on 15/7/24.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MAHeaderView : UICollectionReusableView

@property (copy, nonatomic) NSString *title;
@property (strong, nonatomic) UIColor *color;
@property (strong, nonatomic) NSString *imageNamed;

//+ (instancetype)headerViewWithFrame:(CGRect)frame title:(NSString *)title color:(UIColor *)color image:(NSString *)imageNamed;

+ (NSString *)ID;
- (void)addTarget:(id)target action:(SEL)action;

@end
