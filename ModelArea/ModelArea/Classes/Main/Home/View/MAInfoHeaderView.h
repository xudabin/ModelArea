//
//  MAInfoHeaderView.h
//  ModelArea
//
//  Created by mac on 15/7/25.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MAModel;

@interface MAInfoHeaderView : UIView <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (weak, nonatomic) IBOutlet UILabel *heightLab;
@property (weak, nonatomic) IBOutlet UILabel *weightLab;
@property (weak, nonatomic) IBOutlet UILabel *barLab;
@property (weak, nonatomic) IBOutlet UILabel *bwhLab;

@property (strong, nonatomic) NSDictionary *data;
@property (strong, nonatomic) MAModel *model;

+ (instancetype)infoHeaderView;
+ (CGFloat)rowHeight;

@end
