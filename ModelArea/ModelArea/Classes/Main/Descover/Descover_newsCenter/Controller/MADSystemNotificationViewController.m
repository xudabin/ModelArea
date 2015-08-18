//
//  MASystemNotificationViewController.m
//  ModelArea
//
//  Created by mac on 15/7/30.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MADSystemNotificationViewController.h"
#import "MADDescoverNewsTableViewCell.h"
@interface MADSystemNotificationViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *_nameArray;
    NSArray *_messageArray;
    NSArray *_namePhotoArray;
    NSArray *_downPhotoArray;
    NSArray *_timeArray;
    NSArray *_commentArray;

}
@end

@implementation MADSystemNotificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _nameArray =@[@"Kitty",@"James",@"James",@"陈欣桐",@"霍元甲"];
    _messageArray =@[@"知道了",@"好的 明天联系你",@"好的 明天联系你",@"OK see u",@"广场见，别忘记带东西"];
    _namePhotoArray =@[@"news_peopel_photo",@"news_peopel_photo",@"news_peopel_photo",@"news_peopel_photo",@"news_peopel_photo"];
    _downPhotoArray =@[@"",@"news_HR@2x",@"news_AAA@2x",@"",@"news_HR@2x"];
    _timeArray =@[@"14:30",@"11:27",@"星期一",@"星期日",@"7:15"];
    _commentArray =@[@"33",@"5",@"5",@"1",@"5"];

    // Do any additional setup after loading the view.
    _tableView =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.size.width, self.view.size.height-54)];
    _tableView.delegate =self;
    _tableView.dataSource =self;
    [self.view addSubview:_tableView];
    [_tableView registerClass:[MADDescoverNewsTableViewCell class] forCellReuseIdentifier:@"cell"];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   MADDescoverNewsTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.downLabel.text =_messageArray[indexPath.row];
    cell.hightImageView.image=[UIImage imageNamed:[NSString stringWithFormat:@"news_hightPhoto"]];
    cell.pictureImageView.image =[UIImage imageNamed:_namePhotoArray[indexPath.row]];
    cell.downImageView.image =[UIImage imageNamed:_downPhotoArray[indexPath.row]];
    cell.timeLabel.text =_timeArray[indexPath.row];
    [cell.commentButton setTitle:_commentArray[indexPath.row] forState:UIControlStateNormal];
    [cell.commentButton setBackgroundImage:[UIImage imageNamed:@"news_comment"] forState:UIControlStateNormal];

       return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 75;
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
