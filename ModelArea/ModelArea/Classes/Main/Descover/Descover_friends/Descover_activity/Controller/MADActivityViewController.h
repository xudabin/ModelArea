//
//  MAActivityViewController.h
//  ModelArea
//
//  Created by mac on 15/8/6.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MDAView.h"
#import "MADSignUpViewController.h"
#import "MADInitiateViewController.h"
@interface MADActivityViewController : UIViewController
@property (nonatomic,strong)MDAView *maView;
@property(nonatomic,strong)MADSignUpViewController *SUViewController;
@property(nonatomic,strong)MADInitiateViewController *InViewController;
@end
