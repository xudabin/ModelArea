//
//  MAWalletViewController.m
//  ModelArea
//
//  Created by mac on 15/8/6.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MAWalletViewController.h"
#import "MAMyCashViewController.h"
#import "MAOtherCell.h"

@interface MAWalletViewController ()

@end

@implementation MAWalletViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"钱包";
    
    [self.tableView registerClass:[MAOtherCell class] forCellReuseIdentifier:[MAOtherCell reuseableIdentifier]];
    
    self.dataList = @[ @"我的现金", @"我的模豆" ];
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
    MAOtherCell *cell=[tableView dequeueReusableCellWithIdentifier:[MAOtherCell reuseableIdentifier] forIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.titeLabel.text = self.dataList[indexPath.row];
    NSString *str = [NSString stringWithFormat:@"profile_wallet_icon_%zd",indexPath.row];
    cell.iconImageView.image = [UIImage imageNamed:str];
    
    return cell;
}

#pragma mark - table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        [self.navigationController pushViewController:[[MAMyCashViewController alloc] initWithStyle:UITableViewStyleGrouped] animated:YES];
    }
}



@end
