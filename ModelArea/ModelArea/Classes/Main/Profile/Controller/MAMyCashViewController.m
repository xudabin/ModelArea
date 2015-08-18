//
//  MAMyCashViewController.m
//  ModelArea
//
//  Created by mac on 15/8/6.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MAMyCashViewController.h"
#import "MACashViewController.h"
#import "MADepositViewController.h"
#import "MAOtherCell.h"

@interface MAMyCashViewController ()

//@property (nonatomic, strong) NSArray *dataList;

@end

@implementation MAMyCashViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"现金";
    self.navigationItem.rightBarButtonItem = nil;
    
    [self.tableView registerClass:[MAOtherCell class] forCellReuseIdentifier:[MAOtherCell reuseableIdentifier]];
    
    self.dataList = @[ @"零钱", @"保证金"];
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
    cell.titeLabel.font = MAFONT_SIZE(16);
    NSString *str=[NSString stringWithFormat:@"profile_cash_icon_%zd",indexPath.row];
    cell.iconImageView.image = [UIImage imageNamed:str];
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        MACashViewController *cashVc = [[MACashViewController alloc] init];
        [self.navigationController pushViewController:cashVc animated:YES];
    } else {
        [self.navigationController pushViewController:[[MADepositViewController alloc] initWithStyle:UITableViewStyleGrouped] animated:YES];
    }
}


@end
