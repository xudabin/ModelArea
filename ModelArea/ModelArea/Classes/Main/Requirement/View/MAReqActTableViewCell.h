//
//  MAReqActTableViewCell.h
//  ModelArea
//
//  Created by 123 on 15/8/3.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MAActiveViewController;




@interface MAReqActTableViewCell : UITableViewCell
;
@property(nonatomic,assign)MAActiveViewController* delegate;

/*
 *timeLabels     时间
 *budgetLabel    预算
 *typeLabel      类型
 *numLabel       人数
 *addressLabel   地址
 *explainLabel   说明
 companyButton   大照片
 rankButton      小照片
 */

@property UILabel *timeLabel,*budgetLabel,*typeLabel,*numLabel,*addressLabel,*explainLabel;

@property UIButton * companyButton,*rankButton;









- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;



@end




@protocol MAReqActTableViewCellDelegate <NSObject>
//@protocol ZYCustomAlertViewDelegate <NSObject>

//协议方法：协议双方确定，已经确定什么情况下执行。

//此方法在点击警告框上的按钮时会执行。
- (void)customAlertView:(MAReqActTableViewCell *)customAlertView clickButtonTag:(NSInteger)buttonTag;

@end