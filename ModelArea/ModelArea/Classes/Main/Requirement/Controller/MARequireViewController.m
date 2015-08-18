//
//  MARequireViewController.m
//  ModelArea
//
//  Created by 123 on 15/7/28.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MARequireViewController.h"

@interface MARequireViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    int _isclick;
    NSMutableArray* _keyArray;
    NSMutableArray*_dateArray;
    MAReqView*_alertView;
    
    UIButton*_oldButton;
    
    UIView*_view;
}

@property(nonatomic,assign)BOOL isOpen;
@property(nonatomic,strong)UIImageView*imageView;
@property(nonatomic,strong)UIView*chouse;
@property(nonatomic,strong)NSMutableArray*imageArray;

@end

@implementation MARequireViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    导航栏
    self.view.backgroundColor=[UIColor whiteColor];
    self.title=@"需求市场";
    _isclick=0;
    
//    //    数组：标题
  NSMutableArray  * occupationArray = [[NSMutableArray alloc] initWithObjects:@"摄影师",@"化妆师",@"模特",@"商户", nil];
  NSMutableArray  *priceArray = [[NSMutableArray alloc] initWithObjects:@"100-300",@"300-500",@"500-1k",@"1k以上", nil];

    _keyArray=[[NSMutableArray alloc]initWithObjects:occupationArray,priceArray, nil];
    
//   布局表
    UITableView*tableView=[[UITableView alloc]initWithFrame:CG(0, 40, kWindowWidth, 575*PROPERTION_Y) style:UITableViewStylePlain];
    
    tableView.delegate=self;
    tableView.dataSource=self;
    //设置 行高
    tableView.rowHeight = 110*PROPERTION_X ;
    [self.view addSubview:tableView];
//    布局表的数组
    _dateArray=[[NSMutableArray alloc]initWithObjects:@"1",@"2",@"3",@"4",@"5", nil];
    
//---------------------------------------------
    
    NSMutableArray*menuTitle=[[NSMutableArray alloc]initWithObjects:@"职业",@"价格", nil];
    
    for (int i=0; i<2; i++) {
        UIButton* btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        btn.frame = CG((22+100*i), 70, 100, 44);
        [btn setTitle:menuTitle[i] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag=i+1;
        [self.view addSubview:btn];

    }
    
    
    UIButton* andbtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    andbtn.frame = CG((22+100*3), 70, 44, 44);
//    andbtn.backgroundColor = [UIColor cyanColor];
   [andbtn setTitle:@"+" forState:UIControlStateNormal];
    [andbtn  setBackgroundImage:[UIImage imageNamed:@"iocn-047.png.png"] forState:UIControlStateNormal];
    [andbtn addTarget:self action:@selector(andbtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:andbtn];
    
 }



#pragma mark-----------
#pragma mark-----------职业 价格按钮 ➕调用的方法
//点击➕调用的方法
- (void)andbtnClick
{
//    跳转到下一界面
    MAIssueViewController*vc=[[MAIssueViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
}
//职业 价格按钮被点击时调用的方法
- (void)btnClick:(UIButton*)sender
{
    if (_oldButton==sender) {
        
         [_alertView removeFromSuperview];
        _oldButton=nil;
    }
    
    else{
        if (_isclick)
        {
            [_alertView removeFromSuperview];
        }
        _isclick=1;
        NSMutableArray*aArray=_keyArray[sender.tag-1];
        _alertView=[[MAReqView alloc]initWithCustomAlertViewButtonTag:(int)sender.tag withArray:aArray];
        NSLog(@"++++%p+++++",aArray);
        //    设置代理
        _alertView.delegate = self;
        [self.view addSubview:_alertView];
        _oldButton=sender;

    }
    
    
}

#pragma mark-----------
#pragma mark-----------职业 价格按钮 被点击后展开的视图弹出选项后，里面按钮被点击后调用的方法
//弹出选项后的代理方法
- (void)customAlertView:(MAReqView *)customAlertView clickButtonTag:(NSInteger)buttonTag
{
    
    NSLog(@"buttonTag+++++++++=%d_________",(int)buttonTag);
//    10 11 12 13 化妆师
   
    NSMutableArray*modelArray=[[NSMutableArray alloc]initWithObjects:@"特定类型模特",@"展会模特",@"礼仪模特",@"T台模特",@"人体模特",@"平面模特",@"肢体模特", nil];
    NSMutableArray*photographerArray=[[NSMutableArray alloc]initWithObjects:@"肖像摄影师",@"人体摄影师",@"广告摄影师",@"静物摄影师",@"电影摄影师",@"舞台摄影师",@"平面摄影师",@"婚礼摄影师", nil];
    
     NSMutableArray*artistArray=[[NSMutableArray alloc]initWithObjects:@"剧组化妆",@"舞台化妆",@"生活化妆",@"婚礼化妆",@"摄影化妆", nil];
    
    if (buttonTag == 10) {
        [self getChouseWithArray:modelArray];
    }
    if (buttonTag == 11) {
        [self getChouseWithArray:photographerArray];

    }
    if (buttonTag == 12){
        [self getChouseWithArray:artistArray];
    }
    NSLog(@"=======%d+++++++",(int)buttonTag);
    _oldButton=nil;
    _isclick=0;
}





- (void)getChouseWithArray:(NSMutableArray*)array
{
    
    _view=[[UIView alloc]init];
    _view.frame = CG(0, 110, kWindowWidth, 110);
    _view.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:_view];
    
    
   
    for (int m=0; m<4; m++) {
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeSystem];
        btn.frame = CGRectMake(10+m%3*120,10+m/3*50, 100, 50);
        [btn setTitle:array[m] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(abuttonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [_view addSubview:btn];
    }

}
- (void)abuttonClick:(UIButton*)sender
{
    [_view removeFromSuperview];
    
    
    
    
}








#pragma mark--------
#pragma mark--------表的协议方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MARequireTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell)
    {
        cell = [[MARequireTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    //获取 这一行 对应的数据
//    MAReqPeople * news =   _dataArray[indexPath.row];
    
//    cell.titleLabel.text = news.title ;
//    cell.detailLabel.text = news.detail ;
//    cell.newsImageView.image = [UIImage imageNamed:news.imageName];
//    [cell.commentButton setTitle:news.commentNum forState:UIControlStateNormal];
//    [cell.commentButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
//    
//    cell.commentButton.tag = indexPath.row ;
    
    cell.photoImageView.image=[UIImage imageNamed:@"圆角矩形 6.png"];
    cell.timeLabel.text=@"2015.6.30";
    cell.budgetLabel.text=@"300-500";
    cell.typeLabel.text=@"礼仪模特";
    cell.numLabel.text=@"2人";
    cell.remarksLabel.text=@"身高165cm以上，脸型以瓜子脸";
    return cell ;

}
//选种某一行
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"didSelectRowAtIndexPath=====%d",(int)indexPath.row);

    MAActiveViewController*vc=[[MAActiveViewController alloc]init];
    vc.didSelectedRow=(int)indexPath.row;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
