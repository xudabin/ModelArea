//
//  MAFriendMessageViewController.m
//  ModelArea
//
//  Created by mac on 15/7/30.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MADFriendMessageViewController.h"
#import "MADDescoverNewsTableViewCell.h"
#import "MADNewsTableViewCell.h"
@interface MADFriendMessageViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *_nameArray;
    NSArray *_messageArray;
    NSArray *_namePhotoArray;
    NSArray *_downPhotoArray;
    NSArray *_timeArray;
    NSArray *_commentArray;
}
@end

@implementation MADFriendMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    _nameArray =@[@"Kitty",@"James",@"James",@"陈欣桐",@"霍元甲"];
    _messageArray =@[@"知道了",@"好的 明天联系你",@"好的 明天联系你",@"OK see u",@"广场见，别忘记带东西"];
    _namePhotoArray =@[@"news_peopel_photo",@"news_peopel_photo",@"news_peopel_photo",@"news_peopel_photo",@"news_peopel_photo"];
    _downPhotoArray =@[@"",@"news_HR@2x",@"news_AAA@2x",@"",@"news_HR@2x"];
    _timeArray =@[@"14:30",@"11:27",@"星期一",@"星期日",@"7:15"];
    _commentArray =@[@"33",@"5",@"5",@"1",@"5"];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem rightItemWithTarget:self action:@selector(search) image:[NSString stringWithFormat:@"descover_news_search"] highLighted:nil];
    self.navigationItem.title =@"消息中心";
    
    _tableView =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.size.width, self.view.size.height-54)];
    _tableView.delegate =self;
    _tableView.dataSource =self;
    [self.view addSubview:_tableView];
    
    //    [_tableView registerClass:[MANewsTableViewCell class] forCellReuseIdentifier:@"cell1"];
    [_tableView registerClass:[MADDescoverNewsTableViewCell class] forCellReuseIdentifier:@"cell2"];
    

}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 5;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    if (indexPath.section ==0) {
    //        MANewsTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"cell1"];
    //        [cell.leftButton setTitle:[NSString stringWithFormat:@"好友消息"] forState:UIControlStateNormal];
    //        cell.label.backgroundColor =[UIColor grayColor];
    //        [cell.rightButton setTitle:[NSString stringWithFormat:@"系统通知"] forState:UIControlStateNormal];
    //        return cell;
    //    }
    
    MADDescoverNewsTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"cell2"];
    cell.hightLabel.text =_nameArray[indexPath.row];
    // 要根据实际的情况进行设置上下的图标   即通过从数据库中的数据进行判别是会员还是模特，注册的人是男还是女
    cell.downLabel.text =_messageArray[indexPath.row];
    cell.hightImageView.image=[UIImage imageNamed:[NSString stringWithFormat:@"news_hightPhoto"]];
    cell.pictureImageView.image =[UIImage imageNamed:_namePhotoArray[indexPath.row]];
    cell.downImageView.image =[UIImage imageNamed:_downPhotoArray[indexPath.row]];
    cell.timeLabel.text =_timeArray[indexPath.row];
    [cell.commentButton setTitle:_commentArray[indexPath.row] forState:UIControlStateNormal];
    [cell.commentButton setBackgroundImage:[UIImage imageNamed:@"news_comment"] forState:UIControlStateNormal];
    return cell;
    
    
}
//-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//  UIView *view =[[UIView alloc]initWithFrame:CGRectMake(0, 0, 375, 200/2)];
//    view.backgroundColor =[UIColor whiteColor];
//    UILabel *titleOneLabel =[[UILabel alloc]initWithFrame:CGRectMake(0, 0, (view.width-1)/2, view.height)];
//    titleOneLabel.text =@"好友消息";
//    titleOneLabel.font =[UIFont systemFontOfSize:16];
//    [view addSubview:titleOneLabel];
//
//
//    return view;
//}
//-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    if (section ==0) {
//        return 0.1;
//    }
//    else
//    {
//        return 0.1;
//    }
//
//
//}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 150/2;
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
