//
//  MAMainViewController.m
//  ModelArea
//
//  Created by mac on 15/8/14.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MAMainViewController.h"
#import "MAModelCollectionView.h"
#import "MAHeaderView.h"

static NSString *ID = @"Cell";

@interface MAMainViewController () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate>
@property (strong, nonatomic) MAModelCollectionView *collectionView;
@end

@implementation MAMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = kTABLEVIEW_BACKGROUND;
    
    self.collectionView = [MAModelCollectionView modelCollectionViewWithFrame:self.view.bounds];
    self.collectionView.delegate = self;
    self.collectionView.dataSource  = self;
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:ID];
    //注册头视图
    [self.collectionView registerClass:[MAHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:[MAHeaderView ID]];
    
    [self.view addSubview:self.collectionView];
}

#pragma mark - collection view datasource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 4;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section == 0) {
        return 0;
    }
    if (section == 1) {
        return 6;
    }
    
    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    return cell;
}

#pragma mark - collection view delegate

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(kSpacing, kSpacing, kSpacing, kSpacing);
}

//- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
//    // NSLog(@"selected at row: %zd", indexPath.row);
//    MAModelInfoTableViewController *infoVC = [[MAModelInfoTableViewController alloc]init];
//    
//    infoVC.model = self.dataList[indexPath.row];
//    [self.navigationController pushViewController:infoVC animated:YES];
//    
//}

//返回可重用的头视图
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    MAHeaderView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                                                              withReuseIdentifier:[MAHeaderView ID] forIndexPath:indexPath];
    //header.backgroundColor = kTABLEVIEW_BACKGROUND;
    if (indexPath.section == 1) {
       // header.color = kRecommendColor;
        header.title = @"本周推荐";
        header.imageNamed = @"home_more_yellow_icon";
    }
    //[header addTarget:self action:@selector(moreModelAction)];
    return header;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    CGSize size = {self.view.frame.size.width,44};
    if (section == 0) {
        size = CGSizeMake(self.view.width, 140);
    }
    return size;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGSize size = CGSizeZero;
    if (indexPath.section == 1) {
        size = CGSizeMake((self.view.width-kSpacing*3)/2, 100);
    }
    else {
        size = CGSizeMake(self.view.width, 120);
    }
    
    return size;
}

@end
