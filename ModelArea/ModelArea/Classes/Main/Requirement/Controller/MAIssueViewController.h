//
//  MAIssueViewController.h
//  ModelArea
//
//  Created by 123 on 15/8/3.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//
//发布界面
#import <UIKit/UIKit.h>
#import "MASendTableViewCell.h"

#import "MASendTwoTableViewCell.h"

//#define COLOR_THEME1 ([UIColor redColor])//大红色

#define COLOR_THEME1 ([UIColor colorWithRed:26/256.0  green:168/256.0 blue:186/256.0 alpha:1])//去哪儿绿

#define COLOR_THEME ([UIColor colorWithRed:26/256.0  green:168/256.0 blue:186/256.0 alpha:1])//去哪儿绿

#import "CalendarHomeViewController.h"
#import "CalendarViewController.h"
//#import "CalendarDayModel.h"
#import "Color.h"


#import "MASendThreeTableViewCell.h"



#import "MASendView.h"
@interface MAIssueViewController : UIViewController<MASendTwoTableViewCellDelegate,MASendThreeTableViewCellDelegate,ZYCustomAlertViewDelegate>


@end
