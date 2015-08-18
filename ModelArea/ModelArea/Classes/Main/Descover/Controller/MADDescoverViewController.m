//
//  MADescoverViewController.m
//  ModelArea
//
//  Created by mac on 15/7/24.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MADDescoverViewController.h"
#import "MADDescoverTableViewCell.h"
#import "MADNewViewController.h"
#import "MADDynamicViewController.h"
#import "MADFriendsViewController.h"
#import "MADActivityViewController.h"
#import "MADInviteViewController.h"
@interface MADDescoverViewController ()
{
    NSArray *_sectionOneArray;
    NSArray *_sectionTwoArray;
    NSArray *_sectionThreeArray;
    NSArray *_photoOneArray;
    NSArray *_photoTwoArray;
}
@end

@implementation MADDescoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
   
    //  判断是会员登录还是模特登陆
/*
 
 
 
  
*/

    _sectionOneArray =@[@"信息中心"];
    _sectionTwoArray =@[@"动态圈",@"好友"];
    _sectionThreeArray =@[@"活动记录",@"要约纪录"];
    _photoOneArray =@[@"descover_dynamic",@"descover_friends"];
    _photoTwoArray =@[@"descover_requment",@"descover_invite_record"];
    
    // 创建一个表
   _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.dataSource =self;
    _tableView.delegate =self;
    [self.view addSubview:_tableView];
   
   
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section ==0) {
        return 1;
    }
    if (section ==1) {
        return 2;
    }
    else
    {
        return 2;
    
    }
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MADDescoverTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"cell" ];
    if (!cell) {
        cell =[[MADDescoverTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    cell.separatorInset = UIEdgeInsetsZero;
    if (indexPath.section ==0) {
       cell.nameLabel.text =_sectionOneArray[indexPath.row];
        cell.photoImageView.image =[UIImage imageNamed:[NSString stringWithFormat:@"descover_news"]];
    }
    if (indexPath.section ==1) {
        cell.nameLabel.text =_sectionTwoArray[indexPath.row];
        cell.photoImageView.image =[UIImage imageNamed:_photoOneArray[indexPath.row]];
    }
    else if (indexPath.section ==2){
        cell.nameLabel.text =_sectionThreeArray[indexPath.row];
        cell.photoImageView.image =[UIImage imageNamed:_photoTwoArray[indexPath.row]];
    }
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section ==0) {
        return 10;
    }
    if (section ==1) {
        return 1;
    }
    else
    {
        return 1;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80/2;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section ==0) {
        MADNewViewController *newViewController =[[MADNewViewController alloc]init];
        [self.navigationController pushViewController:newViewController animated:YES];
    }
    if (indexPath.section ==1&&indexPath.row ==0) {
        
        MADDynamicViewController *dynamicViewController =[[MADDynamicViewController alloc]init];
        [self.navigationController pushViewController:dynamicViewController animated:YES];
    }
    if (indexPath.section ==1&&indexPath.row ==1) {
        MADFriendsViewController *friendViewController =[[MADFriendsViewController alloc]init];
        [self.navigationController pushViewController:friendViewController animated:YES];
    }
    if (indexPath.section ==2&&indexPath.row ==0) {
        MADActivityViewController *acViewController =[[MADActivityViewController alloc]init];
        [self.navigationController pushViewController:acViewController animated:YES];
    }
    if (indexPath.section ==2&&indexPath.row ==1) {
        MADInviteViewController *inViewController =[[MADInviteViewController alloc]init];
        [self.navigationController pushViewController:inViewController animated:YES];
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
