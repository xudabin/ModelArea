//
//  MASizeViewController.m
//  ModelArea
//
//  Created by mac on 15/8/15.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MASizeViewController.h"
#import "MATextFieldCell.h"

static 

@interface MASizeViewController ()

@end

@implementation MASizeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(dismissVC) title:@"取消"];
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(confirmChange) title:@"确定"];
    
   [self.tableView registerClass:[MATextFieldCell class] forCellReuseIdentifier:[MATextFieldCell reuseableIdentifier]];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    
    self.dataList = @[ @[ @{@"title":@"身高", @"placeholder":@"cm"}, @{@"title":@"体重", @"placeholder":@"kg"}],
                       @[ @{@"title":@"胸围", @"placeholder":@""}, @{@"title":@"腰围", @"placeholder":@""}, @{@"title":@"臀围", @"placeholder":@""}]
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
//    MATextFieldCell *cell = [MATextFieldCell cellWithTableview:tableView forIndexPath:indexPath];
    NSDictionary *dict = self.dataList[indexPath.section][indexPath.row];
//    
//    cell.titleLabel.text = dict[@"title"];
//    cell.inputField.placeholder = dict[@"placeholder"];
//    cell.inputField.textAlignment = NSTextAlignmentLeft;
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.textLabel.text = dict[@"title"];
    cell.textLabel.font = MAFONT_SIZE(16);
    
    UITextField *inputField = [[UITextField alloc] init];
    inputField.font = MAFONT_SIZE(15);
    inputField.frame = CGRectMake(80, 0, 120, 44);
    inputField.placeholder = dict[@"placeholder"];
    //_inputField.
    //_inputField.delegate = self;
    // _inputField.backgroundColor = kDefaultColor;
    [cell.contentView addSubview:inputField];
    return cell;
}


#pragma mark - text field delegate

- (void)dismissVC {
    [self.view endEditing:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)confirmChange {
//    if (_textField.text.length < 1) {
//        [SVProgressHUD showInfoWithStatus:@"昵称不能为空"];
//        return ;
//    }
//    if (_textField.text.length > 16) {
//        [SVProgressHUD showInfoWithStatus:@"昵称不要超过16个字符"];
//        return ;
//    }
    [self.view endEditing:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
