//
//  MAMaskView.h
//  ModelArea
//
//  Created by mac on 15/8/13.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, MAMaskViewTpye) {
    MAMaskViewTpyeImageView = 0,
    MAMaskViewTpyeActivityIndicatorView = 1
    
};

@interface MAMaskView : UIView

@property (nonatomic, assign) MAMaskViewTpye maskViewTpye;

+ (instancetype)maskViewWithType:(MAMaskViewTpye)type;
- (instancetype)initWithMaskType:(MAMaskViewTpye)type;
- (instancetype)initWithRefreshingTarget:(id)target action:(SEL)action;
- (void)stopAnimating;
- (void)addRefreshingTarget:(id)target action:(SEL)action;

@end
