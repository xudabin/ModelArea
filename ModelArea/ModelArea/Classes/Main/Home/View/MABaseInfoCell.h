//
//  MABaseInfoCell.h
//  ModelArea
//
//  Created by mac on 15/7/29.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MAConfigCell.h"

@interface MABaseInfoCell : MAConfigCell
@property (weak, nonatomic) UILabel *descLab;
@property (weak, nonatomic) UILabel *titleLab;
@property (strong, nonatomic) NSDictionary *data;

@end
