//
//  MANonePhotoTableViewCell.m
//  ModelArea
//
//  Created by mac on 15/7/28.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MADNonePhotoTableViewCell.h"
#define IMAGEWIDTH  (rect.size.width-120)/3
@implementation MADNonePhotoTableViewCell

- (void)awakeFromNib {
    // Initialization code
}
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self =[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
          CGRect rect =[UIScreen mainScreen].bounds;
        _photoImageView =[[UIImageView alloc]initWithFrame:CGRectMake(20/2, 30/2, 110/2, 110/2)];
        [self addSubview:_photoImageView];
        _nameLabel =[[UILabel alloc]initWithFrame:CGRectMake(150/2, 30/2, 100, 15)];
        _nameLabel.textAlignment =NSTextAlignmentLeft;
        [self addSubview:_nameLabel];
        
        _timeLabel =[[UILabel alloc]initWithFrame:CGRectMake(rect.size.width-10-50, 30/2, 50, 15)];
        _timeLabel.textAlignment =NSTextAlignmentRight;
        [self addSubview:_timeLabel];
        
        _detailTxetLabel =[[UILabel alloc]initWithFrame:CGRectMake(150/2, 15+15+10,rect.size.width-90, 50)];
        _detailTxetLabel.font =[UIFont systemFontOfSize:13];
        [_detailTxetLabel setNumberOfLines:0];
        [self addSubview:_detailTxetLabel];
        
        _loveImageView =[[UIImageView alloc]initWithFrame:CGRectMake((150+IMAGEWIDTH)/2, 100+20/2, 48/2, 40/2)];
        [self addSubview:_loveImageView];
        _commentImageView =[[UIImageView alloc]initWithFrame:CGRectMake((150+IMAGEWIDTH*4+30+10)/2, 100+20/2, 44/2, 40/2)];
        [self addSubview:_commentImageView];
        
        _commentLabel =[[UILabel alloc]initWithFrame:CGRectMake((150+IMAGEWIDTH*4+30+10+44+10)/2, 100+20/2, 40, 15)];
        _commentLabel.font =[UIFont systemFontOfSize:15];
        [self addSubview:_commentLabel];
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
