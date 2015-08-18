//
//  MAHeaderView.m
//  ModelArea
//
//  Created by mac on 15/7/24.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MAHeaderView.h"

static const CGFloat LabelWidth = 120;
static const CGFloat ButtonWidth = 80;
#define kDelicateColor MAColor(251, 139,111,1)
#define kRecommendColor MAColor(252, 217,111,1)

@interface MAHeaderView () {
    UIView *_leftView;
    UILabel *_titleLab;
    UIButton *_moreButton;
}

@end

@implementation MAHeaderView

+ (NSString *)ID {
    return @"Header";
}

- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title color:(UIColor *)color image:(NSString *)imageNamed
{
    
    self.backgroundColor = [UIColor whiteColor];
    _leftView = [[UIView alloc] initWithFrame:CGRectZero];
    _leftView.backgroundColor = color;
    [self addSubview:_leftView];
    
    _titleLab = [[UILabel alloc] initWithFrame:CGRectZero];
    _titleLab.text = title;
    _titleLab.font = MAFONT_SIZE(15);
    [self addSubview:_titleLab];
    
    _moreButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_moreButton setTitle:@"更多" forState:UIControlStateNormal];
    _moreButton.titleLabel.font = MAFONT_SIZE(14);
    [_moreButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_moreButton setImage:MASETIMAGE(imageNamed) forState:UIControlStateNormal];
    
    
    [self addSubview:_moreButton];
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self = [self initWithFrame:frame title:@"嫩模新房" color:kDelicateColor image:@"home_more_orange_icon"];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    _leftView.frame = CGRectMake(0, 0, 6, self.height);
    
    _titleLab.frame = CGRectMake(_leftView.width+12, 0, LabelWidth, self.height);
    _moreButton.frame = CGRectMake(self.width-10-ButtonWidth, 0, ButtonWidth, self.height);
    
    [_moreButton setImageEdgeInsets:UIEdgeInsetsMake(0, _moreButton.titleLabel.width, 0,  -_moreButton.titleLabel.width)];
    [_moreButton setTitleEdgeInsets:UIEdgeInsetsMake(0, -_moreButton.currentImage.size.width-8, 0, _moreButton.currentImage.size.width)];
    
    
}

- (void)setTitle:(NSString *)title {
    _title = [title copy];
    _titleLab.text = title;
}

- (void)setColor:(UIColor *)color {
    _color = color;
    _leftView.backgroundColor = color;
}

- (void)setImaeNamed:(NSString *)imageNamed {
    _imageNamed = [imageNamed copy];
    [_moreButton setImage:MASETIMAGE(imageNamed) forState:UIControlStateNormal];
}


- (void)addTarget:(id)target action:(SEL)action {
    [_moreButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
}

- (void)drawRect:(CGRect)rect {
    UIBezierPath *path = [[UIBezierPath alloc] init];
    path.lineWidth = 1;
    UIColor *color = kSEPARATOR_COLOR;
    [color setStroke];
    
    [path moveToPoint:CGPointZero];
    [path addLineToPoint:CGPointMake(self.width, 0)];
    [path moveToPoint:CGPointMake(0, self.height)];
    [path addLineToPoint:CGPointMake(self.width, self.height-0.5)];
    
    [path stroke];
    
}

@end
