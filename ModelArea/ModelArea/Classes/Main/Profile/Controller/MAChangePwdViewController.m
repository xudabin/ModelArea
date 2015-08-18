//
//  MAChangePwdViewController.m
//  ModelArea
//
//  Created by mac on 15/8/6.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MAChangePwdViewController.h"
#import "MABaseInfoCell.h"

static NSString *ID = @"Cell";
@interface MAChangePwdViewController ()<UITextFieldDelegate> {

    UITextField *_repeatPwdField;
    UITextField *_pwdField;
}

@end

@implementation MAChangePwdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"修改密码";
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(changePwd) title:@"完成"];
    self.navigationItem.rightBarButtonItem.enabled = NO;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ID];
    [self.tableView registerClass:[MABaseInfoCell class] forCellReuseIdentifier:[MABaseInfoCell reuseableIdentifier]];
    
    NSString *username = [[NSUserDefaults standardUserDefaults] objectForKey:@"username"];
    self.dataList = @[ @{ @"title":@"用户名", @"desc":username },
                       @{ @"title":@"密码" , @"desc":@"请设置密码"},
                       @{ @"title":@"确认密码", @"desc":@"请再次输入密码" } ];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.dataList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSDictionary *dict = self.dataList[indexPath.row];
    if (indexPath.row == 0) {
        MABaseInfoCell *cell = [MABaseInfoCell cellWithTableview:tableView forIndexPath:indexPath];
        cell.titleLab.text = dict[@"title"];
        cell.descLab.text = dict[@"desc"];
        cell.descLab.textColor = kDEFAULT_GRAYCOLOR;
        return cell;
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = dict[@"title"];
    cell.textLabel.font = MAFONT_SIZE(15);
   
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(100, 0, self.view.width-120, 44)];
    
    if (indexPath.row == 1) {
        [textField becomeFirstResponder];
        _pwdField = textField;
    }
    else {
        _repeatPwdField = textField;
    }
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    textField.delegate = self;
    //textField.backgroundColor = kDefaultColor;
    textField.placeholder = dict[@"desc"];
    textField.secureTextEntry = YES;

    [cell.contentView addSubview:textField];
    

    
    return cell;
}

#pragma mark - Table view delegate

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"设置密码后，你可以用用户名或手机号+密码登录";
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    if (textField.text.length > 0) {
        self.navigationItem.rightBarButtonItem.enabled = YES;
    }
}

- (void)changePwd {
    NSString *pwd = _pwdField.text;
    NSString *repeatPwd = _repeatPwdField.text;
    
    if (![pwd isEqualToString:repeatPwd]) {
        [SVProgressHUD showInfoWithStatus:@"两次密码输入不一致"];
        self.navigationItem.rightBarButtonItem.enabled = NO;
        return ;
    }
    
    [SVProgressHUD showSuccessWithStatus:@"密码设置成功"];
    dispatch_time_t when = dispatch_time(DISPATCH_TIME_NOW, 2*NSEC_PER_SEC);
    
    dispatch_after(when, dispatch_get_main_queue(), ^{
        [self.navigationController popViewControllerAnimated:YES];
    });
    
}

@end
