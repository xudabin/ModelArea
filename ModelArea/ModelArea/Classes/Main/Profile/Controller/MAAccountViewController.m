//
//  MAAccountViewController.m
//  ModelArea
//
//  Created by mac on 15/8/5.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MAAccountViewController.h"
#import "MAChangePwdViewController.h"
#import "MAChangePhoneViewController.h"

static NSString *ID = @"Cell";

@interface MAAccountViewController ()<UIAlertViewDelegate>

@end

@implementation MAAccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"帐号与安全";
    
    self.navigationItem.rightBarButtonItem = nil;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ID];
    
    self.dataList = @[ @[ @{ @"title":@"模界号", @"desc":@"3465907" },
                          @{ @"title":@"手机号", @"desc":@"13856789096" }
                        ],
                       @[ @{@"title": @"修改密码"} ]
                    ];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return self.dataList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *array = self.dataList[section];
    return array.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
    
    cell.textLabel.text = self.dataList[indexPath.section][indexPath.row][@"title"];
    cell.textLabel.font = MAFONT_SIZE(16);
   // cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    if (indexPath.section == 0) {
        UILabel *descLab = [[UILabel alloc]  initWithFrame:CGRectMake(self.view.width-120-40, 0, 120, 44)];
        descLab.text = self.dataList[indexPath.section][indexPath.row][@"desc"];
        descLab.textAlignment = NSTextAlignmentRight;
        descLab.textColor = kDEFAULT_GRAYCOLOR;
        [cell.contentView addSubview:descLab];
        if (indexPath.row == 0) {
            cell.selectionStyle = UITableViewCellSeparatorStyleNone;
        }
        if (indexPath.row == 1) {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }

    } else {
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        cell.selectionStyle = UITableViewCellSeparatorStyleNone;
    }
   
    
    
    return cell;
}

#pragma mark - table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        if (indexPath.row == 1) {
            MAChangePhoneViewController *phoneVc = [[MAChangePhoneViewController alloc] init];
            [self.navigationController pushViewController:phoneVc animated:YES];
        }
    }
    if (indexPath.section == 1) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"验证原密码" message:@"为保障你的帐户安全，请确认密码" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        alert.alertViewStyle = UIAlertViewStyleSecureTextInput;
        [alert show];
    }
}

#pragma mark - alert view delegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 1) {
        NSString *input = [alertView textFieldAtIndex:0].text;
        NSString *pwd = [[NSUserDefaults standardUserDefaults] objectForKey:@"userpwd"];
        
        if ([input isEqualToString:pwd]) {
            [self.navigationController pushViewController:[[MAChangePwdViewController alloc] initWithStyle:UITableViewStyleGrouped] animated:YES];
            return;
        }
        NSLog(@"pwd: %@, input: %@", pwd, input);
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"密码错误，如果丢失密码，请先找回密码" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
    
        [alert show];
    }
}


@end
