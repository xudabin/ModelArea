//
//  MAInfoHeaderView.m
//  ModelArea
//
//  Created by mac on 15/7/25.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MAInfoHeaderView.h"
#import "MAModel.h"

static const int ImageCount = 3;
//static const CGFloat ScrollHeight = 200;

@interface MAInfoHeaderView ()

@property (weak, nonatomic) UIImageView *firstImageView;

@end

@implementation MAInfoHeaderView


+ (instancetype)infoHeaderView {
    return [[[NSBundle mainBundle] loadNibNamed:@"MAInfoHeaderView" owner:nil options:nil] lastObject];
}
- (void)awakeFromNib {
    self.scrollView.contentSize = CGSizeMake(kScreenWidth * ImageCount, self.scrollView.height);
    
    for (int i=0; i<ImageCount; i++) {
        UIImageView *image = [[UIImageView alloc] init];
        NSString *imageNamed = [NSString stringWithFormat:@"girl_%d.jpg",i];
        image.image = [UIImage imageNamed:imageNamed];
        
        [self.scrollView addSubview:image];
    }
    
    self.scrollView.delegate = self;
    
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    for (int i=0; i<self.scrollView.subviews.count; i++) {
        UIImageView *image = (UIImageView *)self.scrollView.subviews[i];
        image.frame = CGRectMake(i*self.width, 0, self.scrollView.width, self.scrollView.height);
    }
}

- (void)setModel:(MAModel *)model {
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSInteger currentPage = scrollView.contentOffset.x / kScreenWidth;
    self.pageControl.currentPage = currentPage;
    
}

+ (CGFloat)rowHeight {
    return 236;
}


@end
