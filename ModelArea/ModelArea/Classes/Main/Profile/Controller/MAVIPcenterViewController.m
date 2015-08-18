//
//  MAVIPcenterViewController.m
//  ModelArea
//
//  Created by mac on 15/8/5.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MAVIPcenterViewController.h"
#import "MAVipViewController.h"
#import "MAVIPCell.h"

static NSString *ID = @"Cell";

@interface MAVIPcenterViewController ()
@end

@implementation MAVIPcenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"VIP中心";
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ID];
    [self.tableView registerNib:[MAVIPCell nib] forCellReuseIdentifier:[MAVIPCell reuseableIdentifier]];
    
    self.dataList = @[ @[ @{ @"image":@"profile_vip_icon_big", @"title":@"点亮会员标识", @"desc":@"可享受19项特权!"}],
                       @[ @{ @"title": @"VIP等级说明" }, @{ @"title": @"VIP功能介绍" }],
                       @[ @{@"image":@"profile_vip_icon", @"title":@"开通年费会员", @"desc":@"年费VIP立享2级VIP特权"}]
                      ];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return self.dataList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    NSArray *array = self.dataList[section];
    return array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
     NSDictionary *dict = self.dataList[indexPath.section][indexPath.row];
    
    if (indexPath.section == 0) {
        MAVIPCell *vipCell = [tableView dequeueReusableCellWithIdentifier:[MAVIPCell reuseableIdentifier] forIndexPath:indexPath];
        vipCell.vipImage.image = [UIImage imageNamed:dict[@"image"]];
        vipCell.titleLab.text = dict[@"title"];
        vipCell.descLab.text = dict[@"desc"];
        return vipCell;
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
    
    cell.textLabel.text = dict[@"title"];
    cell.textLabel.font = MAFONT_SIZE(16);
    cell.imageView.image = [UIImage imageNamed:dict[@"image"]];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    if (indexPath.section == 2) {
        UILabel *descLab = [[UILabel alloc]  initWithFrame:CGRectMake(self.view.width-150-15, 0, 150, kDEFAULT_ROWHEIGHT)];
        descLab.text = dict[@"desc"];
        descLab.font = MAFONT_SIZE(13);
        descLab.textColor = kDEFAULT_GRAYCOLOR;
        [cell.contentView addSubview:descLab];
    }
    

    return cell;
}


#pragma mark - table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 1) {
        return;
    }
    
    [self.navigationController pushViewController:[[MAVipViewController alloc] initWithStyle:UITableViewStyleGrouped] animated:YES];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 70;
    }
    return kDEFAULT_ROWHEIGHT;
}



@end
