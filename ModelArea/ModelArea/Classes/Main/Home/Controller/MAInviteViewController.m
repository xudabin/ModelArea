//
//  MAInviteViewController.m
//  ModelArea
//
//  Created by mac on 15/8/4.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MAInviteViewController.h"
#import "MAProfileCell.h"
#import "MABaseInfoCell.h"
#import "MAModel.h"

@interface MAInviteViewController () {
    BOOL _open;
}
@property (strong, nonatomic) NSArray *dataList;
@end

@implementation MAInviteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.model.name;
    self.navigationItem.rightBarButtonItem = nil;
    
    [self.tableView registerClass:[MAProfileCell class] forCellReuseIdentifier:[MAProfileCell reuseableIdentifier]];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    [self.tableView registerClass:[MABaseInfoCell class] forCellReuseIdentifier:[MABaseInfoCell reuseableIdentifier]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if (section == 0) {
        return 1;
    }
    if (section == 1) {
        return 5;
    }
    return 2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0 ) {
        
        MAProfileCell *profileCell = [tableView dequeueReusableCellWithIdentifier:[MAProfileCell reuseableIdentifier] forIndexPath:indexPath];
        profileCell.model = self.model;
        
        return profileCell;
    }
    
//    if (indexPath.section == 2) {
//        if (indexPath.row == 1) {
//            
//        }
//    }
   
    
    MABaseInfoCell *infocell = [MABaseInfoCell cellWithTableview:tableView forIndexPath:indexPath];
    infocell.data = self.dataList[indexPath.section-1][indexPath.row];
    
    return infocell;
    
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    if (indexPath.section == 1) {
//        if (indexPath.row == 4) {
//            _open = !_open;
//        }
//        
//    }
    
    if (indexPath.section == 2) {
        if (indexPath.row == 1) {
            _open = !_open;
        }
       
    }
    
    [self.tableView reloadData];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return [MAProfileCell rowHeight];
    }
    if (indexPath.section == 2) {
        if (indexPath.row == 1) {
            return _open ? 80 : 60;
        }
    }
    
    
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 10;
}

- (NSArray *)dataList {
    if (!_dataList) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"invite" ofType:@"plist"];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        _dataList = array;
    }
    
    return _dataList;
}

@end
