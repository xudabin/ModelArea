//
//  MARegiserThirdViewController.m
//  ModelArea
//
//  Created by mac on 15/7/28.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MARegiserThirdViewController.h"
#import "MARegisterFourthViewController.h"

@interface MARegiserThirdViewController ()<UIActionSheetDelegate, UIAlertViewDelegate> {

}

@end

@implementation MARegiserThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"个人资料(3/6)";
    
    self.tableView.allowsSelection = YES;
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
    MARegisterCell *cell = [tableView dequeueReusableCellWithIdentifier:[MARegisterCell ID] forIndexPath:indexPath];
    
    cell.textField.enabled = NO;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    cell.data = self.dataList[2];
    self.cell = cell;
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"选择类别" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"模特", @"会员", nil];
    
    [sheet showInView:self.view];
    
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"完善个人信息";
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    return @"注册后类别不可修改";
}

- (void)nextStepAction {
    if (self.cell.textField.text.length == 0) {
        [SVProgressHUD showInfoWithStatus:@"请选择类别"];
        return ;
    }
    
    //display alert 注册成功后类别不能更改
    [[[UIAlertView alloc] initWithTitle:@"提醒" message:@"注册成功后类别不能更改" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil] show];
    
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    [self.navigationController pushViewController:[[MARegisterFourthViewController alloc] init] animated:YES];
}


#pragma mark - action sheet delegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
   
    NSString *title = nil;
    if (buttonIndex == 0) {
        title = @"模特";
    } else if (buttonIndex == 1) {
        title = @"会员";
    }
    self.cell.textField.text = title;
    //self.cell.text = title;
}

@end
