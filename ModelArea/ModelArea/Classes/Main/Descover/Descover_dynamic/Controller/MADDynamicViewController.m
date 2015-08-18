//
//  MADynamicViewController.m
//  ModelArea
//
//  Created by mac on 15/7/27.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MADDynamicViewController.h"
#import "MADDynamicTableViewCell.h"
#import "MADNonePhotoTableViewCell.h"
#import "MADPhotoViewController.h"
#import "SDPhotoGroup.h"
#import "SDPhotoItem.h"
#import "DUser.h"
#import "DUserCellFrame.h"
#import "ZYQAssetPickerController.h"
@interface MADDynamicViewController ()<ZYQAssetPickerControllerDelegate,UIScrollViewDelegate>
{
    UIScrollView *src;
    
    UIPageControl *pageControl;

    
    NSArray *_nameArray;
    NSString *_string;
    int _num;
    UIAlertView *alertView;
    int _loveCount;
    }
@property (nonatomic, strong) NSArray *srcStringArray;
@property (nonatomic, strong) NSMutableArray *listArray;
@property (nonatomic,strong) NSArray *detailCommentArray;
@end

@implementation MADDynamicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    // Do any additional setup after loading the view.
  _loveCount =3;
    _detailCommentArray =@[@"hvbh :你好",@"Kitty 回复hvbh: you too",@"hvbh :在干啥呢",@"Kitty 回复hvbh:无聊中",@"hvbh :有空不？",@"Kitty 回复hvbh:有空不，咋哪，有啊",@"hvbh :请你吃饭",@"Kitty 回复hvbh:好啊，什么时候"];
    _srcStringArray = @[@"http://ww2.sinaimg.cn/thumbnail/904c2a35jw1emu3ec7kf8j20c10epjsn.jpg",
                        @"http://ww2.sinaimg.cn/thumbnail/98719e4agw1e5j49zmf21j20c80c8mxi.jpg",
                        @"http://ww2.sinaimg.cn/thumbnail/67307b53jw1epqq3bmwr6j20c80axmy5.jpg",
                        @"http://ww2.sinaimg.cn/thumbnail/9ecab84ejw1emgd5nd6eaj20c80c8q4a.jpg",
                        @"http://ww2.sinaimg.cn/thumbnail/9ecab84ejw1emgd5nd6eaj20c80c8q4a.jpg",
                        @"http://ww2.sinaimg.cn/thumbnail/642beb18gw1ep3629gfm0g206o050b2a.gif"
                        ];
    
    NSArray *array =@[@{@"userName":@"Kitty",@"userImage":@"news_peopel_photo",@"time":@"14:30",@"content":@"每一个故事都有三个版本。我的版本，你的版本，和事实。因此不能从莫一个角度看问题。",@"loveCount":@"3",@"commentCount":@"2",@"Array":_srcStringArray,@"loveImage":@"dynamic_love_hight",@"commentImage":@"dynamic_comment_hight",@"detailCommentArray":_detailCommentArray},@{@"userName":@"Kitty",@"userImage":@"news_peopel_photo",@"time":@"14:30",@"content":@"每一个故事都有三个版本。我的版本，你的版本，和事实。因此不能从莫一个角度看问题。",@"loveCount":@"3",@"commentCount":@"2",@"loveImage":@"dynamic_love_hight",@"commentImage":@"dynamic_comment_hight",@"detailCommentArray":_detailCommentArray}];
   
  
    self.listArray =[NSMutableArray arrayWithCapacity:array.count];
    for (NSDictionary *dict in array) {
        DUser *user = [DUser userWithDict:dict];
        DUserCellFrame *frame = [DUserCellFrame userFrameWithUser:user];
        [self.listArray addObject:frame];
    }

//    _nameArray =@[@"Kitty",@"徐贯中"];
//    _string =@"每一个故事都有三个版本。我的版本，你的版本，和事实。因此不能从莫一个角度看问题。";
    self.navigationItem.rightBarButtonItem =[UIBarButtonItem rightItemWithTarget:self action:@selector(rightClick) image:@"cmare" highLighted:nil];
    self.navigationItem.title =@"动态圈";
    _tableView=[[UITableView alloc]initWithFrame:self.view.bounds];
    _tableView.delegate =self;
    _tableView.dataSource =self;
    [self.view addSubview:_tableView];
    [_tableView registerClass:[MADDynamicTableViewCell class] forCellReuseIdentifier:@"cell1"];
//    [_tableView registerClass:[MANonePhotoTableViewCell class] forCellReuseIdentifier:@"cell2"];
    
    
    ////////////////////////
    
    
    

}
-(void)rightClick
{
   
        alertView =[[UIAlertView alloc]initWithTitle:nil message:nil delegate:self cancelButtonTitle:nil otherButtonTitles:@"文字",@"照片",@"相机",@"取消", nil];
        [alertView show];
    
    }

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex ==0) {
        
        
    }
    if (buttonIndex ==1) {
        
        ZYQAssetPickerController *picker = [[ZYQAssetPickerController alloc] init];
        picker.maximumNumberOfSelection = 10;
        picker.assetsFilter = [ALAssetsFilter allPhotos];
        picker.showEmptyGroups=NO;
        picker.delegate=self;
        picker.selectionFilter = [NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings) {
            if ([[(ALAsset*)evaluatedObject valueForProperty:ALAssetPropertyType] isEqual:ALAssetTypeVideo]) {
                NSTimeInterval duration = [[(ALAsset*)evaluatedObject valueForProperty:ALAssetPropertyDuration] doubleValue];
                return duration >= 5;
            } else {
                return YES;
            }
        }];
        
        [self presentViewController:picker animated:YES completion:NULL];

    }
    if (buttonIndex ==2) {
       
        
    }

    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
//    if (indexPath.row ==0) {
//         MADynamicTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell1" forIndexPath:indexPath];
//        cell.photoImageView.image =[UIImage imageNamed:[NSString stringWithFormat:@"news_peopel_photo"]];
//        cell.nameLabel.text =_nameArray[indexPath.row];
//        cell.detailTxetLabel.text =_string;
//        cell.timeLabel.text =@"14:30";
//        [cell.loveButton setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"dynamic_love_nomal"]] forState:UIControlStateNormal];
//        [cell.loveButton addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
//        [cell.commentButton addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
//        [cell.commentButton setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"dynamic_comment_nomal"]]forState:UIControlStateNormal];
////        cell.loveImageView.image =[UIImage imageNamed:[NSString stringWithFormat:@"dynamic_love_nomal"]];
////        cell.commentImageView.image =[UIImage imageNamed:[NSString stringWithFormat:@"dynamic_comment_nomal"]];
//     
//        cell.commentLabel.text =@"3";
//        cell.loveLabel.text =[NSString stringWithFormat:@"%d",_loveCount];
//        [cell.detailPhotoButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
//        
//        _num  =(int)cell.detailPhotoButton.tag;
//        
//        SDPhotoGroup *photoGroup = [[SDPhotoGroup alloc] init];
//        
//        NSMutableArray *temp = [NSMutableArray array];
//        [_srcStringArray enumerateObjectsUsingBlock:^(NSString *src, NSUInteger idx, BOOL *stop) {
//            SDPhotoItem *item = [[SDPhotoItem alloc] init];
//            item.thumbnail_pic = src;
//            
//            [temp addObject:item];
//        }];
//        
//        photoGroup.photoItemArray = [temp copy];
//        [cell.view addSubview:photoGroup];
//
//    }
//    MANonePhotoTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"cell2" forIndexPath:indexPath];
//    cell.photoImageView.image =[UIImage imageNamed:[NSString stringWithFormat:@"news_peopel_photo"]];
//    cell.nameLabel.text =_nameArray[1];
//    cell.detailTxetLabel.text =_string;
//    cell.timeLabel.text =@"14:30";
//    cell.loveImageView.image =[UIImage imageNamed:[NSString stringWithFormat:@"dynamic_love_hight"]];
//    cell.commentImageView.image =[UIImage imageNamed:[NSString stringWithFormat:@"dynamic_comment_hight"]];
//    cell.commentLabel.text =@"3";
    
 MADDynamicTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell1" forIndexPath:indexPath];
     cell.userCellFrame = self.listArray[indexPath.row];    
    return cell;
}
// 进行评论和点赞
-(void)click:(UIButton*)button
{
    if (button.tag ==1) {
        NSLog(@"-------------");
      
        NSLog(@"%d",_loveCount);
        [_tableView reloadData];
    }
    if (button.tag ==2) {
        NSLog(@"++++++++++=");
    }
}
-(void)buttonClick:(UIButton*)button

{
    NSLog(@"11111");
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    CGRect rect =[UIScreen mainScreen].bounds;
//    
//    if (indexPath.row ==0) {
//        return 100+(rect.size.width-120)/3*2+40+15/2;
//    }
//    
//    return 100+40;
    DUserCellFrame *frame = self.listArray[indexPath.row];
    return frame.cellHeight;

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
