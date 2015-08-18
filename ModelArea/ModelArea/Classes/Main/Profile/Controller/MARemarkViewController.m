//
//  MARemarkViewController.m
//  ModelArea
//
//  Created by mac on 15/8/15.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MARemarkViewController.h"
#import "MAPlacehodelerTextView.h"

@interface MARemarkViewController ()<UITextViewDelegate>

@end

@implementation MARemarkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"备注";
    self.view.backgroundColor = kDefaultTextColor;
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(dismissVC) title:@"取消"];
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(confirmChange) title:@"确定"];
    
    MAPlacehodelerTextView *textView = [[MAPlacehodelerTextView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height/2)];
    textView.delegate = self;
    textView.alwaysBounceVertical = YES;
    textView.font = MAFONT_SIZE(15);
    textView.placeholder = @"在这里写些文字，让别人了解你吧";
    textView.textColor = kDEFAULT_BLACKCOLOR;
    [self.view addSubview:textView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - text field delegate

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    [self.view endEditing:YES];
    
}

- (void)dismissVC {
    [self.view endEditing:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)confirmChange {
    //    if (_textField.text.length < 1) {
    //        [SVProgressHUD showInfoWithStatus:@"昵称不能为空"];
    //        return ;
    //    }
    //    if (_textField.text.length > 16) {
    //        [SVProgressHUD showInfoWithStatus:@"昵称不要超过16个字符"];
    //        return ;
    //    }
    [self.view endEditing:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
