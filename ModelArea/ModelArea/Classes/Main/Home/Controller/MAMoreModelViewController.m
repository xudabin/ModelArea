//
//  MAMoreModelViewController.m
//  ModelArea
//
//  Created by mac on 15/7/31.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MAMoreModelViewController.h"
#import "MAModelCell.h"
#import "MAModelInfoTableViewController.h"
#import "MJRefresh.h"

static NSString *ID = @"Cell";
static const CGFloat OFFSET_X = 5;
static const CGFloat ITEM_HEIGHT = 180;

@interface MAMoreModelViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
@property (strong, nonatomic) UICollectionView *collectionView;
@end

@implementation MAMoreModelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    flow.itemSize = CGSizeMake((kScreenWidth - OFFSET_X * 2-10)/2, ITEM_HEIGHT);
    flow.minimumLineSpacing = 10;
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:flow];
    self.collectionView.backgroundColor = kTABLEVIEW_BACKGROUND;
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.view addSubview:_collectionView];
    
    [self.collectionView registerNib:[MAModelCell nib] forCellWithReuseIdentifier:[MAModelCell ID]];
    
    //添加下拉刷新
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        NSLog(@"shuagxing");
        //[header endRefreshing];
    }];
    header.lastUpdatedTimeLabel.hidden = YES;
    self.collectionView.header = header;
    
    //添加下拉刷新
    self.collectionView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        
    }];    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    

}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 16;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    MAModelCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[MAModelCell ID] forIndexPath:indexPath];
    
    return cell;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(5, OFFSET_X, 5, OFFSET_X);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
   // NSLog(@"selected at row: %zd", indexPath.row);
    MAModelInfoTableViewController *infoVC = [[MAModelInfoTableViewController alloc]init];
    
    //infoVC.model = self.dataList[indexPath.row];
    [self.navigationController pushViewController:infoVC animated:YES];

}

@end
