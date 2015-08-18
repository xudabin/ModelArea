//
//  MADresserCell.m
//  ModelArea
//
//  Created by mac on 15/8/15.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MADresserCell.h"

@interface MADresserCell ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UILabel *locationLabel;

@end

@implementation MADresserCell

+ (UINib *)nib {
    return [UINib nibWithNibName:@"MADresserCell" bundle:nil];
}

+ (NSString *)ID {
    return @"DresserCell";
}
- (void)awakeFromNib {
    // Initialization code
    self.nameLabel.text = @"hae wef";
}

@end
