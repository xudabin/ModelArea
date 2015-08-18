//
//  MADataPickerView.h
//  ModelArea
//
//  Created by mac on 15/7/30.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MADatePickerView : UIView

- (void)confirmBtnDidSelectedWithTarget:(id)target action:(SEL)action;
@property (strong, readonly, nonatomic) NSString *date;

- (void)dismiss;

@end
