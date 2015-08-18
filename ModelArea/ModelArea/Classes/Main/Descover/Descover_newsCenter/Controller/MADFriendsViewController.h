//
//  MAFriendsViewController.h
//  ModelArea
//
//  Created by mac on 15/7/28.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MDAView.h"
#import "MADFansViewController.h"
#import "MADAttentionViewController.h"
@interface MADFriendsViewController : UIViewController
@property(nonatomic,strong) MDAView *maView;
@property(nonatomic,strong)MADFansViewController *fansViewController;
@property(nonatomic,strong)MADAttentionViewController *attentionViewController;
@end
