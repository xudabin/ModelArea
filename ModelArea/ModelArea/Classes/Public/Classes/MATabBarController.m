//
//  WBTabBarController.m
//  微博
//
//  Created by jewelz on 15/4/23.
//  Copyright (c) 2015年 yangtzeu. All rights reserved.
//

#import "MATabBarController.h"
#import "MANavigationController.h"
#import "MAHomeViewController.h"
#import "MADDescoverViewController.h"
#import "MAProfileViewController.h"
#import "MARequireViewController.h"
#import "MADDynamicViewController.h"
#import "MAAActivityViewController.h"

#import "MAMainViewController.h"



@interface MATabBarController ()

@end

@implementation MATabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.tabBar.barTintColor = kDefaultColor;
    
    UIViewController *vc1 = [[MAHomeViewController alloc] init];
    UIViewController *home = [[MAMainViewController alloc] init];
    [self addChildViewController:vc1 withTitle:@"首页" image:@"tab_home" andSelectedImage:@"tab_home_s"];
    
    UIViewController *vc2 = [[MARequireViewController alloc] init];
    [self addChildViewController:vc2 withTitle:@"需求" image:@"tab_require" andSelectedImage:@"tab_require_s"];
    
    UIViewController *vc3 = [[MAAActivityViewController alloc] init];
    [self addChildViewController:vc3 withTitle:@"动态圈" image:@"tab_descorver" andSelectedImage:@"tab_descorver_s"];
    
    UIViewController *vc4 = [[MADDescoverViewController alloc] init];
    [self addChildViewController:vc4 withTitle:@"发现" image:@"tab_descorver" andSelectedImage:@"tab_descorver_s"];
    
    
    UIViewController *vc5 = [[MAProfileViewController alloc] init];
    [self addChildViewController:vc5 withTitle:@"我" image:@"tab_profile" andSelectedImage:@"tab_profile_s"];
    
    
    
}

- (void)addChildViewController:(UIViewController *)childController withTitle:(NSString *)title image:(NSString *)image andSelectedImage:(NSString *)selectedImage{
    childController.title = title;
   // childController.view.backgroundColor = [self randomColor];
    
    childController.tabBarItem.image = [UIImage imageNamed:image];
    
    //设置选择的图片 imageWithRenderingMode设置图片渲染模式 UIImageRenderingModeAlwaysOriginal：不渲染
    childController.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    NSDictionary *attributeNormal = @{NSForegroundColorAttributeName:[UIColor lightGrayColor]};
    NSDictionary *attributeSelected = @{NSForegroundColorAttributeName:kDefaultColor};
    [childController.tabBarItem setTitleTextAttributes:attributeNormal forState:UIControlStateNormal];
    [childController.tabBarItem setTitleTextAttributes:attributeSelected forState:UIControlStateSelected];
    
    
    [self addChildViewController:[[MANavigationController alloc] initWithRootViewController:childController]];
}

- (UIColor *)randomColor {
    return [UIColor colorWithRed:arc4random_uniform(255)/255.0f green:arc4random_uniform(255)/255.0f blue:arc4random_uniform(255)/255.0f alpha:1];
}


@end
