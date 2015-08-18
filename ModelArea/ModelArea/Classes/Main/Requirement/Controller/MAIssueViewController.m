//
//  MAIssueViewController.m
//  ModelArea
//
//  Created by 123 on 15/8/3.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//
//发布界面
#import "MAIssueViewController.h"
#import "MAHeader.h"
@interface MAIssueViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray*_tfarray;
    
    MASendTwoTableViewCell*_timeCell;
    
    
     CalendarHomeViewController *chvc;
    
    
    MASendView*_alertView;

    UIView*_view;
}
@end

@implementation MAIssueViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     self.title=@"发布";
    NSMutableArray*array0=[[NSMutableArray alloc]initWithObjects:@"请输入活动名称",@"请选择邀请时间",@"请选择活动地点", nil];
    NSMutableArray*array1=[[NSMutableArray alloc]initWithObjects:@"请输入活动预算",@"增加活动类型",@"增加需求人数", nil];
     NSMutableArray*array2=[[NSMutableArray alloc]initWithObjects:@"填写活动说明", nil];
    _tfarray=[[NSMutableArray alloc]initWithObjects:array0,array1,array2, nil];
    
    
    
    
//    UITableView*tabelView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 375, 600)];
    UITableView*tabelView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, kWindowWidth, 600*PROPERTION_Y) style:UITableViewStyleGrouped];
    tabelView.dataSource=self;
    tabelView.delegate=self;
//    tabelView.backgroundColor=[UIColor lightGrayColor];
    [self.view addSubview:tabelView];
    
    
    
    //  报名按钮
    UIButton*sendBut=[[UIButton alloc]initWithFrame:CG(0,600,kWindowWidth, 44)];
    [sendBut setBackgroundImage:[UIImage imageNamed:@"btn-011-n@2x.png"] forState:UIControlStateNormal];
    [sendBut setBackgroundImage:[UIImage imageNamed:@"btn-011-d@2x.png"] forState:UIControlStateSelected];
    sendBut.backgroundColor=[UIColor orangeColor];
    [sendBut addTarget:self action:@selector(sendButClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:sendBut];
    
    
    
    
    
    
    
    
    
    
     
}
- (void)sendButClick:(UIButton*)sender
{
    sender.selected=YES;
    
    NSLog(@"qqqqqqqq");
    
    
    NSMutableArray*aArray=[[NSMutableArray alloc]initWithObjects:@"1", nil];
    
    _alertView=[[MASendView alloc]initWithCustomAlertViewButtonTag:(int)sender.tag withArray:aArray];
    //    设置代理
    _alertView.delegate = self;
    [self.view addSubview:_alertView];
    
  }



- (void)customAlertView:(MASendView *)customAlertView clickButtonTag:(NSInteger)buttonTag
{
    NSLog(@"11111111111+++++buttonTag=%d",(int)buttonTag);
    
    if (buttonTag==99) {
//        点击是
        [self myviewWithstr];
    }
    
}



- (void)myviewWithstr
{
    
    
    
     NSLog(@"222222222222222222222");
    
    
    
    
    _view=[[UIView alloc]init];
    _view.frame = CG(60, 400, 200*PROPERTION_X, 200*PROPERTION_Y);
    _view.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:_view];
//    NSString*str1;
//    str1=@"11111";
//
//    UILabel*label=[[UILabel alloc]initWithFrame:CGRectMake(20, 5,200, 40)];
//    label.text=str1;
//    [view addSubview:label];
    
    
    NSString*str=@"您需要缴纳活动所需要的费用30%的保证金，为3000元是否确定缴纳";
    CGSize size = [self getSizeWithMessage:str];
    float m= size.height;
    UILabel*label1=[[UILabel alloc]initWithFrame:CG(20, 5,170*PROPERTION_X, (m+20)*PROPERTION_Y)];
    label1.text=str;
    
    label1.numberOfLines=0;
    
    [_view addSubview:label1];
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CG(20,150,50, 50);
//    btn.backgroundColor=[UIColor orangeColor];
    [btn setTitle:@"是" forState:UIControlStateNormal];
    btn.tag=221;
    [btn addTarget:self action:@selector(abuttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [_view addSubview:btn];
    
    
    UIButton * btn1 = [UIButton buttonWithType:UIButtonTypeSystem];
    btn1.frame = CG(130,150,50, 50);
//    btn1.backgroundColor=[UIColor orangeColor];
    [btn1 setTitle:@"否" forState:UIControlStateNormal];
    btn1.tag=222;
    [btn1 addTarget:self action:@selector(abuttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [_view addSubview:btn1];

    
    
    
    
    
    
    
    
    
    
}
- (void)abuttonClick:(UIButton*)but
{
    NSLog(@"saaaaaaa");
    NSLog(@"33333333");
    [_view removeFromSuperview];
}

-(CGSize)getSizeWithMessage:(NSString*)message
{
    //第一个参数：限定绘制空间的大小，一般限定宽度，高度不限
    //第二个参数：绘制选项，一般选NSStringDrawingUsesLineFragmentOrigin
    //第三个参数：属性信息；
    //第四个参数：上下文信息，一般填 nil
    return  [message boundingRectWithSize:CGSizeMake(170*PROPERTION_X, LONG_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObject:[UIFont systemFontOfSize:17] forKey:NSFontAttributeName] context:nil].size;
}








- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _tfarray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSMutableArray*array=_tfarray[section];
    return array.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//
     NSMutableArray*array=_tfarray[indexPath.section];
    if (indexPath.section==0&&indexPath.row==1) {
       
        _timeCell=[[MASendTwoTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        [_timeCell.myphotoButton setTitle:array[indexPath.row]forState:UIControlStateNormal];
        _timeCell.delegate = self;
        return _timeCell;
    }
    if (indexPath.section==0&&indexPath.row==2) {
        
     MASendThreeTableViewCell  * acell=[[MASendThreeTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        [acell.myphotoButton setTitle:array[indexPath.row]forState:UIControlStateNormal];
        
        
        NSString*str=[NSString stringWithFormat:@"%d%d",(int)indexPath.section+1,(int)indexPath.row+1];
        int m = [str intValue];
        acell.myphotoButton.tag=m;
        
        acell.delegate = self;
        return acell;
    }

   
      MASendTableViewCell*cell1=[[MASendTableViewCell alloc]init];
   
      cell1.textField.placeholder=array[indexPath.row];
      return cell1;
    
}

- (void)sendTwoTableView:(MASendTwoTableViewCell *)customView clickButtonTag:(NSInteger)buttonTag
{
     NSLog(@"__--_----_-_---------");
//    [cell.myphotoButton setTitle:@"1" forState:UIControlStateNormal];
    
    
    self.navigationController.navigationBar.tintColor = COLOR_THEME;
    self.navigationItem.title = @"";
    
    if (!chvc) {
        
        chvc = [[CalendarHomeViewController alloc]init];
        
        chvc.calendartitle = @"日期";
        
        [chvc setAirPlaneToDay:365 ToDateforString:nil];//飞机初始化方法
        
    }
     
    chvc.calendarblock = ^(CalendarDayModel *model){
        
            [_timeCell.myphotoButton setTitle:[NSString stringWithFormat:@"%@ %@ %@",[model toString],[model getWeek],model.holiday] forState:UIControlStateNormal];
            };
    
    [self.navigationController pushViewController:chvc animated:YES];
    
    
}

- (void)sendThreeTableView:(MASendThreeTableViewCell *)customView clickButtonTag:(NSInteger)buttonTag
{
   
    NSLog(@"qqqqqqqq");
    NSLog(@"+++++____---%d",(int)buttonTag);
    
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//- (void)sendTableViewMessageView:(MASendTableViewCell *)customView clickButtonTag:(NSInteger)buttonTag
//{
//    NSLog(@"__--_----_-_---------");
//}
//
@end
