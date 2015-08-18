//
//  MARegisterTwoViewController.m
//  ModelArea
//
//  Created by mac on 15/7/28.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MARegisterSecondViewController.h"
#import "MARegiserThirdViewController.h"
#import "MADatePickerView.h"

@interface MARegisterSecondViewController ()<UIActionSheetDelegate> {
    NSArray *_data;
    NSString *_birthDay;
    NSString *_sex;
}
@property (weak, nonatomic) MADatePickerView *dataPicker;

@end

@implementation MARegisterSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"个人资料(2/6)";
    _data = self.dataList[1];
    
    self.tableView.allowsSelection = YES;
    
    //NSLog(@"data %@", self.dataList);
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
    
    cell.textField.enabled = NO;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    if (indexPath.row == 0) {
        cell.textField.text = _birthDay;
    } else {
        cell.textField.text = _sex;
    }
    
    cell.data = _data[indexPath.row];
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        if (_dataPicker) {
            return ;
        }
        MADatePickerView *dataPicker = [[MADatePickerView alloc] init];
        self.dataPicker = dataPicker;
        [self.view addSubview:_dataPicker];
        [_dataPicker confirmBtnDidSelectedWithTarget:self action:@selector(confirmBtnAction)];
        
    } else {
        UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"选择性别" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"男", @"女", nil];
        
        [sheet showInView:self.view];
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"填写信息，完善个人资料";
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    return @"注册后性别不可修改";
}

#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    return YES;
}

#pragma mark - action sheet delegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    NSString *title = nil;
    if (buttonIndex == 0) {
        title = @"男";
    } else if (buttonIndex == 1) {
        title = @"女";
    }
    MARegisterCell *cell = (MARegisterCell *)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]];
    cell.text = title;
    _sex = title;
}

- (void)confirmBtnAction {
    MARegisterCell *cell = (MARegisterCell *)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    cell.text = _dataPicker.date;
    _birthDay = cell.text;
    
    [_dataPicker dismiss];
}

- (void)nextStepAction {
    if (_birthDay.length == 0) {
        [SVProgressHUD showInfoWithStatus:@"请选择生日"];
        return ;
    }
    
    if (_sex.length == 0) {
        [SVProgressHUD showInfoWithStatus:@"请选择性别"];
        return ;
    }
    
    [self.navigationController pushViewController:[[MARegiserThirdViewController alloc] initWithStyle:UITableViewStyleGrouped] animated:YES];
    
}

@end
