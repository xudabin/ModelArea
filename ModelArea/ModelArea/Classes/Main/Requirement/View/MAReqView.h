//
//  MAReqView.h
//  ModelArea
//
//  Created by 123 on 15/8/3.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MARequireViewController;

@interface MAReqView : UIView


//指定被委托人（代理）是ZYAppDelegate类的对象
@property(nonatomic,assign)MARequireViewController * delegate;


//自定义初始化方法
//标题，提示标题，取消按钮标题 ，确定按钮标题。
//- (id)initWithCustomAlertViewTitle:(NSString *)title1 withMessage:(NSString *)title2 withCancelButtonTitile:(NSString *)leftTitle withSureButtonTitle:(NSString *)rightTitle;

- (id)initWithCustomAlertViewButtonTag:(int)sender    withArray:(NSMutableArray*)array;
@end




//协议可以自己创建一个文件，也可以写在某个类当中 .h
//声明协议的格式

@protocol ZYCustomAlertViewDelegate <NSObject>

//协议方法：协议双方确定，已经确定什么情况下执行。

//此方法在点击警告框上的按钮时会执行。
- (void)customAlertView:(MAReqView *)customAlertView clickButtonTag:(NSInteger)buttonTag;

@end









