//
//  MAEditInfoViewController.m
//  ModelArea
//
//  Created by mac on 15/8/4.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MAEditInfoViewController.h"
#import "MAChangeNameViewController.h"
#import "MANavigationController.h"
#import "MACertifyViewController.h"
#import "MAPickImageCell.h"
#import "MASizeViewController.h"
#import "MARemarkViewController.h"
#import "MARegionViewController.h"
#import "MABaseInfoCell.h"


static const CGFloat IconWH = 75;
static const CGFloat MaxRowHeight = 105;

@interface MAEditInfoViewController ()<UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIActionSheetDelegate, MAPickImageCellDelegate>

@property (nonatomic, strong) UIImagePickerController *imagePC;
@property (nonatomic, strong) NSArray *otherData;
@property (nonatomic, weak) UIImageView *userIcon;

@end

@implementation MAEditInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"个人信息";
    self.navigationItem.rightBarButtonItem = nil;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    [self.tableView registerClass:[MABaseInfoCell class] forCellReuseIdentifier:[MABaseInfoCell reuseableIdentifier]];
    [self.tableView registerClass:[MAPickImageCell class] forCellReuseIdentifier:[MAPickImageCell reuseableIdentifier]];
    
    self.dataList = @[
                      @[ @{@"title":@"头像"}, @{@"title": @"昵称", @"desc":@"阿道夫"}, @{@"title":@"地区", @"desc":@"北京∙朝阳"} ],
                      @[ @{@"title":@"类型"}, @{@"title": @"Size"} ],
                      @[ @{@"title":@"邀约报价"}, @{@"title": @"资格认证"} ],
                      @[ @{@"title":@"备注"}, @{@"title": @"首页作品"}]
                      ];
    ///self.otherData = @[ @"阿道夫", @"北京∙朝阳" ];
    
    self.imagePC = [[UIImagePickerController alloc] init];
    self.imagePC.delegate = self;
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
    
    if (indexPath.section == 3) {
        if (indexPath.row == 1) {
            MAPickImageCell *picCell = [MAPickImageCell cellWithTableview:tableView forIndexPath:indexPath];
            picCell.delegate = self;
            return picCell;
        }
    }
    
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.textLabel.text = dict[@"title"];
            cell.textLabel.font = MAFONT_SIZE(16);
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            UIImageView *userIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"girl_2.jpg"]];
            userIcon.layer.cornerRadius = 5;
            userIcon.layer.masksToBounds = YES;
            userIcon.frame = CGRectMake(self.view.width-IconWH-40, (MaxRowHeight-IconWH)*0.5, IconWH, IconWH);
            [cell.contentView addSubview:userIcon];
            self.userIcon = userIcon;
             return cell;
        }
//        else {
//        
//            UILabel *descLab = [[UILabel alloc]  initWithFrame:CGRectMake(self.view.width-120-40, 0, 120, 44)];
//            descLab.text = self.otherData[indexPath.row-1];
//            descLab.textAlignment = NSTextAlignmentRight;
//            descLab.textColor = kDEFAULT_GRAYCOLOR;
//            [cell.contentView addSubview:descLab];
//        }
    }

   
   
    
    MABaseInfoCell *infoCell = [MABaseInfoCell cellWithTableview:tableView forIndexPath:indexPath];
    infoCell.data = dict;
    infoCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    infoCell.descLab.textAlignment = NSTextAlignmentRight;
    infoCell.descLab.textColor = kDEFAULT_GRAYCOLOR;
    infoCell.titleLab.textColor = kDEFAULT_BLACKCOLOR;
    return infoCell;
}

#pragma mark - table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"相册", @"拍照", nil];
            
            [sheet showInView:self.view];
            return ;
        }
        if (indexPath.row == 1) {
            MAChangeNameViewController *changeVC = [[MAChangeNameViewController alloc] initWithStyle:UITableViewStyleGrouped];
            [self presentViewController:[[MANavigationController alloc] initWithRootViewController:changeVC] animated:YES completion:nil];
        }
        else {
            [self.navigationController pushViewController:[[MARegionViewController alloc] initWithStyle:UITableViewStyleGrouped] animated:YES];
        }
    }
    
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
//            UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"选择类型" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"手模", @"脚模", nil];
//            
//            [sheet showInView:self.view];
        }
        if (indexPath.row == 1) {
            [self presentViewController:[[MANavigationController alloc] initWithRootViewController:[[MASizeViewController alloc] initWithStyle:UITableViewStyleGrouped]] animated:YES completion:nil];
            
        }
    }
    
    if (indexPath.section == 2) {

        if (indexPath.row == 1) {
            [self.navigationController pushViewController:[[MACertifyViewController alloc] init] animated:YES];
        }
    }
    
    if (indexPath.section == 3) {
        if (indexPath.row == 0) {
            [self presentViewController:[[MANavigationController alloc] initWithRootViewController:[[MARemarkViewController alloc] init]] animated:YES completion:nil];
        }
    }

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            return 105;
        }
    }
    if (indexPath.section == 3 && indexPath.row == 1) {
        return [MAPickImageCell rowHeight];
    }
    return 44;
}

#pragma mark imagePickerController delegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [picker dismissViewControllerAnimated:YES completion:nil];
    UIImage *OrignImage = info[UIImagePickerControllerOriginalImage];
    self.userIcon.image = OrignImage;
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:nil];
    
}

#pragma mark - action sheet delegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if (buttonIndex == 2) {
        return ;
    }
    
    if (buttonIndex == 0) {
        
        _imagePC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        
    }
    
    if (buttonIndex == 1) {
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera ]) {
            _imagePC.sourceType = UIImagePickerControllerSourceTypeCamera;
            _imagePC.cameraDevice = UIImagePickerControllerCameraDeviceFront;
            //self.picker.allowsEditing = YES;
            //self.picker.showsCameraControls = YES;
            
        } else {
            [[[UIAlertView alloc] initWithTitle:@"提醒" message:@"您的设备不支持相机" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil] show];
        }
    }
    
    [self presentViewController:_imagePC animated:YES completion:nil];
   
}

#pragma mark - pick cell delegete

- (void)pickImageCellDidClickButton:(MAPickImageCell *)cell {
     _imagePC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:_imagePC animated:YES completion:nil];
    
}



@end
