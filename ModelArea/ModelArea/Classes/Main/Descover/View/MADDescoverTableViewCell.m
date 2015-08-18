//
//  MADescoverTableViewCell.m
//  ModelArea
//
//  Created by mac on 15/7/24.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MADDescoverTableViewCell.h"

@implementation MADDescoverTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self =[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _photoImageView =[[UIImageView alloc]initWithFrame:CGRectMake(30/2, 15/2, 25, 25)];
        [self addSubview:_photoImageView];
        _nameLabel =[[UILabel alloc]initWithFrame:CGRectMake(110/2, 25/2, 100, 15)];
        _nameLabel.font =[UIFont systemFontOfSize:16];
        _nameLabel.textAlignment = NSTextAlignmentLeft;
        [self addSubview:_nameLabel];
    }
    return self;
}
@end
