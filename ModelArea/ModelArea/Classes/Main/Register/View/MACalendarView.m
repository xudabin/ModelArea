//
//  MACalendarView.m
//  ModelArea
//
//  Created by mac on 15/8/7.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MACalendarView.h"

@implementation MACalendarView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = kDefaultTextColor;
        NSDate *date = [NSDate date];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = [NSString stringWithFormat:@"d"];
        NSString *dateStr = [formatter stringFromDate:date];
        
        CGFloat itemWH = (frame.size.width-6)/7;
        
        for (int i=0; i<7; i++) {
            for (int j=0; j<6; j++) {
                UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(i*(itemWH+1), j*(itemWH+1), itemWH, itemWH)];
                int day = i+j+1+6*j;
                if (day > 31) {
                    break;
                }
                
                button.tag = day;
                NSString *title = [NSString stringWithFormat:@"%d", day];
                [button setTitle:title forState:UIControlStateNormal];
                [button setTitleColor:kDEFAULT_BLACKCOLOR forState:UIControlStateNormal];
                 button.enabled = NO;
                
                if (day >= dateStr.intValue) {
                    [button setBackgroundImage:[UIImage imageNamed:@"green"] forState:UIControlStateNormal];
                    button.enabled = YES;
                }
               
                [button setBackgroundImage:[UIImage imageNamed:@"red"] forState:UIControlStateSelected];
                button.backgroundColor = kTABLEVIEW_BACKGROUND;
                [button addTarget:self action:@selector(clickButtonAtTag:) forControlEvents:UIControlEventTouchUpInside];
                [self addSubview:button];
            }
        }
    }
    return self;
}

- (void)clickButtonAtTag:(UIButton *)sender {
    sender.selected = !sender.selected;
    

    //NSLog(@"clidked %zd, %@", sender.tag, dateStr.intValue);
}


@end
