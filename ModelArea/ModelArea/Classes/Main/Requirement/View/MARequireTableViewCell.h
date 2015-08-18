//
//  MARequireTableViewCell.h
//  ModelArea
//
//  Created by 123 on 15/7/30.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MARequireTableViewCell : UITableViewCell
/*
 *timeLabels     时间
 *budgetLabel    预算
 *typeLabel      类型
 *numLabel       人数
 *remarksLabel   备注
＊photoImageView   照片
 */

@property UILabel *timeLabel,*budgetLabel,*typeLabel,*numLabel,*remarksLabel;
@property UIImageView * photoImageView ;
@end
