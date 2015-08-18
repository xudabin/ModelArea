//
//  MACtiiesView.m
//  ModelArea
//
//  Created by mac on 15/8/5.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MACitiesView.h"

static const CGFloat ItemHeight = 33;
static const CGFloat MarginLeft = 15;
static const CGFloat Spacing = 15;
static const int count = 5;

@interface MACitiesView ()

@property (nonatomic, strong) UILabel *title;

@end

@implementation MACitiesView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        for (int i=0; i<count; i++) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.tag = i+1;
            button.backgroundColor = kDefaultTextColor;
            [button setTitleColor:kDEFAULT_BLACKCOLOR forState:UIControlStateNormal];
            button.titleLabel.font = MAFONT_SIZE(15);
            [button addTarget:self action:@selector(selectCity:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:button];
        }
        
        _title = [[UILabel alloc] initWithFrame:CGRectZero];
        _title.text = @"已开通服务的城市";
        _title.font = MAFONT_SIZE(15);
        
        [self addSubview:_title];

    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.title.frame = CGRectMake(MarginLeft, Spacing, 140, 22);
    
    CGFloat top = CGRectGetMaxY(self.title.frame);
    
    CGFloat width = (self.width-(4*Spacing)) / 3;
    
    for (int i=0; i<self.subviews.count-1; i++) {
        UIButton *button = (UIButton *)self.subviews[i];
        button.frame = CGRectMake(MarginLeft+i%3*(width+Spacing), i/3 * (ItemHeight+Spacing)+Spacing+top, width, ItemHeight);
    }
    
    
}

+ (CGFloat)rowHeight {
    return 200;
}

- (void)setData:(NSArray *)data {
    _data = data;
    
    for (int i=0; i<self.subviews.count-1; i++) {
        UIButton *button = (UIButton *)self.subviews[i];
        [button setTitle:data[i] forState:UIControlStateNormal];
    }
}

- (void)selectCity:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(cityView:didSelectedCity:)]) {
        [self.delegate cityView:self didSelectedCity:sender.currentTitle];
    }
}

@end
