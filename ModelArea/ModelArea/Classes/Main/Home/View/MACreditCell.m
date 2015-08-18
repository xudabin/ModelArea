//
//  MARecomdCell.m
//  ModelArea
//
//  Created by mac on 15/8/3.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MACreditCell.h"

static const CGFloat Spacing_left = 15;
static const CGFloat Title_width = 70;
static const CGFloat Title_height = 43;

@interface MACreditCell ()

@property (weak, nonatomic) UIImageView *image;

@end

@implementation MACreditCell

+ (instancetype)cellWithTableview:(UITableView *)tableView forIndexPath:(NSIndexPath *)indexPath {
    
    MACreditCell *cell = [tableView dequeueReusableCellWithIdentifier:[MACreditCell reuseableIdentifier] forIndexPath:indexPath];
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self =  [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        UILabel *titleLab = [[UILabel alloc] initWithFrame:CGRectZero];
        titleLab.textColor = MAColor(117, 118, 118, 1);
        titleLab.font = MAFONT_SIZE(15);
        [self.contentView addSubview:titleLab];
        self.titleLab = titleLab;
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    
        [self.contentView addSubview:imageView];
        self.image = imageView;
    }
    return self;
}

- (void)setIcon:(UIImage *)icon {
    _icon = icon;
    self.image.image = icon;
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.titleLab.frame = CGRectMake(Spacing_left, 0, Title_width, Title_height);
    //self.image.frame = CGRectMake(CGRectGetMaxX(self.titleLab.frame)+Spacing_left, 0, self.width-CGRectGetMaxX(self.titleLab.frame)-2*Spacing_left, Title_height);
    self.image.frame = CGRectMake(CGRectGetMaxX(self.titleLab.frame)+Spacing_left, CGRectGetMidY(self.titleLab.frame)-self.icon.size.height*0.5, self.icon.size.width, self.icon.size.height);

}

+ (NSString *)reuseableIdentifier {
    return @"CreditCell";
}

@end
