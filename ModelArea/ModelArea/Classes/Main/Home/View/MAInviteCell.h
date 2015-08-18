//
//  MAInviteCell.h
//  ModelArea
//
//  Created by mac on 15/7/29.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MAConfigCell.h"
@class MAInviteCell;

@protocol MAInviteCellDelegate <NSObject>

@optional
- (void)cell:(MAInviteCell *)cell didSelectItemAtIndexPath:(NSIndexPath *)indexPath;
- (void)cell:(MAInviteCell *)cell didClickMoreButton:(UIButton *)sender;

@end

@interface MAInviteCell : MAConfigCell
@property (weak, nonatomic) IBOutlet UILabel *leftTitle;
@property (weak, nonatomic) IBOutlet UILabel *rightTitle;
@property (strong, nonatomic) NSDictionary *data;
@property (assign, nonatomic) CGFloat cornerRadius;
@property (assign, nonatomic) BOOL didHiddenTimes;
@property (assign, nonatomic) NSInteger selectedSection;
@property (assign, nonatomic) BOOL showLevel;

@property (weak, nonatomic) id<MAInviteCellDelegate> delegate;

+ (CGFloat)rowHeight;


@end
