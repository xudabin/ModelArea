//
//  MARegisterFinalViewController.m
//  ModelArea
//
//  Created by mac on 15/7/28.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MARegisterFinalViewController.h"

@interface MARegisterFinalViewController() {
    NSArray *_data;
    NSString *_pwd;
    NSString *_repeatePwd;
    UITextField *pwdTextField;
    UITextField *reqeatTextField;
}

@end

@implementation MARegisterFinalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"账户安全(6/6)";
    _data = self.dataList[4];
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(nextStepAction) title:@"完成"];
    //NSLog(@"data %@", self.dataList);
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:YES];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MARegisterCell *cell = [tableView dequeueReusableCellWithIdentifier:[MARegisterCell ID] forIndexPath:indexPath];
    if (indexPath.row == 0) {
        pwdTextField = cell.textField;
    } else {
        reqeatTextField = cell.textField;
    }
    cell.textField.secureTextEntry = YES;
    cell.data = _data[indexPath.row];
    self.cell = cell;
    
    return cell;
}

#pragma mark - Table view delegate
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"为确保账户安全，请完善密码";
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    return nil;
}

#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    return YES;
}


- (void)nextStepAction {
    [pwdTextField resignFirstResponder];
    [reqeatTextField resignFirstResponder];
    //[self.cell.textField resignFirstResponder];
    
    [self getTextFieldContent];
    
    if (_pwd.length == 0) {
        [SVProgressHUD showInfoWithStatus:@"请输入密码"];
        return ;
    }
    
    if (_repeatePwd.length == 0) {
        [SVProgressHUD showInfoWithStatus:@"请确认密码"];
        return ;
    }
    
    if (![_pwd isEqualToString:_repeatePwd]) {
        [SVProgressHUD showInfoWithStatus:@"两次密码输入不一致"];
        return ;
    }
    
    [SVProgressHUD show];
  
    dispatch_time_t when = dispatch_time(DISPATCH_TIME_NOW, 2*NSEC_PER_SEC);
  
    dispatch_after(when, dispatch_get_main_queue(), ^{
        [SVProgressHUD showSuccessWithStatus:@"注册成功"];
        [self.navigationController popToRootViewControllerAnimated:YES];

    });
    
   
    
}

- (void)getTextFieldContent {
    MARegisterCell *cell = (MARegisterCell *)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    _pwd = cell.text;
    _repeatePwd = self.cell.text;
    
    //NSLog(@"phone :%@, result code %@",_phoneNo, _resultCode);
    
    
}


@end
