//
//  InitiateViewController.m
//  ModelArea
//
//  Created by 徐斌 on 15/8/6.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MADInitiateViewController.h"
#import "MADActivityTableViewCell.h"
@interface MADInitiateViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
    NSArray *_resultArray;
}
@end

@implementation MADInitiateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _resultArray =@[@"已有3人报名",@"无人报名",@"已有10人报名"];
    _tableView =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.size.width, self.view.size.height-54)];
    _tableView.delegate =self;
    _tableView.dataSource =self;
    [self.view addSubview:_tableView];
    [_tableView registerClass:[MADActivityTableViewCell class] forCellReuseIdentifier:@"cell"];
    

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _resultArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MADActivityTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    [cell.imageButton setBackgroundImage:[UIImage imageNamed:@"photo"] forState:UIControlStateNormal];
    cell.actitiyLabel.text =@"报名的北京车展的活动";
    cell.resultLabel.text =_resultArray[indexPath.row];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
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
