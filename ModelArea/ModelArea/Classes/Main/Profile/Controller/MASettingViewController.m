//
//  MASettingViewController.m
//  ModelArea
//
//  Created by mac on 15/8/3.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MASettingViewController.h"
#import "MALoginViewController.h"
#import "MAAccountViewController.h"
#import "MANewMsgViewController.h"
#import "MAAboutViewController.h"
#import "MANavigationController.h"
#import "MAAccount.h"
#import "MAAccountManager.h"

static NSString *const ID = @"Cell";

@interface MASettingViewController ()

@property (strong, nonatomic) NSArray *dataList;

@end

@implementation MASettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"设置";
    self.navigationItem.rightBarButtonItem = nil;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ID];
    self.tableView.rowHeight = 50;

    
    self.dataList = @[ @[ @"帐号与安全" ],
                       @[ @"新消息通知", @"清除缓存" ],
                       @[ @"关于模界"],
                       @[ @"退出当前帐号" ] ];
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
    
    cell.textLabel.text = self.dataList[indexPath.section][indexPath.row];
    cell.textLabel.font = MAFONT_SIZE(16);
    //cell.textLabel.textColor = kDEFAULT_BLACKCOLOR;
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    if (indexPath.section == 3) {
        cell.textLabel.textColor = [UIColor redColor];
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    if (indexPath.section ==1) {
        if (indexPath.row == 1) {
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"section: %zd, row: %zd", indexPath.section, indexPath.row);
    if (indexPath.section == 0) {
        MAAccountViewController *accountVc = [[MAAccountViewController alloc] initWithStyle:UITableViewStyleGrouped];
        [self.navigationController pushViewController:accountVc animated:YES];
        return ;
    }
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            [self.navigationController pushViewController:[[MANewMsgViewController alloc] initWithStyle:UITableViewStyleGrouped] animated:YES];
        }
    }
    if (indexPath.section == 2) {
        [self.navigationController pushViewController:[[MAAboutViewController alloc] initWithStyle:UITableViewStyleGrouped] animated:YES];

    }
    if (indexPath.section == 3) {
//        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"isUserLoggedin"];
//        [[NSUserDefaults standardUserDefaults] synchronize];
        [MAAccountManager saveAccount:nil];
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        MALoginViewController *loginVC = [[MALoginViewController alloc] init];
        window.rootViewController = [[MANavigationController alloc ]initWithRootViewController:loginVC];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}

@end
