//
//  MAChangeNameViewController.m
//  ModelArea
//
//  Created by mac on 15/8/7.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MAChangeNameViewController.h"
static NSString *ID = @"Cell";

@interface MAChangeNameViewController () <UITextFieldDelegate> {
    UITextField *_textField;
}

@end

@implementation MAChangeNameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"修改昵称";
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ID];
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(dismissVC) title:@"取消"];

    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(confirmChange) title:@"确定"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
    
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(15, 0, self.view.width-30, kDEFAULT_ROWHEIGHT)];
    
    [textField becomeFirstResponder];
    
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    textField.delegate = self;
    
    //textField.backgroundColor = kDefaultColor;
    NSString *username = [[NSUserDefaults standardUserDefaults] objectForKey:@"username"];
    textField.text = username;
    
    [cell.contentView addSubview:textField];
    _textField = textField;
    
    return cell;
}

#pragma mark - text field delegate

- (void)dismissVC {
    [self.view endEditing:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)confirmChange {
    if (_textField.text.length < 1) {
        [SVProgressHUD showInfoWithStatus:@"昵称不能为空"];
        return ;
    }
    if (_textField.text.length > 16) {
        [SVProgressHUD showInfoWithStatus:@"昵称不要超过16个字符"];
        return ;
    }
    [self.view endEditing:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}



@end
