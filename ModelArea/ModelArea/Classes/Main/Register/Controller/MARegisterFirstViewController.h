//
//  MARegisterOneViewController.h
//  ModelArea
//
//  Created by mac on 15/7/28.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MARegisterCell.h"

@interface MARegisterFirstViewController : UITableViewController <UIGestureRecognizerDelegate>

@property (strong, nonatomic) NSArray *dataList;
@property (weak, nonatomic) MARegisterCell *cell;

- (void)nextStepAction;


@end
