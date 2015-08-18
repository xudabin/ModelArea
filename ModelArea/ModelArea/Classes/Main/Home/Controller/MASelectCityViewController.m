//
//  MASelectCityViewController.m
//  ModelArea
//
//  Created by mac on 15/8/4.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MASelectCityViewController.h"
#import "MASelectCityCell.h"
#import "MACitiesView.h"

NSString *const MACityDidSelectedNotification = @"MACityDidSelectedNotification";

@interface MASelectCityViewController () <MACitiesViewDelegate>

@end

@implementation MASelectCityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"选择城市";
    
    self.navigationItem.rightBarButtonItem = nil;
    [self.tableView registerNib:[MASelectCityCell nib] forCellReuseIdentifier:[MASelectCityCell reuseableIdentifier]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MASelectCityCell *cell = [tableView dequeueReusableCellWithIdentifier:[MASelectCityCell reuseableIdentifier] forIndexPath:indexPath];
    
    cell.LocatedCity = self.locatedCity;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return [MACitiesView rowHeight];
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    
    MACitiesView *cityView = [[MACitiesView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, [MACitiesView rowHeight])];
    cityView.data = @[ @"北京", @"上海" , @"广州", @"深圳", @"杭州"];
    cityView.delegate  = self;
    return cityView;
}

# pragma mark - MACitiesViewDelegate

- (void)cityView:(MACitiesView *)view didSelectedCity:(NSString *)city {
    NSLog(@"city---:%@", city);
    [[NSNotificationCenter defaultCenter] postNotificationName:MACityDidSelectedNotification object:nil userInfo:@{@"city":city}];
    
    [self.navigationController popViewControllerAnimated:YES];
    
}


@end
