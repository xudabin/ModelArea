//
//  MAActivityViewController.m
//  ModelArea
//
//  Created by mac on 15/7/30.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MAActivityViewController.h"
#import "MAActivityHeader.h"
#import "MAActivityCell.h"
#import "MJRefresh.h"

static const CGFloat HEADER_HEIGHT = 300;
static const CGFloat ROW_HEIGHT = 120;

@interface MAActivityViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) UITableView *tableView;
@end

@implementation MAActivityViewController
- (void)loadView {
    CGRect frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight-NavBarHeight);
    self.tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStyleGrouped];

    self.view = _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = nil;
    
    
    self.tableView.rowHeight = ROW_HEIGHT;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerNib:[MAActivityCell nib] forCellReuseIdentifier:[MAActivityCell reuseableIdentifier]];

    //添加下拉刷新
    self.tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[MAActivityCell reuseableIdentifier] forIndexPath:indexPath];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return HEADER_HEIGHT;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [MAActivityHeader activityHeader];
}


@end
