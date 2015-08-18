//
//  MAFansViewController.m
//  ModelArea
//
//  Created by mac on 15/7/30.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MADFansViewController.h"
#import "MADTableViewCell.h"
#import "MADFriendsTableViewCell.h"
@interface MADFansViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView * _tableView;
    NSMutableDictionary * _dataDic ;
    NSArray * _sectionTitleArray ;
    NSMutableArray *_array;
   
}
@end

@implementation MADFansViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self.view addSubview:self.maView];
    _dataDic =[[NSMutableDictionary alloc]init];
    _sectionTitleArray =[[NSMutableArray alloc]init];
     _array =@[@"kdkl",@"Kitty",@"frer",@"我",@"加盟",@"哦片",@"更好",@"批评",@"成功",@"举",@"每年可怜人",@"肌肉",@"花卉业",@"笑呵呵"];
    _tableView =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.size.width, self.view.frame.size.height)];
    _tableView.delegate =self;
    _tableView.dataSource =self;
    [self.view addSubview:_tableView];
    [self sequence];
    [_tableView registerClass:[MADFriendsTableViewCell class] forCellReuseIdentifier:@"cell"];
    
}
-(void)sequence
{
    for (int i=0;i<_array.count ; i++) {
        
        NSString * firstCha = [self getFirstCharacterFromString:_array[i]];
        //找到这个首字母 对应的数组 ，把联系人加到数组中 ；
        if (_dataDic[firstCha])
        {
            //首字母 对应的数组 存在 ；
            NSMutableArray * array = _dataDic[firstCha];
            [array addObject:_array[i]];
            NSLog(@"Aaaaaaaaaaa");
        }else
        {
            //首字母 对应的数组 不存在 ；
            NSMutableArray * array = [NSMutableArray array];
            [array addObject:_array[i]];
        
            [_dataDic setObject:array forKey:firstCha];
                     }
        
    }
    NSLog(@"||||%@",_dataDic);

    _sectionTitleArray = [_dataDic allKeys];

    //按照ASCII码顺序 排序
    _sectionTitleArray = [_sectionTitleArray sortedArrayUsingSelector:@selector(compare:)];
}
-(NSString*)getFirstCharacterFromString:(NSString*)str
{
    CFStringRef string = (__bridge CFStringRef)str ;
    
    CFMutableStringRef mutableStr = CFStringCreateMutableCopy(NULL, 0, string);
    
    CFStringTransform(mutableStr, NULL, kCFStringTransformMandarinLatin, NO);
    //去除音调
    CFStringTransform(mutableStr, NULL, kCFStringTransformStripDiacritics, NO);
    NSLog(@"+++++++++%@",mutableStr);
    NSMutableString * mutableString = (__bridge NSMutableString*)mutableStr ;
    //获取首字母，同时转化为大写字母
    NSString * firstCha = [[mutableString substringToIndex:1]uppercaseString];
    CFRelease(mutableStr);
    NSLog(@"========%@",firstCha);
    return firstCha;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _sectionTitleArray.count;
    
}

-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return _sectionTitleArray[section];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //找到这个分区对应的key值，根据key值获取value数组，返回数组中元素的数目
    NSString * key = _sectionTitleArray[section];
    NSArray * array = _dataDic[key];
    return  array.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MADFriendsTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    NSString * key = _sectionTitleArray[indexPath.section];
    NSArray * array = _dataDic[key];
    cell.nameLabel.text =array[indexPath.row];
    
    
    
    
    
    
    cell.photoImageView.image =[UIImage imageNamed:[NSString stringWithFormat:@"friends_namePhoto"]];
    cell.classImageView.image =[UIImage imageNamed:[NSString stringWithFormat:@"friend_woman"]];
    cell.addressLabel.text =@"浙江.金华市";
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 50;
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
