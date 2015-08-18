//
//  MALeaveMessageTableViewCell.h
//  ModelArea
//
//  Created by 123 on 15/8/4.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MAActiveViewController;
@interface MALeaveMessageTableViewCell : UITableViewCell
@property(nonatomic,assign)MAActiveViewController* delegate;
@property UIButton * photoButton1;
@property UILabel * nameLabel,*explainLabel;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;

@end


@protocol MALeaveMessageTableViewCellDelegate <NSObject>
//协议方法：协议双方确定，已经确定什么情况下执行。

//此方法在点击警告框上的按钮时会执行。
- (void)customLeaveMessageView:(MALeaveMessageTableViewCell *)customView clickButtonTag:(NSInteger)buttonTag;

@end