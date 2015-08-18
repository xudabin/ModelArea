//
//  MASelectCityCell.m
//  ModelArea
//
//  Created by mac on 15/8/4.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MASelectCityCell.h"

@interface MASelectCityCell ()
@property (weak, nonatomic) IBOutlet UIButton *locationButton;

@end

@implementation MASelectCityCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
+ (UINib *)nib {
    return [UINib nibWithNibName:@"MASelectCityCell" bundle:nil];
}

+ (NSString *)reuseableIdentifier {
    return @"City";
}

- (void)setLocatedCity:(NSString *)LocatedCity {
    [self.locationButton setTitle:LocatedCity forState:UIControlStateNormal];
}

@end
