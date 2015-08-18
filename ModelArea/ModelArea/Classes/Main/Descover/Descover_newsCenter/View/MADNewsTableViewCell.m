//
//  MANewsTableViewCell.m
//  ModelArea
//
//  Created by mac on 15/7/27.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MADNewsTableViewCell.h"

@implementation MADNewsTableViewCell

- (void)awakeFromNib {
    // Initialization code
}
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self =[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        CGRect rect =[UIScreen mainScreen].bounds;
        
        _leftButton =[[UIButton alloc]initWithFrame:CGRectMake(0, 0, (rect.size.width-1)/2, 100/2)];
        [_leftButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self addSubview:_leftButton];
        
        _rightButton =[[UIButton alloc]initWithFrame:CGRectMake((rect.size.width-1)/2+1, 0, (rect.size.width-1)/2, 100/2)];
        [_rightButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self addSubview:_rightButton];
        
        _label =[[UILabel alloc]initWithFrame:CGRectMake((rect.size.width-1)/2, 0, 1, 100/2)];
        [self addSubview:_label];
       
    }
    NSLog(@"++++++++++%f",self.width);
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
