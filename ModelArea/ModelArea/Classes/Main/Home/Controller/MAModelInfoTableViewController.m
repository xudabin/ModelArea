//
//  MAModelInfoTableViewController.m
//  ModelArea
//
//  Created by mac on 15/7/25.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MAModelInfoTableViewController.h"
#import "MAActivityViewController.h"
#import "MAInviteListViewController.h"
#import "MAInviteViewController.h"
#import "MADFriendsViewController.h"
#import "MAChattingViewController.h"
#import "MAButtonBroup.h"
#import "MAInfoHeaderView.h"
#import "MABaseInfoCell.h"
#import "MAInviteCell.h"
#import "MAToolBar.h"
#import "MACreditCell.h"
#import "MAProfileCell.h"
#import "MAModel.h"
#import "UIScrollView+EmptyDataSet.h"
#import "AppDelegate.h"
#import "MAMaskView.h"
#import "MANetworkingAPI.h"
#import <ShareSDK/ShareSDK.h>


static NSString *identifier = @"Cell";

@interface MAModelInfoTableViewController () <UITableViewDataSource, UITableViewDelegate, MAInviteCellDelegate, MAButtonBroupDelegate, MANetworkingAPIDelegate> {
    BOOL _open;
}
@property (strong, nonatomic) NSArray *dataList;
@property (strong, nonatomic) MAToolBar *toorBar;
@property (strong, nonatomic) UITableView *tableView;
@property (weak, nonatomic) MAButtonBroup *buttonGroup;
@property (nonatomic, weak) MAMaskView *maskView;
@end

@implementation MAModelInfoTableViewController

#pragma mark - view lifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem rightItemWithTarget:self action:@selector(share) image:@"nav_share" highLighted:@"nav_share"];

    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    
    self.title = self.model.name;
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-BAR_HEIGHT) style:UITableViewStyleGrouped];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
 
    [self.tableView registerClass:[MABaseInfoCell class] forCellReuseIdentifier:[MABaseInfoCell reuseableIdentifier]];
    [self.tableView registerClass:[MACreditCell class] forCellReuseIdentifier:[MACreditCell reuseableIdentifier]];
    [self.tableView registerNib:[MAInviteCell nib] forCellReuseIdentifier:[MAInviteCell reuseableIdentifier]];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:identifier];
    [self.tableView registerClass:[MAProfileCell class] forCellReuseIdentifier:[MAProfileCell reuseableIdentifier]];
    
    [self.view addSubview:self.tableView];
    
    //添加toolbar
    _toorBar = [MAToolBar toolBar];
    [self.view insertSubview:_toorBar aboveSubview:self.tableView.superview];
    [_toorBar.leftButton addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    [_toorBar.rightButton addTarget:self action:@selector(presentChatting) forControlEvents:UIControlEventTouchUpInside];
    
    MAMaskView *maskView = [[MAMaskView alloc] initWithMaskType:MAMaskViewTpyeActivityIndicatorView];
   // [self.view addSubview:maskView];
    [maskView addRefreshingTarget:self action:@selector(startRequest)];
    self.maskView = maskView;
    
    if (!delegate.isNetworkReachable) {
        
        self.maskView.maskViewTpye = MAMaskViewTpyeImageView;
        return ;
    }
    
}

- (void)startRequest {
    MANetworkingAPI *api = [MANetworkingAPI netWorking];
    api.delegate  = self;
    
    NSString *url = [NSString stringWithFormat:@"HomeMeServlet?userid=%zd", 1];
    [api startRequestWithGET:url parameters:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
   
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:YES];
   // [self.toorBar removeFromSuperview];
}

#pragma mark - MANetworkingAPIDelegate

- (void)networkingAPI:(MANetworkingAPI *)networkingAPI didSuccessWithResponseObject:(id)responseObject {
    
   // NSLog(@"response: %@", responseObject);
    if (responseObject) {
        [self.maskView stopAnimating];
        [self.maskView removeFromSuperview];
    }
}

- (void)networkingAPI:(MANetworkingAPI *)networkingAPI didFailWithErrorMsg:(NSString *)errorMsg {
    //NSLog(@"error: %@", errorMsg);
    [self.maskView stopAnimating];
    self.maskView.maskViewTpye = MAMaskViewTpyeImageView;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if (section == 0) {
        return 0;
    }
    
    if (section == 1) {
        return 5;
    }
//    if (section == 2) {
//        return 3;
//    }
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 1) {
        if (indexPath.row == 4) {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
            cell.textLabel.text = @"查看档期";
            cell.textLabel.font = MAFONT_SIZE(14);
            cell.textLabel.textColor = kDEFAULT_BLUECOLOR;
            cell.textLabel.textAlignment = NSTextAlignmentCenter;
            return cell;
        }
        MABaseInfoCell *infocell = [MABaseInfoCell cellWithTableview:tableView forIndexPath:indexPath];
        infocell.data = self.dataList[0][indexPath.row];
        if (indexPath.row == 2) {
            infocell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            infocell.selectionStyle = UITableViewCellSelectionStyleGray;
            infocell.descLab.textColor = kDefaultColor;
        }
        if (indexPath.row == 3) {
            infocell.descLab.font = MAFONT_SIZE(13);
        }
        
        
        return infocell;
    }
    
//    if (indexPath.section == 2 ) {
//        if (indexPath.row == 0) {
//            MACreditCell *creditcell = [MACreditCell cellWithTableview:tableView forIndexPath:indexPath];
//            creditcell.titleLab.text = @"信用要求";
//            creditcell.icon = [UIImage imageNamed:@"creditline_icon"];
//            return creditcell;
//        }
//        
//        MABaseInfoCell *infocell = [MABaseInfoCell cellWithTableview:tableView forIndexPath:indexPath];
//        if (indexPath.row == 1) {
//            infocell.titleLab.text = @"拍摄人数";
//            infocell.descLab.text = @"少于5人";
//        }
//        
//        if (indexPath.row == 2) {
//            
//            infocell.titleLab.text = @"备  注";
//            infocell.descLab.text = @"时间自由。可接私房，街拍，文艺，小清新，校园风，尺度只到内衣。";
//            infocell.descLab.font = MAFONT_SIZE(14);
//        }
//        return infocell;
//    }
    
    if (indexPath.section == 3) {
        MAProfileCell *cell = [tableView dequeueReusableCellWithIdentifier:[MAProfileCell reuseableIdentifier] forIndexPath:indexPath];
        cell.buttonGroup.delegate = self;
        cell.model = self.model;
        self.buttonGroup = cell.buttonGroup;
        return cell;
    }

    
    MAInviteCell *invitecell = [MAInviteCell cellWithTableview:tableView forIndexPath:indexPath];
    invitecell.delegate = self;
    if (indexPath.section == 4) {
        invitecell.leftTitle.text = @"最新动态";
        invitecell.rightTitle.hidden = YES;
        invitecell.didHiddenTimes = YES;
        invitecell.cornerRadius = 4;
        invitecell.selectedSection = 5;
    } else {
        invitecell.selectedSection = 3;
        invitecell.showLevel = YES;
    }
    
    return invitecell;
    
    
    
}

#pragma mark - tableview delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 1) {
        if (indexPath.row == 3) {
            _open = !_open;
           // NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:indexPath.section];
            //[self.tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationNone];
            [self.tableView reloadData];
        }
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        [MAInfoHeaderView rowHeight];
    }
    if (indexPath.section == 2 || indexPath.section == 4) {
        return [MAInviteCell rowHeight];
    }
    if (indexPath.section == 3) {
        return [MAProfileCell rowHeight];
    }
    
    if (indexPath.section == 1) {
        if (indexPath.row == 3) {
            
            return _open ? 80 : 60;
           
        }
        
    }
    
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section != 0) {
        return 1;
    }
    
    return [MAInfoHeaderView rowHeight];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section != 0) {
        return nil;
    }
    
    MAInfoHeaderView *header = [MAInfoHeaderView infoHeaderView];
    return header;
    
}


#pragma mark - MAInviteCell Delegate
- (void)cell:(MAInviteCell *)cell didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    //NSLog(@"section:%zd, row: %zd", indexPath.section, indexPath.row);
    if (indexPath.section == 2) {
        
        MAInviteViewController *inviteVC = [[MAInviteViewController alloc] initWithStyle:UITableViewStyleGrouped];
        inviteVC.model = self.model;
        [self.navigationController pushViewController:inviteVC animated:YES];
        
    } else {
        MAActivityViewController *activityVC = [[MAActivityViewController alloc] init];
        activityVC.title = @"动态";
        [self.navigationController pushViewController:activityVC animated:YES];
    }
    
}

- (void)cell:(MAInviteCell *)cell didClickMoreButton:(UIButton *)sender {
    MAInviteListViewController *listVc = [[MAInviteListViewController alloc] initWithStyle:UITableViewStyleGrouped];
    [self.navigationController pushViewController:listVc animated:YES];
}

#pragma mark - MAButtonBroupDelegate

- (void)buttonGroup:(MAButtonBroup *)view clickedAtTag:(NSInteger)tag {
    //NSLog(@"%zd", tag);
    MADFriendsViewController *friendViewController =[[MADFriendsViewController alloc]init];
    [self.navigationController pushViewController:friendViewController animated:YES];
}

#pragma mark - toolbar 按钮点击事件

- (void)clickButton:(UIButton *)sender {
    sender.selected = !sender.selected;
    int fans = [self.buttonGroup.fansText.text intValue];
    NSString *fansStr = nil;
    
    if (sender.selected) {
        //fans add 1
        [self plussAnimation];
        fansStr = [NSString stringWithFormat:@"%d", ++fans];
        
    } else {
        fansStr = [NSString stringWithFormat:@"%d", --fans];
    }
    self.buttonGroup.fansText.text = fansStr;
    NSLog(@"---------------fans: %@", fansStr);
}

- (void)presentChatting {
    MAChattingViewController *chattingVc = [[MAChattingViewController alloc] init];
    [self.navigationController pushViewController:chattingVc animated:YES];
}

- (void)plussAnimation {
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pluss_button"]];
    imageView.origion = CGPointMake(self.view.width*0.5, self.view.height*0.65);
    //imageView.size = CGSizeZero;
    imageView.alpha = 0;
    [self.view insertSubview:imageView aboveSubview:self.tableView.superview];
    
    [UIView animateWithDuration:1 animations:^{
        imageView.alpha = 1;
        imageView.transform = CGAffineTransformScale(imageView.transform, 1.5, 1.5);
    } completion:^(BOOL finished) {
        [imageView removeFromSuperview];
    }];
}

#pragma mark - 懒加载
- (NSArray *)dataList {
    if (!_dataList) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"baseinfo" ofType:@"plist"];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        _dataList = array;
    }
    
    return _dataList;
}

#pragma mark - 显示分享菜单

/**
 *  显示分享菜单
 *
 *  @param view 容器视图
 */
- (void)showShareActionSheet:(UIView *)view
{
    /**
     * 在简单分享中，只要设置共有分享参数即可分享到任意的社交平台
     **/
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"shareImg" ofType:@"png"];
    
    //构造分享内容
    id<ISSContent> publishContent = [ShareSDK content:@"分享内容"
                                       defaultContent:@"测试一下"
                                                image:[ShareSDK imageWithPath:imagePath]
                                                title:@"ShareSDK"
                                                  url:@"http://www.mob.com"
                                          description:@"这是一条测试信息"
                                            mediaType:SSPublishContentMediaTypeNews];
    //创建弹出菜单容器
    id<ISSContainer> container = [ShareSDK container];
    [container setIPadContainerWithView:view arrowDirect:UIPopoverArrowDirectionUp];
    
    //弹出分享菜单
    [ShareSDK showShareActionSheet:container
                         shareList:nil
                           content:publishContent
                     statusBarTips:YES
                       authOptions:nil
                      shareOptions:nil
                            result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                
                                if (state == SSResponseStateSuccess)
                                {
                                    NSLog(NSLocalizedString(@"TEXT_ShARE_SUC", @"分享成功"));
                                    [SVProgressHUD showSuccessWithStatus:@"分享成功"];
                                }
                                else if (state == SSResponseStateFail)
                                {
                                    NSLog(NSLocalizedString(@"TEXT_ShARE_FAI", @"分享失败,错误码:%d,错误描述:%@"), [error errorCode], [error errorDescription]);
                                }
                            }];}

- (void)share {
    [self showShareActionSheet:self.view];
}



@end
