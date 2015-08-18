//
//  MAToolBar.m
//  ModelArea
//
//  Created by mac on 15/7/29.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MAToolBar.h"

static const CGFloat SPACING = 30;
static const CGFloat BUTTON_WIDTH = 120;
static const CGFloat BUTTON_HEIGHT = 40;

@interface MAToolBar ()


@property (strong, nonatomic) UIImageView *backgrondImage;

@end

@implementation MAToolBar

+ (instancetype)toolBar {

    return [[self alloc] init];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, kScreenHeight-BAR_HEIGHT, kScreenWidth, BAR_HEIGHT);
        //self.backgroundColor = [UIColor whiteColor];
        _leftButton = [[UIButton alloc] initWithFrame:CGRectZero];
        [_leftButton setBackgroundColor:kDefaultColor];
        _leftButton.selected = NO;
        [_leftButton setTitle:@"关注" forState:UIControlStateNormal];
        [_leftButton setTitle:@"已关注" forState:UIControlStateSelected];
        [_leftButton setTitleColor:kDefaultTextColor forState:UIControlStateNormal];
        _leftButton.titleLabel.font = MAFONT_SIZE(16);
        _leftButton.layer.cornerRadius = 15;
        [self addSubview:_leftButton];
        
        _rightButton = [[UIButton alloc] initWithFrame:CGRectZero];
        [_rightButton setBackgroundColor:kDefaultColor];
        [_rightButton setTitle:@"私聊" forState:UIControlStateNormal];
        [_rightButton setTitleColor:kDefaultTextColor forState:UIControlStateNormal];
        _rightButton.titleLabel.font = MAFONT_SIZE(16);
        _rightButton.layer.cornerRadius = 15;
        [self addSubview:_rightButton];
        
//        _backgrondImage = [[UIImageView alloc] initWithFrame:CGRectZero];
//        [self addSubview:_backgrondImage];
        
    }
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.leftButton.frame = CGRectMake(SPACING, (BAR_HEIGHT-BUTTON_HEIGHT-1)/2, BUTTON_WIDTH, BUTTON_HEIGHT);
    
    
    self.rightButton.frame = CGRectMake(kScreenWidth-SPACING-BUTTON_WIDTH, (BAR_HEIGHT-BUTTON_HEIGHT-1)/2, BUTTON_WIDTH, BUTTON_HEIGHT);
    
}



- (void)show {
    UIWindow *window = [[UIApplication sharedApplication].windows firstObject];
    [window addSubview:self];
}


@end
