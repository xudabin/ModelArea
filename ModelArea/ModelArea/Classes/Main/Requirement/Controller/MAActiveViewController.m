//
//  MAActiveViewController.m
//  ModelArea
//
//  Created by 123 on 15/8/3.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MAActiveViewController.h"
#import "MAHeader.h"

@interface MAActiveViewController ()<UITableViewDataSource,UITableViewDelegate>
{
//  _messageArray 有多少评论
    NSMutableArray*_messageArray;
}
@end

@implementation MAActiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"_________________________%d",self.didSelectedRow);
    self.title=@"北京车展模特";
    
//  发送请求获取数据
    
    
    
    
    
    
    
    
    
// 布表
    //   布局表
    UITableView*tableView=[[UITableView alloc]initWithFrame:CG(0, 0, kWindowWidth,600*PROPERTION_Y) style:UITableViewStylePlain];
    
    tableView.delegate=self;
    tableView.dataSource=self;
    //设置 行高
//    tableView.rowHeight = 150 ;
    [self.view addSubview:tableView];
    _messageArray=[[NSMutableArray alloc]initWithObjects:@"1",@"2",@"3",@"4", nil];
    
    
//  报名按钮
    UIButton*signupBut=[[UIButton alloc]initWithFrame:CG(30,600, 120, 34)];
    [signupBut setBackgroundImage:[UIImage imageNamed:@"baoming_2.png"] forState:UIControlStateNormal];
    [signupBut setBackgroundImage:[UIImage imageNamed:@"baoming_1.png"] forState:UIControlStateSelected];
    signupBut.backgroundColor=[UIColor orangeColor];
    [signupBut addTarget:self action:@selector(signupButClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:signupBut];
    
    
//留言按钮
    UIButton*leaveMessageBut=[[UIButton alloc]initWithFrame:CG(200,600, 120, 34)];
    [leaveMessageBut setBackgroundImage:[UIImage imageNamed:@"liuyan_2.png"] forState:UIControlStateNormal];
    [leaveMessageBut setBackgroundImage:[UIImage imageNamed:@"liuyan_1.png"] forState:UIControlStateSelected];
    leaveMessageBut.backgroundColor=[UIColor orangeColor];
    [leaveMessageBut addTarget:self action:@selector(leaveMessageBut:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:leaveMessageBut];
 }

#pragma mark-----------
#pragma mark-----------报名按钮\留言按钮的调用方法

//留言按钮的调用方法
- (void)leaveMessageBut:(UIButton*)sender
{
    sender.selected=YES;
}
//报名按钮调用的方法
- (void)signupButClick:(UIButton*)sender
{
    sender.selected=YES;
}

#pragma mark-----------
#pragma mark-----------表的协议方法

//有多少个分区
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
//每个区有多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section!=2) {
        return 1;
    }
    return _messageArray.count;
}
//单元格的调用方法
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        MAReqActTableViewCell*cell=[[MAReqActTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        //
        cell.delegate = self;
        [cell.companyButton setBackgroundImage:[UIImage imageNamed:@"圆角矩形 6@2X.png"] forState:UIControlStateNormal];
        cell.timeLabel.text=@"2015.6.30";
        cell.budgetLabel.text=@"500-1000元";
        cell.typeLabel.text=@"车展模特";
        cell.numLabel.text=@"20人";
        cell.addressLabel.text=@"浙江金华";
        cell.explainLabel.text=@"要求身高170cm以上，有相关模特经验地点北京";
        [cell.rankButton setBackgroundImage:[UIImage imageNamed:@"icon-009.png"] forState:UIControlStateNormal];
        return cell;

    }
    if (indexPath.section==1) {
        MAAlreadyTableViewCell*cell=[[MAAlreadyTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        //
        cell.delegate = self;
        [cell.photoButton1 setBackgroundImage:[UIImage imageNamed:@"圆角矩形 6@2X.png"] forState:UIControlStateNormal];
        [cell.photoButton2 setBackgroundImage:[UIImage imageNamed:@"圆角矩形 6@2X.png"] forState:UIControlStateNormal];
        [cell.photoButton3 setBackgroundImage:[UIImage imageNamed:@"圆角矩形 6@2X.png"] forState:UIControlStateNormal];
        [cell.photoButton4 setBackgroundImage:[UIImage imageNamed:@"圆角矩形 6@2X.png"] forState:UIControlStateNormal];
        return cell;
        
    }
    
    else {
        MALeaveMessageTableViewCell*cell=[[MALeaveMessageTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.delegate = self;
        [cell.photoButton1 setBackgroundImage:[UIImage imageNamed:@"圆角矩形 6@2X.png"] forState:UIControlStateNormal];
        cell.nameLabel.text=@"11111";
        cell.explainLabel.text=@"今天天气不错";
        return cell;
    }
}
//区头高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section==2) {
        return 35;
    }
    return 0 ;
}
//区尾的高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10;
}
//第2区的区头视图
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
     UIView*view=[[UIView alloc]initWithFrame:CG(0, 0, kWindowWidth, 35)];
     if (section==2) {
        UILabel*label=[[UILabel alloc]initWithFrame:CGRectMake(15, 0, 60, 35)];
        label.text=@"留言板";
        [view addSubview:label];
    }
    return view;
}
//每个单元格的行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        return 150;
    }
    if (indexPath.section==1) {
        return 120;
    }
    return 100;
}

#pragma mark-----------
#pragma mark-----------代理的协议方法
//第一个分区第一行的图像被点击时调用的方法
- (void)customAlertView:(MAReqActTableViewCell *)customAlertView clickButtonTag:(NSInteger)buttonTag
{
//    点击的是大照片
    NSLog(@"1234567890");
}
//第二个分区第一行的四个图像被点击时调用的方法，以及点击更多按钮的时候调用的方法
- (void)customView:(MAAlreadyTableViewCell *)customView clickButtonTag:(NSInteger)buttonTag
{
    
    NSLog(@"buttonTag===%ld",buttonTag);
    
    NSLog(@"123456dfghj");
}
//第三个分区图像被点击时调用的方法，
- (void)customLeaveMessageView:(MALeaveMessageTableViewCell *)customView clickButtonTag:(NSInteger)buttonTag
{
    NSLog(@"buttonTag===%ld",buttonTag);
    NSLog(@"1234+++++++56dfghj");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
