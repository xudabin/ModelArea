//
//  MAExplanationViewController.m
//  ModelArea
//
//  Created by mac on 15/8/5.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MAExplanationViewController.h"

static const CGFloat Margin = 15;

@interface MAExplanationViewController ()

@end

@implementation MAExplanationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.rightBarButtonItem = nil;
    self.view.backgroundColor = kTABLEVIEW_BACKGROUND;
    [self contentView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)contentView {
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(Margin, Margin+NavBarHeight, 100, 22)];
    title.text = @"等级说明";
    title.font = [UIFont boldSystemFontOfSize:15];
    [self.view addSubview:title];
    
    UILabel *content = [[UILabel alloc] initWithFrame:CGRectMake(Margin, CGRectGetMaxY(title.frame)+Margin, self.view.width-2*Margin, self.view.height-CGRectGetMaxY(title.frame)-Margin)];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"explain" ofType:@"plist"];
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:path];
    content.text = dict[@"content"];

    content.font = MAFONT_SIZE(14);
    content.numberOfLines = 0;
    //content.backgroundColor = kDefaultColor;
    [self.view addSubview:content];
    
}

@end
