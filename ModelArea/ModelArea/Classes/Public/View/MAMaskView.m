//
//  MAMaskView.m
//  ModelArea
//
//  Created by mac on 15/8/13.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MAMaskView.h"

@interface MAMaskView ()

@property (nonatomic, weak) UIImageView *backgroundView;
@property (nonatomic, weak) UIActivityIndicatorView *activityIndicatorView;
@property (nonatomic) SEL action;
@property (nonatomic, weak) id target;

@end

@implementation MAMaskView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self = [self initWithActivityIndicatorView];
    }
    return self;
}

- (instancetype)initWithBackGroundImageView
{
    self.frame = kScreenRect;
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:@"button_image"];
    [self addSubview:imageView];
    self.backgroundView = imageView;
    
    return self;
}

- (instancetype)initWithActivityIndicatorView
{
    self.frame = kScreenRect;
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [self addSubview:indicator];
    [indicator startAnimating];
    self.activityIndicatorView = indicator;
    
    return self;
}


- (instancetype)initWithMaskType:(MAMaskViewTpye)type {
    self = [super init];
    if (self) {
        switch (type) {
            case MAMaskViewTpyeImageView:
                return [self initWithBackGroundImageView];
                break;
            case MAMaskViewTpyeActivityIndicatorView:
                return [self initWithActivityIndicatorView];
                break;
        }
    }
    return self;
}


+ (instancetype)maskViewWithType:(MAMaskViewTpye)type {
    return [[self alloc] initWithMaskType:type];
}

- (instancetype)initWithRefreshingTarget:(id)target action:(SEL)action {
    self = [super init];
    if (self) {
        self.frame = kScreenRect;
        _action = action;
        _target = target;
        [self startAnimating];
    }
    return self;
}

- (void)setMaskViewTpye:(MAMaskViewTpye)maskViewTpye {
    _maskViewTpye = maskViewTpye;
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
    
    switch (maskViewTpye) {
        case MAMaskViewTpyeActivityIndicatorView: {
            self.frame = kScreenRect;
            UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
            [self addSubview:indicator];
            [indicator startAnimating];
            self.activityIndicatorView = indicator;
        }
            break;

        case MAMaskViewTpyeImageView: {
            self.frame = kScreenRect;
            UIImageView *imageView = [[UIImageView alloc] init];
            imageView.image = [UIImage imageNamed:@"button_image"];
            [self addSubview:imageView];
            self.backgroundView = imageView;
        }
            break;
    }
}

- (void)addRefreshingTarget:(id)target action:(SEL)action {
    [target performSelector:action withObject:nil];
}

- (void)startAnimating {

    [self.target performSelector:[self action] withObject:nil];
}


- (void)layoutSubviews {
    [super layoutSubviews];
    self.backgroundColor = MAColor(241, 242, 243, 1);
    
    if (self.activityIndicatorView) {
        self.activityIndicatorView.center = self.center;
    }
    if (self.backgroundView) {
        self.backgroundView.frame = self.frame;
    }
    
}

- (void)stopAnimating {
    if (self.activityIndicatorView) {
        [self.activityIndicatorView stopAnimating];
    }
}

@end
