//
//  MACtiiesView.h
//  ModelArea
//
//  Created by mac on 15/8/5.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MACitiesView;
@protocol MACitiesViewDelegate <NSObject>

@optional
- (void)cityView:(MACitiesView *)view didSelectedCity:(NSString*)city;

@end

@interface MACitiesView : UIView

@property (strong, nonatomic) NSArray *data;
@property (weak, nonatomic) id<MACitiesViewDelegate> delegate;


+ (CGFloat)rowHeight;


@end
