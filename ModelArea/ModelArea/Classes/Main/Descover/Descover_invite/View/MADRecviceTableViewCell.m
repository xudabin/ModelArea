

//
//  MARecviceTableViewCell.m
//  ModelArea
//
//  Created by mac on 15/8/6.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MADRecviceTableViewCell.h"

@implementation MADRecviceTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self =[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _imageButton =[[UIButton alloc]initWithFrame:CGRectMake(20, 10, 120/2, 120/2)];
        [self addSubview:_imageButton];
        _whoInviteLbel =[[UILabel alloc]initWithFrame:CGRectMake(100, 10, kScreenWidth-180, 30)];
        _whoInviteLbel.font =[UIFont systemFontOfSize:15];
       _whoInviteLbel.textAlignment =NSTextAlignmentCenter;
        [self addSubview:_whoInviteLbel];
        _commentLabel =[[UILabel alloc]initWithFrame:CGRectMake(100, 40, 50, 30)];
        [self addSubview:_commentLabel];
       
        
        for (int i=0; i<5; i++) {
            _StarImageView =[[UIImageView alloc]init];
            _StarImageView.frame =CGRectMake(160+(32/2+10)*i, 50, 32/2, 31/2);
            _StarImageView.image =[UIImage imageNamed:@"star"];
            [self addSubview:_StarImageView];
            
        }
        

    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
