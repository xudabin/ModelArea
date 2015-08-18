//
//  MAVIPCell.m
//  ModelArea
//
//  Created by mac on 15/8/6.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MAVIPCell.h"

@implementation MAVIPCell

+ (UINib *)nib {
    return [UINib nibWithNibName:@"MAVIPCell" bundle:nil];
}

+ (NSString *)reuseableIdentifier {
    return @"VIPCell";
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
