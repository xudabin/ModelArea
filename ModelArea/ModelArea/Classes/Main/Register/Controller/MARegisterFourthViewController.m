//
//  MARegisterFourthViewController.m
//  ModelArea
//
//  Created by mac on 15/7/28.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MARegisterFourthViewController.h"
#import "MARegisterFifthViewController.h"
#import "UIButton+Extention.h"

@interface MARegisterFourthViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIActionSheetDelegate>
@property (weak, nonatomic) IBOutlet UIButton *camareBtn;
@property (weak, nonatomic) IBOutlet UIButton *addButtonO;
@property (weak, nonatomic) IBOutlet UIButton *addButtonT;
@property (weak, nonatomic) IBOutlet UIButton *addButtonTh;
@property (weak, nonatomic) IBOutlet UIButton *addButtonF;
@property (strong, nonatomic) UIImagePickerController *imagePC;

@end

@implementation MARegisterFourthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [super viewDidLoad];
    self.title  =@"个人资料(4/6)";
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(nextStepAction) title:@"下一步"];
    
    [self.camareBtn centerImageAndTitle];
    [self.addButtonO centerImageAndTitle];
    [self.addButtonT centerImageAndTitle];
    [self.addButtonTh centerImageAndTitle];
    [self.addButtonF centerImageAndTitle];
    
    self.imagePC = [[UIImagePickerController alloc] init];
    self.imagePC.delegate = self;

}

#pragma mark imagePickerController delegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [picker dismissViewControllerAnimated:YES completion:nil];
    UIImage *OrignImage = info[UIImagePickerControllerOriginalImage];
    //[self faceProcessWithImage:OrignImage];
    [self.camareBtn setImage:OrignImage forState:UIControlStateNormal];
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:nil];
    //UIButton *btn = (UIButton *)[self.view viewWithTag:1];
    //btn.hidden = NO;
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
    //self.cell.text = title;
}

- (void)nextStepAction {
    
    //    if (_cell.textField.text.length == 0) {
    //
    //        [SVProgressHUD showInfoWithStatus:@"用户名不能为空"];
    //        return ;
    //    }
    
    [self.navigationController pushViewController:[[MARegisterFifthViewController alloc] initWithStyle:UITableViewStyleGrouped] animated:YES];
    
}

- (IBAction)tackPhoto:(UIButton *)sender {
    
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"添加照片" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"相册", @"拍照", nil];
    
    [sheet showInView:self.view];
    
}



@end
