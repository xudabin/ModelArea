//
//  MARegisterFifthViewController.m
//  ModelArea
//
//  Created by mac on 15/7/28.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MARegisterFifthViewController.h"
#import "MARegisterFinalViewController.h"
#import <SMS_SDK/SMS_SDK.h>

static const CGFloat BUTTON_WIDTH = 160;
static const CGFloat BUTTON_HEIGHT = 44;
static NSString *DEFAULE_CODE = @"86";
static NSInteger count = 60;

@interface MARegisterFifthViewController() <UIAlertViewDelegate>{
    NSArray *_data;
    NSString *_phoneNo;
    NSString *_resultCode;
    NSString *_realRresultCode;
  
    NSTimer *_timer;
}

@property (weak, nonatomic) UIButton *sendBtn;
@property (strong, nonatomic)   NSMutableArray *zoneList;
@property (assign, nonatomic) CGSize keyBoardSize;
@end

@implementation MARegisterFifthViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"安全验证(5/6)";
    _data = self.dataList[3];

    //NSLog(@"data %@", self.dataList);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//懒加载区号数据
- (NSMutableArray *)zoneList {
    if (!_zoneList) {
        _zoneList = [NSMutableArray array];
        [SMS_SDK getZone:^(enum SMS_ResponseState state, NSArray *array)
         {
             if (1 == state)
             {
                 NSLog(@"get the area code sucessfully");
                 //区号数据
                 _zoneList = [NSMutableArray arrayWithArray:array];
             }
             else if (0 == state)
             {
                 NSLog(@"failed to get the area code");
             }
             
         }];
    }
    return _zoneList;
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MARegisterCell *cell = [tableView dequeueReusableCellWithIdentifier:[MARegisterCell ID] forIndexPath:indexPath];
    
    cell.textField.keyboardType = UIKeyboardTypePhonePad;
    cell.data = _data[indexPath.row];
    self.cell = cell;
    return cell;
}

#pragma mark - Table view delegate
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"填写手机号码并验证，确保账户安全";
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 100;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [self getSendResultCodeBtn];
}

#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    return YES;
}

#pragma mark - alert view delegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        //发送验证码
        [SMS_SDK getVerificationCodeBySMSWithPhone:_phoneNo
                                              zone:DEFAULE_CODE
                                            result:^(SMS_SDKError *error)
         {
             if (!error)
             {
                 //设置发送按钮状态
                 [self.sendBtn setBackgroundColor:[UIColor lightGrayColor]];
                 _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerHandler:) userInfo:nil repeats:YES];
                 self.sendBtn.selected = YES;
                 
             } else {
                 
                 UIAlertView* alert=[[UIAlertView alloc] initWithTitle:@""
                                                               message:[NSString stringWithFormat:@"状态码：%zi ,错误描述：%@",error.errorCode,error.errorDescription]
                                                              delegate:nil
                                                     cancelButtonTitle:@"sure"
                                                     otherButtonTitles:nil, nil];
                 [alert show];
             }
             
         }];
        
    }
}

#pragma mark - private function
//下一步
- (void)nextStepAction {
    [self getTextFieldContent];
    
    if (_phoneNo.length == 0) {
        [SVProgressHUD showInfoWithStatus:@"请输入手机号"];
        return ;
    }
    
    if (![self isPhoneNumberIsAvailable]) {
        
        return ;
    }
    
    if (_resultCode.length == 0) {
        [SVProgressHUD showInfoWithStatus:@"请输入验证码"];
        return ;
    }

    //验证验证码
    [self submitResultCode];
    
    
   
    
}

//创建发送按钮
- (UIView *)getSendResultCodeBtn {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 100)];
    view.backgroundColor = [UIColor clearColor];
    
    UIButton *sendBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    sendBtn.bounds = CGRectMake(0, 0, BUTTON_WIDTH, BUTTON_HEIGHT);
    sendBtn.center = view.center;
    sendBtn.layer.cornerRadius = 5;
    [sendBtn setBackgroundColor:kDefaultColor];
    [sendBtn setTitle:@"发送验证码" forState: UIControlStateNormal];
    [sendBtn setTitleColor:kDefaultTextColor forState:UIControlStateNormal];
    [sendBtn addTarget:self action:@selector(sendResultCode) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:sendBtn];
    self.sendBtn = sendBtn;
    return view;
}

- (void)sendResultCode {

    self.navigationItem.rightBarButtonItem.enabled = NO;
    
    if (self.sendBtn.selected) {
        return;
    }
   
    [self getTextFieldContent];
    if (_phoneNo.length == 0) {
        [SVProgressHUD showInfoWithStatus:@"请输入手机号"];
        return ;
    }
    
    [self nextStep];
    
    
}

//发送验证码
-(void)nextStep {
    if (![self isPhoneNumberIsAvailable]) {
        return ;
    }
    
    NSString* str=[NSString stringWithFormat:@"我们将会给:+%@ %@发送一条确认短信，请注意查收",DEFAULE_CODE,_phoneNo];
    //_str=[NSString stringWithFormat:@"%@",self.telField.text];
    UIAlertView* alert=[[UIAlertView alloc] initWithTitle:@"提醒"
                                                  message:str delegate:self
                                        cancelButtonTitle:@"确定"
                                        otherButtonTitles:nil, nil];
    [alert show];
}


- (BOOL)isPhoneNumberIsAvailable {
    int compareResult = 0;
    for (int i=0; i<_zoneList.count; i++)
    {
        NSDictionary* dict1=[_zoneList objectAtIndex:i];
        NSString* code1=[dict1 valueForKey:@"zone"];
        if ([code1 isEqualToString:DEFAULE_CODE])
        {
            compareResult=1;
            NSString* rule1=[dict1 valueForKey:@"rule"];
            NSPredicate* pred=[NSPredicate predicateWithFormat:@"SELF MATCHES %@",rule1];
            BOOL isMatch=[pred evaluateWithObject:_phoneNo];
            if (!isMatch) {
                //手机号码不正确
                 [SVProgressHUD showInfoWithStatus:@"手机号码不正确"];
                return NO;
            }
            break;
        }
    }
    
    if (!compareResult)
    {
        if (_phoneNo.length!=11)
        {
            //手机号码不正确
            [SVProgressHUD showInfoWithStatus:@"手机号码不正确"];
            return NO;
        }
    }

    return YES;
}

// 收到验证码，并确认
- (void)submitResultCode {
    //验证号码
    //验证成功后 获取通讯录 上传通讯录
    [self.view endEditing:YES];
    
    if(_resultCode.length!=4)
    {
        UIAlertView* alert=[[UIAlertView alloc] initWithTitle:@"提醒"
                                                      message:@"验证码不正确"
                                                     delegate:nil
                                            cancelButtonTitle:@"确定"
                                            otherButtonTitles:nil, nil];
        [alert show];
        
    } else {
        //[[SMS_SDK sharedInstance] commitVerifyCode:self.verifyCodeField.text];
        [SMS_SDK commitVerifyCode:_resultCode result:^(enum SMS_ResponseState state) {
            if (1==state) {
               
                [SVProgressHUD showSuccessWithStatus:@"验证成功"];
                
                dispatch_time_t when = dispatch_time(DISPATCH_TIME_NOW, 2*NSEC_PER_SEC);
                dispatch_after(when, dispatch_get_main_queue(), ^{
                    
                    [self.navigationController pushViewController:[[MARegisterFinalViewController alloc] initWithStyle:UITableViewStyleGrouped] animated:YES];
                    
                });
            }
            else if(0==state)
            {
                [SVProgressHUD showInfoWithStatus:@"验证码不正确"];
            }
        }];
    }

}

- (void)timerHandler:(NSTimer *)timer {
    if (count <= 0) {
        count = 60;
        self.navigationItem.rightBarButtonItem.enabled = YES;
        [timer invalidate];
        self.sendBtn.selected = NO;
        [self.sendBtn setBackgroundColor:kDefaultColor];
        [self.sendBtn setTitle:@"发送验证码" forState: UIControlStateNormal];
        return ;
    }
    count --;
    NSString *timeStr = [NSString stringWithFormat:@"发送验证码(%zd)", count];
    [self.sendBtn setTitle:timeStr forState: UIControlStateSelected];
    NSLog(@"");
}

- (void)getTextFieldContent {
    MARegisterCell *cell = (MARegisterCell *)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    _phoneNo = cell.text;
    _resultCode = self.cell.text;
    
    //NSLog(@"phone :%@, result code %@",_phoneNo, _resultCode);


}

@end
