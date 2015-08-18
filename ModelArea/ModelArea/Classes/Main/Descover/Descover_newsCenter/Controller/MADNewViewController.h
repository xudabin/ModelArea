//
//  MANewViewController.h
//  ModelArea
//
//  Created by mac on 15/7/26.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MDAView.h"
#import "MADFriendMessageViewController.h"
#import "MADSystemNotificationViewController.h"
@interface MADNewViewController : UIViewController
@property (nonatomic,strong)MDAView *maView;
@property(nonatomic,strong)MADFriendMessageViewController *FMViewController;
@property(nonatomic,strong)MADSystemNotificationViewController *SNViewController;
@end
