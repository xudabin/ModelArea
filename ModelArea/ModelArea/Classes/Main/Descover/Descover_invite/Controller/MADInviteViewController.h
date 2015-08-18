//
//  MAInviteViewController.h
//  ModelArea
//
//  Created by mac on 15/8/6.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MDAView.h"
#import "MADRecviceViewController.h"
#import "MADSendViewController.h"
@interface MADInviteViewController : UIViewController
@property (nonatomic,strong)MDAView *maView;
@property (nonatomic, strong)MADRecviceViewController *reViewController;
@property (nonatomic ,strong)MADSendViewController *sendViewController;
@end
