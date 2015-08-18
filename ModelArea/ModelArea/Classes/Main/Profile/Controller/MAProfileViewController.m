//
//  MAMyselfViewController.m
//  ModelArea
//
//  Created by 123 on 15/7/27.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MAProfileViewController.h"
#import "MASettingViewController.h"
#import "MAEditInfoViewController.h"
#import "MAScheduleViewController.h"
#import "MAActivityViewController.h"
#import "MAExplanationViewController.h"
#import "MAWalletViewController.h"
#import "MACashViewController.h"
#import "MAVIPcenterViewController.h"
#import "MAProfileCell.h"
#import "MAOtherCell.h"
#import "MAModel.h"
#import "MAAccount.h"
#import "MAAccountManager.h"
#import "MANetworkingAPI.h"
#import "MAUserReformer.h"
#import "MAUser.h"
#import "DocumentTool.h"
#import "AppDelegate.h"


@interface MAProfileViewController ()<UITableViewDataSource,UITableViewDelegate, MANetworkingAPIDelegate>
{
    NSMutableArray*_kArray;
}
@property (weak, nonatomic) UITableView *tableView;
@property (strong, nonatomic) MAUser *user;
@property (strong, nonatomic) MAUserReformer *userReformer;

@end

@implementation MAProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor=[UIColor lightGrayColor];
    
    self.navigationItem.rightBarButtonItem=[UIBarButtonItem rightItemWithTarget:self action:@selector(settingButtonAction) image:@"setting_icon" highLighted:@"setting_icon"];
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    self.tableView = tableView;
    
    [self.tableView registerClass:[MAOtherCell class] forCellReuseIdentifier:[MAOtherCell reuseableIdentifier]];
    [self.tableView registerClass:[MAProfileCell class] forCellReuseIdentifier:[MAProfileCell reuseableIdentifier]];
    
    _kArray=[[NSMutableArray alloc]initWithObjects:@"相册",@"档期",@"钱包",@"VIP中心",@"等级说明" ,nil];
    
    self.userReformer = [[MAUserReformer alloc] init];
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    
    AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
    if (app.isNetworkReachable) {
        [self startRequest];
    }
    else {
        [SVProgressHUD showInfoWithStatus:@"网络连接不太顺畅，请查看网络状态"];
        NSDictionary *dict = [DocumentTool openContentsOfFileWithFileName:@"user"];
        self.user = [MAUser objectWithKeyValues:dict];
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
        [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    }
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:YES];
    
    //保存数据到沙盒
    NSMutableDictionary *dict = self.user.keyValues;
    
    [DocumentTool write:dict ToFileWithFileName:@"user"];
}

- (void)startRequest {

    MAAccount *account = [MAAccountManager account];
    MANetworkingAPI *api = [MANetworkingAPI netWorking];
    api.delegate  = self;
    
    NSString *url = [NSString stringWithFormat:@"HomeMeServlet?userid=%zd", [account.userid intValue]];
    [api startRequestWithGET:url parameters:nil];

}

#pragma mark - MANetworkingAPIDelegate

- (void)networkingAPI:(MANetworkingAPI *)networkingAPI didSuccessWithResponseObject:(id)responseObject {
    self.user = [networkingAPI fetchDataWithReformer:self.userReformer];
    [self.tableView reloadData];
    //MAModel *model = [MAModel objectWithKeyValues:responseObject];
    //self.model = model;
  // MAUser *user = [networkingAPI fetchDataWithReformer:self.userReformer];
}

- (void)networkingAPI:(MANetworkingAPI *)networkingAPI didFailWithErrorMsg:(NSString *)errorMsg {
    //NSLog(@"error: %@", errorMsg);
    NSDictionary *dict = [DocumentTool openContentsOfFileWithFileName:@"user"];
    self.user = [MAUser objectWithKeyValues:dict];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
}

#pragma mark - table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section==0)
    {
        return 1;
    }
    return _kArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0)
    {
        MAProfileCell *cell = [tableView dequeueReusableCellWithIdentifier:[MAProfileCell reuseableIdentifier] forIndexPath:indexPath];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        //cell.selectionStyle = UITableViewCellSelectionStyleGray;
        //cell.model = self.model;
        cell.user = self.user;
        return cell;

    }
    
    else {
        MAOtherCell *cell=[tableView dequeueReusableCellWithIdentifier:[MAOtherCell reuseableIdentifier] forIndexPath:indexPath];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.titeLabel.text=_kArray[indexPath.row];
        NSString*str=[NSString stringWithFormat:@"profile_icon_%zd",indexPath.row];
        cell.iconImageView.image=[UIImage imageNamed:str];
    
        return cell;
    }
}

#pragma mark - table view delegate

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        return [MAProfileCell rowHeight];
    }
    
    return kDEFAULT_ROWHEIGHT;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        MAEditInfoViewController *editInfoVC = [[MAEditInfoViewController alloc] initWithStyle:UITableViewStyleGrouped];
        [self.navigationController pushViewController:editInfoVC animated:YES];
    }
    
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            MAActivityViewController *activityVc = [[MAActivityViewController alloc] init];
            activityVc.title = @"相册";
            [self.navigationController pushViewController:activityVc animated:YES];
        }
        if (indexPath.row == 1) {
            MAScheduleViewController *scheduleVc = [[MAScheduleViewController alloc] init];
            [self.navigationController pushViewController:scheduleVc animated:YES];
        }
        if (indexPath.row == 2) {
            [self.navigationController pushViewController:[[MAWalletViewController alloc] initWithStyle:UITableViewStyleGrouped] animated:YES];
        }
        if (indexPath.row == 3) {
            [self.navigationController pushViewController:[[MAVIPcenterViewController alloc] initWithStyle:UITableViewStyleGrouped] animated:YES];
        }
        if (indexPath.row == 4) {
            [self.navigationController pushViewController:[[MAExplanationViewController alloc] init] animated:YES];
        }

    }
    
   // 取消选中状态
    [self.tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];
}

- (void)settingButtonAction {
    [self.navigationController pushViewController:[[MASettingViewController alloc] initWithStyle:UITableViewStyleGrouped] animated:YES];
}



@end
