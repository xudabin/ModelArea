//
//  MADescoverNewsTableViewCell.m
//  ModelArea
//
//  Created by mac on 15/7/26.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MADDescoverNewsTableViewCell.h"

@implementation MADDescoverNewsTableViewCell

- (void)awakeFromNib {
    // Initialization code
}
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self =[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        CGRect rect =[UIScreen mainScreen].bounds;

        _pictureImageView =[[UIImageView alloc]initWithFrame:CGRectMake(10, (150-110)/2/2, 110/2, 110/2)];
        [ self addSubview:_pictureImageView];
        _hightImageView =[[UIImageView alloc]initWithFrame:CGRectMake(10+110/2-24/4, 10-6, 12, 12)];
        [self addSubview:_hightImageView];
        _downImageView =[[UIImageView alloc]initWithFrame:CGRectMake(10+110/2-24/4, 10-6+110/2, 12, 12)];
        [self addSubview:_downImageView];
        
        _hightLabel =[[UILabel alloc]initWithFrame:CGRectMake((20+20+110)/2, 16, 100, 15)];
        _hightLabel.font =[UIFont systemFontOfSize:16];
        _hightLabel.textAlignment =NSTextAlignmentLeft;
        [self addSubview:_hightLabel];
        _downLabel =[[UILabel alloc]initWithFrame:CGRectMake((20+20+110)/2, 16+17+15, 200, 15)];
        _downLabel.font =[UIFont systemFontOfSize:16] ;
        _downLabel.textAlignment =NSTextAlignmentLeft;
        [self addSubview:_downLabel];
        
        _timeLabel =[[UILabel alloc]initWithFrame:CGRectMake(rect.size.width-60, 32/2, 50, 15)];
        _timeLabel.font =[UIFont systemFontOfSize:16];
        _timeLabel.textAlignment =NSTextAlignmentRight;
        [self addSubview:_timeLabel];
        
        _commentButton =[[UIButton alloc]initWithFrame:CGRectMake(rect.size.width-(50+20)/2, 75-(22+40)/2, 50/2, 40/2)];
       
      //  [_commentButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self addSubview:_commentButton];
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
