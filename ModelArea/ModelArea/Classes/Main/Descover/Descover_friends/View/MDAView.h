//
//  MAView.h
//  ModelArea
//
//  Created by mac on 15/7/28.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MDAView : UIView
@property(nonatomic,strong) UIButton *leftButton;
@property(nonatomic,strong) UIButton *rightButton;
@property(nonatomic,strong) UILabel *leftLabel;
@property(nonatomic,strong) UILabel *label;
@property(nonatomic,strong) UILabel *lineLabel;
@property(nonatomic,assign) BOOL isLeftClick;
@property(nonatomic,assign) BOOL isRightClick;
@property(nonatomic,strong) UIView *view;
@end

@protocol MAViewDelegate <NSObject>

-(void)clickLeftButton;

@end
