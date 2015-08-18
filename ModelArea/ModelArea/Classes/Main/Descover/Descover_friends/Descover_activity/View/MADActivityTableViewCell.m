//
//  ActivityTableViewCell.m
//  ModelArea
//
//  Created by 徐斌 on 15/8/6.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MADActivityTableViewCell.h"

@implementation MADActivityTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self =[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _imageButton =[[UIButton alloc]initWithFrame:CGRectMake(20, 10, 120/2, 120/2)];
        [self addSubview:_imageButton];
        _actitiyLabel =[[UILabel alloc]initWithFrame:CGRectMake(100, 10, kScreenWidth-180, 30)];
        _actitiyLabel.font =[UIFont systemFontOfSize:13];
        _actitiyLabel.textAlignment =NSTextAlignmentCenter;
        [self addSubview:_actitiyLabel];
        _resultLabel =[[UILabel alloc]initWithFrame:CGRectMake(100, 40, kScreenWidth-180, 30)];
       _resultLabel.textAlignment =NSTextAlignmentCenter;
        [self addSubview:_resultLabel];
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
