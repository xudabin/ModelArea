//
//  MACertifyViewController.m
//  ModelArea
//
//  Created by mac on 15/8/11.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MACertifyViewController.h"
#import "MATextFieldCell.h"
#import "MAUploadPhotoCell.h"
#import "MABaseInfoCell.h"

static const CGFloat Margin = 30;
static NSString *ID = @"Cell";

@interface MACertifyViewController () <UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate, MAUploadPhotoCellDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate> {
    BOOL _dataSourceChanged;
}

@property (nonatomic, weak) UIView *headerView;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataList;
@property (nonatomic, strong) NSArray *dataOne;
@property (nonatomic, strong) NSArray *dataTwo;
@property (nonatomic, assign) NSInteger selectedIndex;
@property (nonatomic, strong) NSMutableArray *buttons;

@end

@implementation MACertifyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"资格认证";
    self.view.backgroundColor = kDefaultTextColor;
    self.navigationItem.rightBarButtonItem = nil;
    [self createHeaderView];
    
    CGFloat originY = CGRectGetMaxY(self.headerView.frame);
    CGRect frame = CGRectMake(0, originY, self.view.width, self.view.height - originY);
    self.tableView = [[UITableView alloc] initWithFrame:frame ];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    //self.tableView.allowsSelection = NO;

    [self.view addSubview:self.tableView];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ID];
    //[self.tableView registerClass:[MATextFieldCell class] forCellReuseIdentifier:[MATextFieldCell reuseableIdentifier]];
    [self.tableView registerClass:[MABaseInfoCell class] forCellReuseIdentifier:[MABaseInfoCell reuseableIdentifier]];
    [self.tableView registerNib:[MAUploadPhotoCell nib] forCellReuseIdentifier:[MAUploadPhotoCell reuseableIdentifier]];
    
    self.dataOne = @[ @[ @{ @"title":@"通过身份认证，将会有更多的艺人信任您"} ],
                      @[ @{ @"title":@"认证状态", @"desc":@"未认证"}],
                      @[ @{ @"title":@"认证方式", @"desc":@""},
                          @{ @"title":@"认证号码", @"desc":@"输入证件号码"}]
                       ];
    
    self.dataTwo = @[ @[ @{ @"title":@"通过身份认证，将会有更多的艺人信任您"} ],
                      @[ @{ @"title":@"认证状态", @"desc":@"未认证"}],
                      @[ @{ @"title":@"公司机构名称", @"desc":@"点击输入"},
                         @{ @"title":@"营业执照注册号", @"desc":@"点击输入"},
                         @{ @"title":@"营业执照所在地", @"desc":@"点击输入"},
                         @{ @"title":@"联系电话", @"desc":@"点击输入"} ]
                       ];
    self.dataList = self.dataOne;
    self.selectedIndex = 0;
    
    self.buttons = [NSMutableArray arrayWithCapacity:2];
    
}

- (void)createHeaderView {
    UISegmentedControl *segmented = [[UISegmentedControl alloc] initWithItems:@[@"身份", @"公司"]];
    segmented.frame = CGRectMake(Margin, 7, self.view.width-2*Margin, 30);
    segmented.tintColor = kDefaultColor;
    [segmented addTarget:self action:@selector(changDataSource:) forControlEvents:UIControlEventValueChanged];
    segmented.selectedSegmentIndex = 0;
    
    //NSLog(@"nav:%f", NavBarHeight);
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, NavBarHeight, self.view.width, 44)];
   
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, headerView.height-1, headerView.width, 1)];
    imageView.image = [UIImage imageNamed:@"separator_line"];
  
    [headerView addSubview:segmented];
    [headerView addSubview:imageView];
    
    [self.view addSubview:headerView ];
    self.headerView = headerView;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return self.dataList.count + 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
   
    if (section == self.dataList.count) {
        return 1;
    }
     NSArray *array = self.dataList[section];
    return array.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSDictionary *dict = nil;
    if (indexPath.section != self.dataList.count) {
        dict = self.dataList[indexPath.section][indexPath.row];
    }
    
    
    //顶部cell
    if (indexPath.section == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textLabel.text = dict[@"title"];//@"通过身份认证，将会有更多的艺人信任您";
        cell.textLabel.textColor = kDefaultColor;
        cell.textLabel.font = MAFONT_SIZE(14);
        return cell;
    }
    
    //底部cell
    if (indexPath.section == self.dataList.count) {
        MAUploadPhotoCell *uploadCell = [MAUploadPhotoCell cellWithTableview:tableView forIndexPath:indexPath];
        uploadCell.selectionStyle = UITableViewCellSelectionStyleNone;
        uploadCell.delegate = self;
        return uploadCell;
    }
    
    if (self.selectedIndex == 0) {
        if (indexPath.section == 2 && indexPath.row == 0) {
            NSArray *array = @[ @"护照", @"身份证"];
            UITableViewCell *buttonCell = [tableView dequeueReusableCellWithIdentifier:@"ButtonCell"];
            if (!buttonCell) {
                buttonCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ButtonCell"];
                buttonCell.textLabel.text = dict[@"title"];
                buttonCell.textLabel.font = MAFONT_SIZE(15);
                    //for (int i=0; i<2; i++) {
                    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
                    button.frame = CGRectMake(buttonCell.width-(60+8)-8, (buttonCell.height-1-24)/2, 60, 24);
                    button.tag = 1;
                    [button setBackgroundImage:[UIImage imageNamed:@"profile_certify_selected"] forState:UIControlStateSelected];
                    [button setBackgroundImage:[UIImage imageNamed:@"profile_certify"] forState:UIControlStateNormal];
                    [button setTitle:array[1] forState:UIControlStateNormal];
                    button.titleLabel.font = MAFONT_SIZE(13);
                    [button setTitleColor:kDefaultTextColor forState:UIControlStateSelected];
                    [button setTitleColor:kDEFAULT_BLACKCOLOR forState:UIControlStateNormal];
                    [button addTarget:self action:@selector(selectedOption:) forControlEvents:UIControlEventTouchUpInside];
                    [self.buttons addObject:button];
                    //if (i == 1) {
                        button.selected = YES;
                    //}
                    
                    [buttonCell.contentView addSubview:button];
                //}
            
            }
            return buttonCell;
        }
    }

    
    MABaseInfoCell *cell = [MABaseInfoCell cellWithTableview:tableView forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.data = dict;
    cell.descLab.textAlignment = NSTextAlignmentRight;
    if (indexPath.section == 1) {
        cell.descLab.textColor = kDefaultColor;
    }
    cell.titleLab.textColor = kDEFAULT_BLACKCOLOR;
    cell.descLab.textColor = kDEFAULT_GRAYCOLOR;
    return cell;
   
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == self.dataList.count) {
        return [MAUploadPhotoCell rowHeight];
    }
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section != 2) {
        return ;
    }
    NSDictionary *dict = self.dataList[indexPath.section][indexPath.row];
    
    if (!_dataSourceChanged) {
        if (indexPath.row == 0) {
            return;
        }
    }
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:dict[@"title"] delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    alert.tag = indexPath.row;
    [alert show];
    
}

#pragma mark - alert view delegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 1) {
        NSString *input = [alertView textFieldAtIndex:0].text;
        MABaseInfoCell *cell = (MABaseInfoCell *)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:alertView.tag inSection:2]];
        cell.descLab.text = input;
        NSLog(@"input: %@", input);
    }
}

#pragma mark - MAUploadPhotoCellDelegate
- (void)uploadPhotoCell:(MAUploadPhotoCell *)cell didClickButton:(MAUploadPhotoCellButtonType)type {
    switch (type) {
        case MAUploadPhotoCellButtonTypePickImage:
            [self presentImagePickerView];
            break;
            
        default:
            break;
    }
}

- (void)presentImagePickerView {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate = self;
    [self presentViewController:picker animated:YES completion:nil];
}

#pragma mark - UIImagePickerControllerDelegate 
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [picker dismissViewControllerAnimated:YES completion:nil];
   // NSLog(@"info: %@", info);
    
    MAUploadPhotoCell *cell = (MAUploadPhotoCell *)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:3]];
    cell.photoView.image = info[UIImagePickerControllerOriginalImage];
}

#pragma mark - UISegmentedControl action
- (void)changDataSource:(UISegmentedControl *)sender {
    self.selectedIndex = sender.selectedSegmentIndex;
    if (sender.selectedSegmentIndex == 0) {
        self.dataList = self.dataOne;
    }
    else {
        self.dataList = self.dataTwo;
        _dataSourceChanged = YES;
    }
    [self.tableView reloadData];
}

#pragma mark - 选择个人认证方式
- (void)selectedOption:(UIButton *)sender {
//    UIButton *button = nil;
//    //sender.selected = !sender.selected;
//    if (sender.tag == 1) {
//        
//        button = self.buttons[1];
//        
//    } else {
//        button = self.buttons[0];
//    }
//    
//   // NSLog(@"buttons: %@", self.buttons);
//    
//    button.selected = !sender.selected;
    
   // [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
}

@end
