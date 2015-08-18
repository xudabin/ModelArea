//
//  MAwalletViewController.m
//  ModelArea
//
//  Created by mac on 15/8/6.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MACashViewController.h"

static const CGFloat Margin = 30;
static const CGFloat Spacing = 10;
static const CGFloat ButtonHeight = 44;

@interface MACashViewController ()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *moneyLabel;

@end

@implementation MACashViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"我的零钱";
    self.view.backgroundColor = kTABLEVIEW_BACKGROUND;
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:nil title:@"账单"];
    
    [self setupContent];

}

- (void)setupContent {
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"profile_wallet"]];
    imageView.center = CGPointMake(self.view.center.x, self.view.center.y-70);
    [self.view addSubview:imageView];
    
    UILabel *textLabel = [[UILabel alloc] init];
    textLabel.frame = CGRectMake(0, 0, 100, 30);
    textLabel.center = CGPointMake(self.view.center.x, CGRectGetMaxY(imageView.frame)+textLabel.height);
    textLabel.text = @"我的零钱";
    textLabel.textColor = kDEFAULT_GRAYCOLOR;
    textLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:textLabel];
    
    self.moneyLabel = [[UILabel alloc] init];
    self.moneyLabel.frame = CGRectMake(0, 0, 150, 40);
    self.moneyLabel.center = CGPointMake(self.view.center.x, CGRectGetMaxY(textLabel.frame)+self.moneyLabel.height/2);
    self.moneyLabel.text = @"￥98.37";
    self.moneyLabel.font = [UIFont boldSystemFontOfSize:30];
    self.moneyLabel.textAlignment = NSTextAlignmentCenter;
    //self.moneyLabel.backgroundColor = kDefaultColor;
    [self.view addSubview:self.moneyLabel];
    
    UIButton *topUpButton = [UIButton buttonWithType:UIButtonTypeCustom];
    topUpButton.frame = CGRectMake(Margin, CGRectGetMaxY(self.moneyLabel.frame)+Spacing, self.view.width-2*Margin, ButtonHeight);
    [topUpButton setTitle:@"充值" forState:UIControlStateNormal];
    [topUpButton setTitleColor:kBLACKCOLOR forState:UIControlStateNormal];
    [topUpButton setBackgroundImage:[UIImage imageNamed:@"profile_cash_button"] forState:UIControlStateNormal];
    [topUpButton setBackgroundImage:[UIImage imageNamed:@"profile_cash_button_h"] forState:UIControlStateHighlighted];
    [self.view addSubview:topUpButton];
    
    UIButton *cashButton = [UIButton buttonWithType:UIButtonTypeCustom];
    cashButton.frame = CGRectMake(Margin, CGRectGetMaxY(topUpButton.frame)+Spacing, self.view.width-2*Margin, ButtonHeight);
    [cashButton setTitle:@"提现" forState:UIControlStateNormal];
    [cashButton setTitleColor:kBLACKCOLOR forState:UIControlStateNormal];
    [cashButton setBackgroundImage:[UIImage imageNamed:@"profile_cash_button"] forState:UIControlStateNormal];
    [cashButton setBackgroundImage:[UIImage imageNamed:@"profile_cash_button_h"] forState:UIControlStateHighlighted];
    [self.view addSubview:cashButton];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
