//
//  MAPickImageCell.h
//  ModelArea
//
//  Created by mac on 15/8/12.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MAConfigCell.h"

@class MAPickImageCell;

@protocol MAPickImageCellDelegate <NSObject>

- (void)pickImageCellDidClickButton:(MAPickImageCell *)cell;

@end

@interface MAPickImageCell : MAConfigCell

@property (nonatomic, weak) id<MAPickImageCellDelegate> delegate;

//- (void)addTarget:(id)target action:(SEL)action;

@end
