//
//  MASendView.m
//  ModelArea
//
//  Created by 123 on 15/8/7.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MASendView.h"
#import "MAIssueViewController.h"
@implementation MASendView
- (id)initWithCustomAlertViewButtonTag:(int)sender    withArray:(NSMutableArray*)array
{
    
    self = [super init];
    if (self) {
        
        self.frame = CG(60, 360, 200, 200);
        self.backgroundColor = [UIColor lightGrayColor];
               NSString*str1;
        
//        if (array[0]==1) {
            str1=@"是否需要缴纳保证金?";
//        }
//        else{
//            str1=@"qq";
//        }
        NSLog(@"vvvvvvvvvvvvvvvv");
        UILabel*label=[[UILabel alloc]initWithFrame:CG(20, 5,200, 40)];
        label.text=str1;
        [self addSubview:label];
        
        
        NSString*str=@"缴纳保证金可以吸引更多热门模特报名哦，活动结束，双方没有纠纷的前提下小二将会尽快退还您的保证金";
        CGSize size = [self getSizeWithMessage:str];
        float m= size.height;
        UILabel*label1=[[UILabel alloc]initWithFrame:CG(20, 45,170*PROPERTION_X, (m+10)*PROPERTION_Y)];
        label1.text=str;
        
        label1.numberOfLines=0;
        
        [self addSubview:label1];
        
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeSystem];
        btn.frame = CG(20,160,50, 50);
//        btn.backgroundColor=[UIColor orangeColor];
        [btn setTitle:@"是" forState:UIControlStateNormal];
        btn.tag=99;
        [btn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
         [self addSubview:btn];
        
        
        UIButton * btn1 = [UIButton buttonWithType:UIButtonTypeSystem];
        btn1.frame = CG(130,160,50, 50);
//        btn1.backgroundColor=[UIColor orangeColor];
        [btn1 setTitle:@"否" forState:UIControlStateNormal];
        btn1.tag=100;
        [btn1 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn1];

        
        
        
        
        
        
        
        
        
    }
    return self;
    
}
-(CGSize)getSizeWithMessage:(NSString*)message
{
    //第一个参数：限定绘制空间的大小，一般限定宽度，高度不限
    //第二个参数：绘制选项，一般选NSStringDrawingUsesLineFragmentOrigin
    //第三个参数：属性信息；
    //第四个参数：上下文信息，一般填 nil
    return  [message boundingRectWithSize:CGSizeMake(170*PROPERTION_X, LONG_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObject:[UIFont systemFontOfSize:17] forKey:NSFontAttributeName] context:nil].size;
}

//当AlertView上的按钮被点击后，需要代理实现协议要求的方法
- (void)buttonClick:(UIButton *)button
{
    [_delegate customAlertView:self clickButtonTag:button.tag];

        [self removeFromSuperview];
    
}



@end
