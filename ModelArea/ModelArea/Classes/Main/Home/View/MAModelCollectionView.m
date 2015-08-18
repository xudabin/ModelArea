//
//  MAModelCollectionView.m
//  ModelArea
//
//  Created by mac on 15/8/4.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MAModelCollectionView.h"


@implementation MAModelCollectionView

+ (instancetype)modelCollectionViewWithFrame:(CGRect)frame {
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    //flow.itemSize = CGSizeMake((frame.size.width-kSpacing*5)/2, (ItemHeight-kSpacing)/2);
    flow.minimumLineSpacing = kSpacing;
    flow.minimumInteritemSpacing = kSpacing;
    
    MAModelCollectionView *collectionView = [[MAModelCollectionView alloc] initWithFrame:frame collectionViewLayout:flow];
    collectionView.backgroundColor = kDefaultTextColor;
    return collectionView;
}



@end
