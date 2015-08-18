//
//  MAInviteListViewController.m
//  ModelArea
//
//  Created by mac on 15/8/11.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MAInviteListViewController.h"
#import "MAInviteViewController.h"
#import "MAOtherCell.h"
#import "MAModel.h"
#import "MJExtension.h"

static NSString *ID = @"Cell";

@interface MAInviteListViewController ()

@property (nonatomic, strong) NSMutableArray *data;

@end

@implementation MAInviteListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"我的邀约";
    
    [self.tableView registerClass:[MAOtherCell class] forCellReuseIdentifier:[MAOtherCell reuseableIdentifier]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//字典转模型
- (NSArray *)data {
    if (!_data) {
        _data = [NSMutableArray array];
        NSString *path = [[NSBundle mainBundle] pathForResource:@"model" ofType:@"plist"];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        for (NSDictionary *dict in array) {
            MAModel *model = [MAModel objectWithKeyValues:dict];
            [_data addObject:model];
        }
    }
    return _data;
}

#pragma mark - Table view datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MAOtherCell *cell = [tableView dequeueReusableCellWithIdentifier:[MAOtherCell reuseableIdentifier] forIndexPath:indexPath];
    
    MAModel *model = self.data[indexPath.row];
    cell.iconImageView.image = [UIImage imageNamed:model.image];
    cell.iconImageView.size = CGSizeMake(60, 60);
    cell.titeLabel.text = model.name;
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    MAInviteViewController *inviteVc = [[MAInviteViewController alloc] initWithStyle:UITableViewStyleGrouped];
    inviteVc.model = self.data[indexPath.row];
    [self.navigationController pushViewController:inviteVc animated:YES];
    
   
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.01;
}

@end
