//
//  MADepositViewController.m
//  ModelArea
//
//  Created by mac on 15/8/6.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MADepositViewController.h"

static NSString *ID = @"Cell";

@interface MADepositViewController ()

@end

@implementation MADepositViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的保证金";
    self.navigationItem.rightBarButtonItem = nil;
    
    self.tableView.allowsSelection = NO;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ID];
    
    self.dataList = @[ @{ @"title":@"冻结的保证金", @"desc":@"￥224" },
                       @{ @"title":@"正在解冻的保证金", @"desc":@"￥567" },
                       @{ @"title":@"总计", @"desc":@"￥791" }
                    ];
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
    
    NSDictionary *dict = self.dataList[indexPath.row];
    
    cell.textLabel.text = dict[@"title"];
    cell.textLabel.font = MAFONT_SIZE(16);
  
    UILabel *descLab = [[UILabel alloc]  initWithFrame:CGRectMake(self.view.width-120, 0, 100, kDEFAULT_ROWHEIGHT)];
    descLab.text = dict[@"desc"];
    descLab.font = [UIFont boldSystemFontOfSize:14];
   
    [cell.contentView addSubview:descLab];
    

    return cell;
}

#pragma mark - Table view delegate



@end
