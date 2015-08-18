//
//  MAFriendsTableViewCell.m
//  ModelArea
//
//  Created by mac on 15/7/29.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MADFriendsTableViewCell.h"
#import "MADFriendsViewController.h"
@implementation MADFriendsTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self =[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        CGRect rect =[UIScreen mainScreen].bounds;
        _photoImageView =[[UIImageView alloc]initWithFrame:CGRectMake(20/2,15/2 , 70/2, 70/2)];
        [self addSubview:_photoImageView];
        
       
       
        _nameLabel =[[UILabel alloc]initWithFrame:CGRectMake(110/2, (50-16)/2, 100, 16)];
        _nameLabel.textAlignment =NSTextAlignmentLeft;
        _nameLabel.font =[UIFont systemFontOfSize:16];
        [self addSubview:_nameLabel];
        
        //  加判断 才能确定类别图像的大小
        _classImageView =[[UIImageView alloc]initWithFrame:CGRectMake(110/2+_nameLabel.frame.size.width+10, (50-15)/2, 30/2, 30/2)];
        [self addSubview:_classImageView];
        
        _addressLabel =[[UILabel alloc]initWithFrame:CGRectMake(rect.size.width-100-10, (50-13)/2, 100, 16)];
        _addressLabel.textAlignment =NSTextAlignmentRight;
        _addressLabel.font =[UIFont systemFontOfSize:13];
        [self addSubview:_addressLabel];
       
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
