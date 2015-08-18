//
//  MAADSHeaderView.m
//  ModelArea
//
//  Created by mac on 15/8/15.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MAADSHeaderView.h"
#import "JXBAdPageView.h"

@interface MAADSHeaderView ()

@property(nonatomic,strong)JXBAdPageView *adView;

@end

@implementation MAADSHeaderView

+ (NSString *)ID {
    return @"MAADSHeader";
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self = [self initWithImages:nil];
    }
    return self;
}

- (instancetype)initWithImages:(NSArray *)images {
    _adView = [[JXBAdPageView alloc] initWithFrame:self.frame];
    self.backgroundColor = [UIColor blackColor];
    _adView.iDisplayTime = 3;
    _adView.pageControl.tintColor = kDefaultColor;
    [_adView startAdsWithBlock:images block:nil];
    [self addSubview:_adView];
    return self;
}

//- (void)layoutSubviews {
//    [super layoutSubviews];
//    
//    self.adView.frame = self.bounds;
//}

- (void)setImages:(NSArray *)images {
    _images = images;
    [self.adView startAdsWithBlock:images block:nil];
}

@end
