//
//  MAButtonBroup.m
//  
//
//  Created by mac on 15/8/4.
//
//

#import "MAButtonBroup.h"

static const CGFloat Margin_left = 0;
static const CGFloat Margin_top = 10;
static const CGFloat Title_size = 14;
static const CGFloat Desc_size = 12;
static const CGFloat Spacing = 3;

@interface MAButtonBroup ()
@property (strong, nonatomic) NSArray *descs;
@property (strong, nonatomic) UILabel *lVLabel;
@property (strong, nonatomic) UILabel *lVText;
@property (strong, nonatomic) UILabel *fansLabel;
@property (strong, nonatomic) UILabel *fellowerLabel;


@property (strong, nonatomic) NSMutableArray *buttons;
@end

@implementation MAButtonBroup

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _lVText = [[UILabel alloc] initWithFrame:CGRectZero];
        _lVText.textColor = kDEFAULT_BLACKCOLOR;
        _lVText.font = MAFONT_SIZE(Title_size);
        _lVText.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_lVText];
        
        _lVLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _lVLabel.textColor = kDEFAULT_GRAYCOLOR;
        _lVLabel.textAlignment = NSTextAlignmentCenter;
        _lVLabel.font = MAFONT_SIZE(Desc_size);
        _lVLabel.text = @"等级";
        [self addSubview:_lVLabel];
        
        _fansText = [[UILabel alloc] initWithFrame:CGRectZero];
        _fansText.textColor = kDEFAULT_BLACKCOLOR;
        _fansText.textAlignment = NSTextAlignmentCenter;
        _fansText.font = MAFONT_SIZE(Title_size);
        [self addSubview:_fansText];
        
        _fansLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _fansLabel.textColor = kDEFAULT_GRAYCOLOR;
        _fansLabel.textAlignment = NSTextAlignmentCenter;
        _fansLabel.font = MAFONT_SIZE(Desc_size);
        _fansLabel.text = @"粉丝";
        [self addSubview:_fansLabel];
        
        _fellowerText = [[UILabel alloc] initWithFrame:CGRectZero];
        _fellowerText.textColor = kDEFAULT_BLACKCOLOR;
        _fellowerText.textAlignment = NSTextAlignmentCenter;
        _fellowerText.font = MAFONT_SIZE(Title_size);
        [self addSubview:_fellowerText];
        
        _fellowerLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _fellowerLabel.textColor = kDEFAULT_GRAYCOLOR;
        _fellowerLabel.textAlignment = NSTextAlignmentCenter;
        _fellowerLabel.font = MAFONT_SIZE(Desc_size);
        _fellowerLabel.text = @"关注";
        [self addSubview:_fellowerLabel];
        
        _buttons = [NSMutableArray arrayWithCapacity:2];
        for (int i=0; i<2; i++) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
           // button.backgroundColor = kDefaultColor; 
            button.tag = i+1;
            [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:button];
            [_buttons addObject:button];
            
        }

     }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat ItemHeight = (self.height - 2*Spacing)/2;
    CGFloat ItemWidth = self.width/3;
    
    self.lVText.frame = CGRectMake(0, Spacing, ItemWidth, ItemHeight);
    self.lVLabel.frame = CGRectMake(0, CGRectGetMaxY(_lVText.frame), ItemWidth, ItemHeight);
    
    self.fansText.frame = CGRectMake(ItemWidth, Spacing, ItemWidth, ItemHeight);
    self.fansLabel.frame = CGRectMake(ItemWidth, CGRectGetMaxY(_fansText.frame), ItemWidth, ItemHeight);
    
    self.fellowerText.frame = CGRectMake(ItemWidth*2, Spacing, ItemWidth, ItemHeight);
    self.fellowerLabel.frame = CGRectMake(ItemWidth*2, CGRectGetMaxY(_fellowerText.frame), ItemWidth, ItemHeight);
    
    for (int i=0; i<self.buttons.count; i++) {
        UIButton *button = self.buttons[i];
        button.frame = CGRectMake((i+1)*ItemWidth, 0, ItemWidth, self.height);
    }
    
}

- (void)setData:(NSDictionary *)data {
    _data = data;
    self.lVText.text = data[@"level"];
    self.fansText.text = data[@"fans"];
    self.fellowerText.text = data[@"fellower"];
    
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    UIBezierPath *path = [[UIBezierPath alloc] init];
    path.lineWidth = 1;
    UIColor *lineColor = kSEPARATOR_COLOR;
    [lineColor setStroke];
    
    [path moveToPoint:CGPointMake(Margin_left, 0)];
    [path addLineToPoint:CGPointMake(self.width-Margin_left, 0)];
    
    [path moveToPoint:CGPointMake(self.width/3-1, Margin_top)];
    [path addLineToPoint:CGPointMake(self.width/3-1, self.height-Margin_top)];
    
    [path moveToPoint:CGPointMake(self.width/1.5-1, Margin_top)];
    [path addLineToPoint:CGPointMake(self.width/1.5-1, self.height-Margin_top)];

    
    [path stroke];
    
}

- (void)clickButton:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(buttonGroup: clickedAtTag:)]) {
        
        [self.delegate buttonGroup:self clickedAtTag:sender.tag];
    }
}


@end
