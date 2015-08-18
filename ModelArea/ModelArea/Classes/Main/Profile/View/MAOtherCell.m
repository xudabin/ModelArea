//
//  MAEitherTableViewCell.m
//  ModelArea
//
//  Created by 123 on 15/7/27.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MAOtherCell.h"

static const CGFloat Spacing = 15;
static const CGFloat Icon_WH = 25;
static const CGFloat Title_W = 100;


@implementation MAOtherCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleGray;
        
        UIImageView *aphotoImage=[[UIImageView alloc]initWithFrame:CGRectZero];
        [self.contentView addSubview:aphotoImage];
        self.iconImageView = aphotoImage;
        
        UILabel *aLabel=[[UILabel alloc]initWithFrame:CGRectZero];
        aLabel.font = MAFONT_SIZE(16);
       // aLabel.textColor = kDEFAULT_BLACKCOLOR;
        [self.contentView addSubview:aLabel];
        self.titeLabel = aLabel;
        
        UILabel *otherLabel=[[UILabel alloc]initWithFrame:CGRectZero];
        
        otherLabel.font = MAFONT_SIZE(16);
        otherLabel.textColor = kDEFAULT_BLACKCOLOR;
        [self.contentView addSubview:otherLabel];
        self.otherLabel = otherLabel;
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.iconImageView.frame = CGRectMake(Spacing*kSCREEN_SCALE, (self.height-Icon_WH)*0.5, Icon_WH, Icon_WH);
    
    self.titeLabel.frame = CGRectMake(CGRectGetMaxX(self.iconImageView.frame)+Spacing, 0, Title_W, self.height);
    
    self.otherLabel.frame = CGRectMake(CGRectGetMaxX(self.frame)-Spacing-Title_W, 0, Title_W, self.height);
}



+ (NSString *)reuseableIdentifier {
    return @"OtherCell";
}
@end
