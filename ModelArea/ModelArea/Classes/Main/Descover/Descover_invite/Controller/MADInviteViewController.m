//
//  MAInviteViewController.m
//  ModelArea
//
//  Created by mac on 15/8/6.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MADInviteViewController.h"

@interface MADInviteViewController ()
{
    UIScrollView *_scrollView;
}
@end

@implementation MADInviteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title =@"活动记录";
    self.navigationItem.rightBarButtonItem =[UIBarButtonItem rightItemWithTarget:self action:nil image:nil highLighted:nil];
    [self.view addSubview:self.maView];
    _scrollView =[[UIScrollView alloc]initWithFrame:CGRectMake(0, 64+54, self.view.size.width, self.view.size.height-54)];
    
    
    [_scrollView addSubview:self.reViewController.view];
    [_scrollView addSubview:self.sendViewController.view];
    
    
    _scrollView.contentSize =CGSizeMake(self.view.size.width*2, self.view.size.height-64);
    _scrollView.showsHorizontalScrollIndicator =NO;
    _scrollView.showsVerticalScrollIndicator =NO;
    _scrollView.bounces =NO;
    _scrollView.delegate =self;
    [self.view addSubview:_scrollView];
    

}
-(MDAView *)maView
{
    
    if (!_maView) {
        _maView = [[MDAView alloc]init];
        _maView.frame = CGRectMake(0, 64, self.view.frame.size.width, 50);
        [_maView.leftButton setTitle:[NSString stringWithFormat:@"收到的邀约"] forState:UIControlStateNormal];
        [_maView.rightButton setTitle:[NSString stringWithFormat:@"发去的邀约"] forState:UIControlStateNormal];
        [_maView.leftButton addTarget:self action:@selector(leftClick) forControlEvents:UIControlEventTouchUpInside];
        [_maView.rightButton addTarget:self action:@selector(rightClick) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _maView;
    
}
-(void)leftClick
{
    _reViewController.view.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-54);
   _sendViewController.view.frame=CGRectMake(self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height-54);
    
}
-(void)rightClick
{
    
    _reViewController.view.frame=CGRectMake(self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height-54);
    _sendViewController.view.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-54);
    
    
}

- (MADRecviceViewController*)reViewController
{
    
    if (!_reViewController) {
        _reViewController=[[MADRecviceViewController alloc]init];
        _reViewController.view.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-54);
        //         _myViewController.view.frame=CGRectMake(0, 0, 375, 200);
        
       _reViewController.view.backgroundColor=[UIColor brownColor];
    }
    return _reViewController;
}

- (MADSendViewController*)sendViewController
{
    if (!_sendViewController) {
        _sendViewController=[[MADSendViewController alloc]init];
        _sendViewController.view.frame=CGRectMake(self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height-54);
        //         _myViewController.view.frame=CGRectMake(0, 0, 375, 200);
        
        _sendViewController.view.backgroundColor=[UIColor redColor];
    }
    return _sendViewController;
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    
    
    if (_reViewController.view.frame.origin.x==0) {
        [ UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.3];
        if (_scrollView.contentOffset.x>0) {
            _maView.leftLabel.frame =CGRectMake(kScreenWidth/2, 50, kScreenWidth/2, 4);
            [_maView.rightButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [_maView.leftButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
            NSLog(@"qqqqqqqqqqqqqqqq");
        }
        
        else
        {
            _maView.leftLabel.frame =CGRectMake(0, 50, kScreenWidth/2, 4);
            
            [_maView.rightButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
            [_maView.leftButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            NSLog(@"wwwwwwwwwwwww");
        }
        [UIView commitAnimations];
    }
    else if (_reViewController.view.frame.origin.x!=0)
    {
        if (_scrollView.contentOffset.x==0) {
            _maView.leftLabel.frame =CGRectMake(kScreenWidth/2, 50, kScreenWidth/2, 4);
            [_maView.rightButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [_maView.leftButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
            NSLog(@"qqqqqqqqqqqqqqqq");
        }
        
        else
        {
            _maView.leftLabel.frame =CGRectMake(0, 50, kScreenWidth/2, 4);
            
            [_maView.rightButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
            [_maView.leftButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            NSLog(@"wwwwwwwwwwwww");
        }
        [UIView commitAnimations];
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
