//
//  MAModelCellCollectionViewCell.h
//  ModelArea
//
//  Created by mac on 15/7/25.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import <UIKit/UIKit.h>
static const CGFloat MAModelCellHeight = 180;

@class MAModel;

@interface MAModelCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *address;

@property (strong, nonatomic) MAModel *model;


+ (UINib *)nib;
+ (NSString *)ID;
@end
