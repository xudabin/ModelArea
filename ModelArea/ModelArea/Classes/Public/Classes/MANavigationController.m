//
//  WBNavigationController.m
//  微博
//
//  Created by jewelz on 15/4/23.
//  Copyright (c) 2015年 yangtzeu. All rights reserved.
//

#import "MANavigationController.h"

@interface MANavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation MANavigationController

+ (void)initialize {
    //设置title颜色
    NSDictionary *titleAttribute = @{NSForegroundColorAttributeName:kDefaultTextColor, NSFontAttributeName:[UIFont boldSystemFontOfSize:17]};
    [[UINavigationBar appearance] setTitleTextAttributes:titleAttribute];
    
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    //设置正常状态
    NSDictionary *attribute = @{NSForegroundColorAttributeName:kDefaultTextColor, NSFontAttributeName:[UIFont systemFontOfSize:16]};
    [item setTitleTextAttributes:attribute forState:UIControlStateNormal];
    [item setTitleTextAttributes:attribute forState:UIControlStateHighlighted];
    
    //设置不可用状态
    NSDictionary *disAttribute = @{NSForegroundColorAttributeName:[UIColor lightGrayColor], NSFontAttributeName:[UIFont systemFontOfSize:14]};
    [item setTitleTextAttributes:disAttribute forState:UIControlStateDisabled];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置滑动手势代理
    self.interactivePopGestureRecognizer.delegate = self;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem leftItemWithTarget:self action:@selector(back) image:@"nav_back" highLighted:@"nav_back"];
        
//        viewController.navigationItem.rightBarButtonItem = [UIBarButtonItem rightItemWithTarget:self action:@selector(more) image:@"nav_share" highLighted:@"nav_share"];
        
    }
    [super pushViewController:viewController animated:YES];
}

- (void)back {
    [self popViewControllerAnimated:YES];
}

- (void)more {
    [self popToRootViewControllerAnimated:YES];
}

#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    if (self.navigationController.viewControllers.count == 1) { //关闭右滑手势
        return NO;
    }
    NSLog(@"gesture");
    return YES;
}


@end
