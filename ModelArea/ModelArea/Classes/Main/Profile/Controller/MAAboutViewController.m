//
//  MAAboutViewController.m
//  ModelArea
//
//  Created by mac on 15/8/6.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MAAboutViewController.h"

static NSString *ID = @"Cell";
@interface MAAboutViewController ()

@end

@implementation MAAboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"关于模界";
    self.navigationItem.rightBarButtonItem = nil;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ID];
    
    self.dataList = @[ @"去评分", @"功能介绍", @"帮助与反馈"];
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
    
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    cell.textLabel.text = self.dataList[indexPath.row];
    cell.textLabel.font = MAFONT_SIZE(16);
    
    return cell;
}

@end
