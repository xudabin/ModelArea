//
//  MASendView.h
//  ModelArea
//
//  Created by 123 on 15/8/7.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MAIssueViewController;
@interface MASendView : UIView

//指定被委托人（代理）是ZYAppDelegate类的对象
@property(nonatomic,assign)MAIssueViewController * delegate;

- (id)initWithCustomAlertViewButtonTag:(int)sender    withArray:(NSMutableArray*)array;


@end



//协议可以自己创建一个文件，也可以写在某个类当中 .h
//声明协议的格式

@protocol ZYCustomAlertViewDelegate <NSObject>

//协议方法：协议双方确定，已经确定什么情况下执行。

//此方法在点击警告框上的按钮时会执行。
- (void)customAlertView:(MASendView *)customAlertView clickButtonTag:(NSInteger)buttonTag;

@end
