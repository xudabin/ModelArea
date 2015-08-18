//
//  MAFriendsViewController.m
//  ModelArea
//
//  Created by mac on 15/7/28.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MADFriendsViewController.h"
#import "MDAView.h"
#import "MADModel.h"
#import "MADFansViewController.h"
@interface MADFriendsViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UIScrollView *_scrollView;
    int _num;
    NSArray *_namePhotoArray;
    NSArray *_nameArray;
    NSArray *_classArray;
    NSArray *_addressArray;
    CGRect _rect;
    
   

}

@end

@implementation MADFriendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    // Do any additional setup after loading the view.
    self.navigationItem.rightBarButtonItem =[UIBarButtonItem rightItemWithTarget:self action:@selector(search) image:[NSString stringWithFormat:@"descover_news_search"] highLighted:nil];
    self.navigationItem.title =@"好友";
    _rect =[UIScreen mainScreen].bounds;
    _namePhotoArray =@[@"friends_namePhoto",@"friends_namePhoto",@"friends_namePhoto",@"friends_namePhoto",@"friends_namePhoto",@"friends_namePhoto",@"friends_namePhoto",@"friends_namePhoto"];
    
   
   [self.view addSubview:self.maView];
   
    
    
    _scrollView =[[UIScrollView alloc]initWithFrame:CGRectMake(0, 64+54, self.view.size.width, self.view.size.height-54)];
    
    
    [_scrollView addSubview:self.fansViewController.view];
    [_scrollView addSubview:self.attentionViewController.view];
    
    
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
        _num = _maView.isLeftClick;
        [_maView.rightButton addTarget:self action:@selector(leftClick) forControlEvents:UIControlEventTouchUpInside];
        [_maView.leftButton addTarget:self action:@selector(rightClick) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _maView;
    
}
-(void)leftClick
{
//    _num =1;
//    NSLog(@"00000000000");
////    NSLog(@"%d",_num);
//    if (_maView.leftLabel.x!=0) {
//        
//        _scrollView.contentOffset =CGPointMake(self.view.frame.size.width, 0);
//    }
    _fansViewController.view.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-54);
    _attentionViewController.view.frame=CGRectMake(self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height-54);
}

-(void)rightClick
{
//    if (_maView.leftLabel.x==0) {
//        _scrollView.contentOffset =CGPointMake(-(self.view.frame.size.width), 0);
//        
//
//    }
    _fansViewController.view.frame=CGRectMake(self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height-54);
    _attentionViewController.view.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-54);
     }
-(void)search
{
    
}

- (MADAttentionViewController*)attentionViewController
{
    if (!_attentionViewController) {
        _attentionViewController=[[MADAttentionViewController alloc]init];
        _attentionViewController.view.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-54);
        //         _myViewController.view.frame=CGRectMake(0, 0, 375, 200);
        
        _attentionViewController.view.backgroundColor=[UIColor brownColor];
    }
    return _attentionViewController;
}

- (MADFansViewController*)fansViewController
{
    if (!_fansViewController) {
        _fansViewController=[[MADFansViewController alloc]init];
        _fansViewController.view.frame=CGRectMake(self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height-54);
        //         _myViewController.view.frame=CGRectMake(0, 0, 375, 200);
        
        _fansViewController.view.backgroundColor=[UIColor redColor];
    }
    return _fansViewController;
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"%f",_scrollView.contentOffset.x);
    if (_fansViewController.view.frame.origin.x==0){
    if (_scrollView.contentOffset.x>0) {
       [ UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.3];
        _maView.leftLabel.frame =CGRectMake((_rect.size.width)/2, 50, (_rect.size.width)/2, 4);
        [UIView commitAnimations];
        [_maView.rightButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_maView.leftButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    }
    else
    {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.3];
        _maView.leftLabel.frame =CGRectMake(0, 50, (_rect.size.width)/2, 4);
        [UIView commitAnimations];
        [_maView.rightButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [_maView.leftButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    }
    else if (_fansViewController.view.frame.origin.x!=0)
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
