//
//  MAProfileCell.h
//  ModelArea
//
//  Created by mac on 15/7/30.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MAConfigCell.h"

@class MAModel;
@class MAUser;
@class MAButtonBroup;

@interface MAProfileCell : MAConfigCell

@property (strong, nonatomic) MAModel *model;
@property (strong, nonatomic) MAUser *user;
@property (strong, nonatomic) MAButtonBroup *buttonGroup;

+ (CGFloat)rowHeight;

@end
