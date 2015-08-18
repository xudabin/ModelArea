//
//  MALoginViewController.m
//  ModelArea
//
//  Created by mac on 15/7/24.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MALoginViewController.h"
#import "MARegisterFirstViewController.h"
#import "MATabBarController.h"
#import "MANetworkingAPI.h"
#import "MAAccountManager.h"
#import "MAAccount.h"
#import "MAAccountReformer.h"

static const CGFloat TimeIntervel = 0.25;

@interface MALoginViewController () <MANetworkingAPIDelegate>

@property (weak, nonatomic) IBOutlet UITextField *userTextField;
@property (weak, nonatomic) IBOutlet UITextField *pwdTextField;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (assign, nonatomic) BOOL keyBoardVisible;
@property (assign, nonatomic) CGSize keyBoardSize;

@property (strong, nonatomic) MAAccountReformer *accountReformer;

@end

@implementation MALoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = kDefaultColor;
    
    self.accountReformer = [[MAAccountReformer alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.userTextField resignFirstResponder];
    [self.pwdTextField resignFirstResponder];
}

- (void)viewWillAppear:(BOOL)animated
{
    //隐藏导航栏
    [self.navigationController setNavigationBarHidden:YES];
    
    //隐藏状态栏
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    
    self.navigationController.navigationBarHidden = YES;
    //注册键盘出现通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    
    //注册键盘隐藏通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardDidHide:) name:UIKeyboardDidHideNotification object:nil];
    
    //注册键盘改变通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardDidChangeFrame:) name:UIKeyboardDidChangeFrameNotification object:nil];
    
    //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loginInfo:) name:@"RegisterInfo" object:nil];
    [super viewWillAppear:YES];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidChangeFrameNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"RegisterInfo" object:nil];
    [super viewWillDisappear:YES];
}

- (void)keyBoardDidShow: (NSNotification *)notif {
    //NSLog(@"keyBoardDidShow");
    if (_keyBoardVisible) {
        return;
    }
    NSDictionary *info = [notif userInfo];
    NSValue *aValue = info[UIKeyboardFrameBeginUserInfoKey];
    self.keyBoardSize = [aValue CGRectValue].size;
   
    [self scoreToRectAnimated:self.loginBtn.frame];
    
    //[self.scoreView scrollRectToVisible:self.pwdLabel.frame animated:YES];
    
    self.keyBoardVisible = YES;
    
}

- (void)keyBoardDidChangeFrame: (NSNotification *)notif {
    
    NSDictionary *info = [notif userInfo];
    NSValue *aValue = info[UIKeyboardFrameBeginUserInfoKey];

    self.keyBoardSize = [aValue CGRectValue].size;
    
    //NSLog(@"size: %@", NSStringFromCGSize(_keyBoardSize));
    
    [self scoreToRectAnimated:self.loginBtn.frame];
    
    
   // self.keyBoardVisible = YES;
    
}

- (void)scoreToRectAnimated:(CGRect)rect {
    //NSLog(@"%f ,%f", self.view.frame.size.height, self.keyBoardSize.height);
    CGFloat keyY = self.view.frame.size.height - self.keyBoardSize.height;
    CGFloat scoreH = rect.origin.y + rect.size.height - keyY;
    //NSLog(@"rectY:%f, keyY:%f ,scoreH:%f",rect.origin.y,keyY, scoreH);
    if (scoreH < 0) {
        self.scrollView.scrollEnabled = NO;
        return;
    }
    CGPoint point = CGPointMake(0, scoreH);
    
    [UIView animateWithDuration:TimeIntervel animations:^{
        self.scrollView.contentOffset = point;
    }];
    
    
}

- (void)keyBoardDidHide: (NSNotification *)notif {

    [UIView animateWithDuration:TimeIntervel animations:^{
        self.scrollView.contentOffset = CGPointZero;
    }];
    if (!_keyBoardVisible) {
        return ;
    }
    self.keyBoardVisible = NO;
    
}

#pragma mark - MANetworkingAPI delegate
- (void)networkingAPI:(MANetworkingAPI *)networkingAPI didSuccessWithResponseObject:(id)responseObject {
   // NSLog(@"responseObject: %@", responseObject);
    MAAccount *account = [networkingAPI fetchDataWithReformer:self.accountReformer];
    if (!account) {
        [SVProgressHUD showInfoWithStatus:responseObject[@"msg"]];
        return ;
    }
    
    //MAAccount *account = [MAAccount accountWithDict:responseObject[@"result"]];
    [MAAccountManager saveAccount:account];
    
    [SVProgressHUD dismiss];
    
    //present to homePage
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    window.rootViewController = [[MATabBarController alloc] init];
    
   

}


- (void)networkingAPI:(MANetworkingAPI *)networkingAPI didFailWithErrorMsg:(NSString *)errorMsg {
  
    [SVProgressHUD showInfoWithStatus:errorMsg];
}


- (IBAction)loginAction:(id)sender {
    [SVProgressHUD setBackgroundColor:[UIColor blackColor]];
    [SVProgressHUD setForegroundColor:kDefaultTextColor];
    //display alter
    NSString *user = _userTextField.text;
    NSString *pwd = _pwdTextField.text;
    
    if (user.length == 0 || pwd.length == 0) {
        [SVProgressHUD showInfoWithStatus:@"用户名或密码不能为空"];
        
        return;
    }
    
    [SVProgressHUD show];
    
    MANetworkingAPI *api = [MANetworkingAPI netWorking];
    api.delegate = self;
    NSDictionary *params = @{ @"usercode": user, @"password": pwd };
    [api startRequestWithPOST:@"LoginServlet" parameters:params];
    

}

- (IBAction)registerAction:(id)sender {
    
    [self.navigationController setNavigationBarHidden:NO];
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    
    [self.navigationController pushViewController:[[MARegisterFirstViewController alloc] initWithStyle:UITableViewStyleGrouped] animated:YES];
}

- (IBAction)forgetPwdAction:(id)sender {
}




@end
