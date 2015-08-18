//
//  MAVipViewController.m
//  ModelArea
//
//  Created by mac on 15/8/11.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MAVipViewController.h"
#import "MAVIPCell.h"

static NSString *ID = @"Cell";

@interface MAVipViewController ()

@end

@implementation MAVipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerNib:[MAVIPCell nib] forCellReuseIdentifier:[MAVIPCell reuseableIdentifier]];
   // [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ID];
    
    self.dataList = @[ @{ @"image":@"vip_0", @"title":@"1个月" },
                       @{ @"image":@"vip_1", @"title":@"3个月", @"desc":@"优惠16%" },
                       @{ @"image":@"vip_2", @"title":@"6个月", @"desc":@"优惠16%" },
                       @{ @"image":@"vip_3", @"title":@"12个月", @"desc":@"优惠25%，享年费特权" },
                       ];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
//    
//
//    cell.imageView.image = [UIImage imageNamed:dict[@"image"]];
//    cell.textLabel.text = dict[@"title"];
    NSDictionary *dict = self.dataList[indexPath.row];
    MAVIPCell *vipCell = [tableView dequeueReusableCellWithIdentifier:[MAVIPCell reuseableIdentifier] forIndexPath:indexPath];
    vipCell.selectionStyle = UITableViewCellSelectionStyleNone;
    vipCell.vipImage.image = [UIImage imageNamed:dict[@"image"]];
    vipCell.titleLab.text = dict[@"title"];
    
    
    vipCell.descLab.text = dict[@"desc"];
    return vipCell;

    
    return vipCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

@end
