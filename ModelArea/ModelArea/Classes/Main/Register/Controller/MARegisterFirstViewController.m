//
//  MARegisterOneViewController.m
//  ModelArea
//
//  Created by mac on 15/7/28.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MARegisterFirstViewController.h"
#import "MARegisterSecondViewController.h"



static const CGFloat RowHeight = 60;

@interface MARegisterFirstViewController ()



@end

@implementation MARegisterFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title  =@"用户名(1/6)";
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(nextStepAction) title:@"下一步"];
    
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
    
    self.tableView.allowsSelection = NO;
    self.tableView.scrollEnabled = NO;
    self.tableView.rowHeight = RowHeight;
    [self.tableView registerNib:[MARegisterCell nib] forCellReuseIdentifier:[MARegisterCell ID]];
    
    //NSLog(@"data list: %@", self.dataList);
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:YES];
    if (_cell) {
        [_cell.textField resignFirstResponder];
    }
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
    MARegisterCell *cell = [tableView dequeueReusableCellWithIdentifier:[MARegisterCell ID] forIndexPath:indexPath];
    
    cell.data = self.dataList[indexPath.row];
    self.cell = cell;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 30;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    NSString *str = @"注册并同意《模界用户协议》";
//    NSMutableAttributedString *colorStr = [[NSMutableAttributedString alloc] init];
//    NSDictionary *attribute = @{NSForegroundColorAttributeName:[UIColor lightGrayColor]};
//    [colorStr addAttributes:attribute range:NSMakeRange(0, 3)];
    return str;
}


#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    return NO;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (NSArray *)dataList {
    if (!_dataList) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"register" ofType:@"plist"];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        _dataList = array;
    }
    
    return _dataList;
}

- (void)nextStepAction {
    
    if (_cell.textField.text.length == 0 || [_cell.text isEqualToString:@""]) {
        [SVProgressHUD setBackgroundColor:[UIColor whiteColor]];
        [SVProgressHUD setForegroundColor:[UIColor blackColor]];
        [SVProgressHUD showInfoWithStatus:@"用户名不能为空"];
        return ;
    }
    
    //连接服务器，检查用户名是否已存在
    
    
    
    [self.navigationController pushViewController:[[MARegisterSecondViewController alloc] initWithStyle:UITableViewStyleGrouped] animated:YES];
    
}


@end
