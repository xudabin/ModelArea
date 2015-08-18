//
//  MARequireViewController.h
//  ModelArea
//
//  Created by 123 on 15/7/28.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MAIssueViewController.h"
#import "MAReqView.h"
#import "MAActiveViewController.h"
#import "MAHeader.h"
#import "MARequireTableViewCell.h"


@interface MARequireViewController : UIViewController<ZYCustomAlertViewDelegate>
@property(nonatomic)MAActiveViewController*actionViewController;

@end
