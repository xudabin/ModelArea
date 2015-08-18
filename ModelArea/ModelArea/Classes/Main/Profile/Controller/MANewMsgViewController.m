//
//  MANewMsgViewController.m
//  ModelArea
//
//  Created by mac on 15/8/6.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MANewMsgViewController.h"

static NSString *ID = @"Cell";

@interface MANewMsgViewController ()

@end

@implementation MANewMsgViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"消息设置";
    self.navigationItem.rightBarButtonItem = nil;
    
    self.tableView.rowHeight = kDEFAULT_ROWHEIGHT;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ID];
    
    self.dataList = @[ @"声音", @"振动" ];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.dataList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = self.dataList[indexPath.row];
    cell.textLabel.font = MAFONT_SIZE(16);
    
    UISwitch *mySwitch = [[UISwitch alloc] init];
    mySwitch.origion = CGPointMake(self.view.width-51-10, (kDEFAULT_ROWHEIGHT-31)/2);
    mySwitch.on = YES;
    [cell.contentView addSubview:mySwitch];
    
    return cell;
}


@end
