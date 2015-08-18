//
//  MAActivityCell.m
//  ModelArea
//
//  Created by mac on 15/8/13.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MAActivityCell.h"

@implementation MAActivityCell

+ (UINib *)nib {
    return [UINib nibWithNibName:@"MAActivityCell" bundle:nil];
}

+  (NSString *)reuseableIdentifier {
    return @"ActivityCell";
}

- (void)awakeFromNib {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}


@end
