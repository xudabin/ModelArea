//
//  MANewViewController.m
//  ModelArea
//
//  Created by mac on 15/7/26.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MADNewViewController.h"
#import "MADSearchViewController.h"
@interface MADNewViewController ()
{
     UIScrollView *_scrollView;
     CGRect _rect;
}
@end

@implementation MADNewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self.view addSubview:self.maView];
    
   self.navigationItem.rightBarButtonItem =[UIBarButtonItem rightItemWithTarget:self action:@selector(search) image:[NSString stringWithFormat:@"descover_news_search"] highLighted:nil];
    _scrollView =[[UIScrollView alloc]initWithFrame:CGRectMake(0, 64+54, self.view.size.width, self.view.size.height-54)];
    _rect =[UIScreen mainScreen].bounds;
    
    [_scrollView addSubview:self.FMViewController.view];
    [_scrollView addSubview:self.SNViewController.view];
    
    
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
        [_maView.leftButton setTitle:[NSString stringWithFormat:@"好友消息"] forState:UIControlStateNormal];
        [_maView.rightButton setTitle:[NSString stringWithFormat:@"系统通知"] forState:UIControlStateNormal];
        [_maView.leftButton addTarget:self action:@selector(leftClick) forControlEvents:UIControlEventTouchUpInside];
        [_maView.rightButton addTarget:self action:@selector(rightClick) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _maView;
    
}
-(void)leftClick
{
    _FMViewController.view.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-54);
    _SNViewController.view.frame=CGRectMake(self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height-54);
     NSLog(@"%f",_FMViewController.view.frame.origin.x);
}
-(void)rightClick
{
  
    _FMViewController.view.frame=CGRectMake(self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height-54);
    _SNViewController.view.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-54);
       NSLog(@"%f",_FMViewController.view.frame.origin.x);
    NSLog(@"rrrrrrrrrr");
    
}

- (MADFriendMessageViewController*)FMViewController
{
   
    if (!_FMViewController) {
        _FMViewController=[[MADFriendMessageViewController alloc]init];
        _FMViewController.view.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-54);
        //         _myViewController.view.frame=CGRectMake(0, 0, 375, 200);
        
        _FMViewController.view.backgroundColor=[UIColor brownColor];
    }
    return _FMViewController;
}

- (MADSystemNotificationViewController*)SNViewController
{
    if (!_SNViewController) {
        _SNViewController=[[MADSystemNotificationViewController alloc]init];
        _SNViewController.view.frame=CGRectMake(self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height-54);
        //         _myViewController.view.frame=CGRectMake(0, 0, 375, 200);
        
        _SNViewController.view.backgroundColor=[UIColor redColor];
    }
    return _SNViewController;
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
 
    
       if (_FMViewController.view.frame.origin.x==0) {
        [ UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.3];
        if (_scrollView.contentOffset.x>0) {
            _maView.leftLabel.frame =CGRectMake((_rect.size.width)/2, 50, (_rect.size.width)/2, 4);
            [_maView.rightButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [_maView.leftButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
            NSLog(@"qqqqqqqqqqqqqqqq");
        }
        
        else
        {
            _maView.leftLabel.frame =CGRectMake(0, 50, (_rect.size.width)/2, 4);
            
            [_maView.rightButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
            [_maView.leftButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            NSLog(@"wwwwwwwwwwwww");
        }
        [UIView commitAnimations];
    }
    else if (_FMViewController.view.frame.origin.x!=0)
    {
        if (_scrollView.contentOffset.x==0) {
            _maView.leftLabel.frame =CGRectMake((_rect.size.width)/2, 50, (_rect.size.width)/2, 4);
            [_maView.rightButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [_maView.leftButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
            NSLog(@"qqqqqqqqqqqqqqqq");
        }
        
        else
        {
            _maView.leftLabel.frame =CGRectMake(0, 50, (_rect.size.width)/2, 4);
            
            [_maView.rightButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
            [_maView.leftButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            NSLog(@"wwwwwwwwwwwww");
        }
        [UIView commitAnimations];
 
    }
}
-(void)search
{
    MADSearchViewController *vc =[[MADSearchViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
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
