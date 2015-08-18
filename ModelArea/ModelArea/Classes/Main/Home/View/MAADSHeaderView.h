//
//  MAADSHeaderView.h
//  ModelArea
//
//  Created by mac on 15/8/15.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import <UIKit/UIKit.h>

static const CGFloat MAADSHeaderHeight = 160;

@interface MAADSHeaderView : UICollectionReusableView

@property (nonatomic, strong) NSArray *images;


+ (NSString *)ID;

- (instancetype)initWithImages:(NSArray *)images;

@end
