//
//  MAReqView.m
//  ModelArea
//
//  Created by 123 on 15/8/3.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MAReqView.h"
#import "MARequireViewController.h"
@implementation MAReqView


- (id)initWithCustomAlertViewButtonTag:(int)sender    withArray:(NSMutableArray*)array
{
    
    self = [super init];
    if (self) {
        
        self.frame = CG(0, 110, kWindowWidth, 110);
        self.backgroundColor = [UIColor lightGrayColor];
        for (int m=0; m<4; m++) {
            UIButton * btn = [UIButton buttonWithType:UIButtonTypeSystem];
            btn.frame = CG(10+m%3*120,10+m/3*50, 100, 50);
            [btn setTitle:array[m] forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
            
            int k=0;
            if (sender==1) {
                //        区分按钮，设置tag值  职业
                k=10;
            }
            
            if (sender==2) {
                //        区分按钮，设置tag值   价值
                k=100;
            }
            btn.tag=k+m;
            [self addSubview:btn];
        }
            }
    return self;

 }
//当AlertView上的按钮被点击后，需要代理实现协议要求的方法
- (void)buttonClick:(UIButton *)button
{
    [_delegate customAlertView:self clickButtonTag:button.tag];
     //    当点击了按钮时，移除自定义的alertView
    [self removeFromSuperview];
}


@end
