//
//  MASendThreeTableViewCell.h
//  ModelArea
//
//  Created by 123 on 15/8/6.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MAIssueViewController;
@interface MASendThreeTableViewCell : UITableViewCell
@property(nonatomic,assign)MAIssueViewController* delegate;
@property UIButton * myphotoButton;



@property UILabel * nameLabel,*explainLabel;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;



@end


@protocol MASendThreeTableViewCellDelegate <NSObject>
//协议方法：协议双方确定，已经确定什么情况下执行。

//此方法在点击警告框上的按钮时会执行。
- (void)sendThreeTableView:(MASendThreeTableViewCell *)customView clickButtonTag:(NSInteger)buttonTag;

@end