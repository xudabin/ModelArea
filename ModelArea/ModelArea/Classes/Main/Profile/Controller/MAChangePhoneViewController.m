//
//  MAChangePhoneViewController.m
//  ModelArea
//
//  Created by mac on 15/8/6.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MAChangePhoneViewController.h"

static const CGFloat Margin = 30;
static const CGFloat Spacing = 10;
static const CGFloat ButtonHeight = 44;

@interface MAChangePhoneViewController ()

@property (nonatomic, strong) UILabel *phoneLab;

@end

@implementation MAChangePhoneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"绑定手机";
    self.view.backgroundColor = kTABLEVIEW_BACKGROUND;
    self.navigationItem.rightBarButtonItem = nil;
    
    [self setupContent];
    
}

- (void)setupContent {
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"setting_phone_image"]];
    imageView.center = CGPointMake(self.view.center.x, self.view.center.y-70);
    [self.view addSubview:imageView];
    
    self.phoneLab = [[UILabel alloc] init];
    self.phoneLab.frame = CGRectMake(0, 0, 200, 30);
    self.phoneLab.center = CGPointMake(self.view.center.x, CGRectGetMaxY(imageView.frame)+self.phoneLab.height);
    self.phoneLab.text = @"你的手机号: 13468985675";
    self.phoneLab.font = [UIFont boldSystemFontOfSize:17];
    self.phoneLab.textAlignment = NSTextAlignmentCenter;
    //self.phoneLab.backgroundColor = kDefaultColor;
    [self.view addSubview:self.phoneLab];

    
//    UILabel *textLabel = [[UILabel alloc] init];
//    textLabel.frame = CGRectMake(0, 0, 100, 30);
//    textLabel.center = CGPointMake(self.view.center.x, CGRectGetMaxY(imageView.frame)+textLabel.height);
//    textLabel.text = @"我的零钱";
//    textLabel.textColor = kDEFAULT_GRAYCOLOR;
//    textLabel.textAlignment = NSTextAlignmentCenter;
//    [self.view addSubview:textLabel];
//    
    
    UIButton *changeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    changeButton.frame = CGRectMake(Margin, CGRectGetMaxY(self.phoneLab.frame)+Spacing*3, self.view.width-2*Margin, ButtonHeight);
    [changeButton setTitle:@"更换手机号" forState:UIControlStateNormal];
    [changeButton setTitleColor:kBLACKCOLOR forState:UIControlStateNormal];
    //[changeButton setBackgroundColor:[UIColor greenColor]];
    [changeButton setBackgroundImage:[UIImage imageNamed:@"profile_cash_button"] forState:UIControlStateNormal];
    [changeButton setBackgroundImage:[UIImage imageNamed:@"profile_cash_button_h"] forState:UIControlStateHighlighted];
    [self.view addSubview:changeButton];
    
//    UIButton *cashButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    cashButton.frame = CGRectMake(Margin, CGRectGetMaxY(topUpButton.frame)+Spacing, self.view.width-2*Margin, ButtonHeight);
//    [cashButton setTitle:@"提现" forState:UIControlStateNormal];
//    [cashButton setTitleColor:kBLACKCOLOR forState:UIControlStateNormal];
//    [cashButton setBackgroundImage:[UIImage imageNamed:@"profile_cash_button"] forState:UIControlStateNormal];
//    [cashButton setBackgroundImage:[UIImage imageNamed:@"profile_cash_button_h"] forState:UIControlStateHighlighted];
//    [self.view addSubview:cashButton];
    
    
    
}

@end
