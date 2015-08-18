//
//  MAPhotographerCell.h
//  ModelArea
//
//  Created by mac on 15/8/15.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import <UIKit/UIKit.h>

static const CGFloat MAPhotographerCellHeight = 140;

@interface MAPhotographerCell : UICollectionViewCell

@property (weak, nonatomic) UIImageView *separator;

+ (UINib *)nib;
+ (NSString *)ID;
@end
