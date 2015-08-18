//
//  MADataPickerView.m
//  ModelArea
//
//  Created by mac on 15/7/30.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MADatePickerView.h"
static const CGFloat TOOLBAR_HEIGHT = 44;
static const CGFloat DATAPICKER_HEIGHT = 216;
static const CGFloat SPACING = 15;

@interface MADatePickerView ()
@property (strong, nonatomic) UIDatePicker *datePicker;
@property (strong, nonatomic) UIView *toorBar;
@property (strong, nonatomic) UIButton *cancleBtn;
@property (strong, nonatomic) UIButton *confirmBtn;

@end

@implementation MADatePickerView

- (instancetype)init {
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, kScreenHeight, kScreenWidth, TOOLBAR_HEIGHT+DATAPICKER_HEIGHT);
        //tool bar
        _toorBar  = [[UIToolbar alloc] initWithFrame:CGRectZero];
        
        _cancleBtn = [[UIButton alloc] initWithFrame:CGRectZero];
        [_cancleBtn addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
        [_toorBar addSubview:_cancleBtn];
        
        _confirmBtn = [[UIButton alloc] initWithFrame:CGRectZero];
        [_toorBar addSubview:_confirmBtn];
        
        [self addSubview:_toorBar];
        
        _datePicker = [[UIDatePicker alloc] init];
        _datePicker.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
        _datePicker.datePickerMode = UIDatePickerModeDate;
        [self addSubview:_datePicker];

        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [UIView animateWithDuration:0.3 animations:^{
        self.frame = CGRectMake(0, kScreenHeight-TOOLBAR_HEIGHT-DATAPICKER_HEIGHT, kScreenWidth, TOOLBAR_HEIGHT+DATAPICKER_HEIGHT);
    }];
    
    _toorBar.backgroundColor = [UIColor whiteColor];
    _toorBar.frame = CGRectMake(0, 0, kScreenWidth, TOOLBAR_HEIGHT);
    
    _cancleBtn.frame = CGRectMake(SPACING, 0, TOOLBAR_HEIGHT, TOOLBAR_HEIGHT);
    [_cancleBtn setTitleColor:MAColor(80.0, 156.0, 252.0, 1) forState:UIControlStateNormal];
    [_cancleBtn setTitle:@"取消" forState:UIControlStateNormal];
    
    _confirmBtn.frame = CGRectMake(kScreenWidth-TOOLBAR_HEIGHT-SPACING, 0, TOOLBAR_HEIGHT, TOOLBAR_HEIGHT);
    [_confirmBtn setTitleColor:MAColor(80.0, 156.0, 252.0, 1) forState:UIControlStateNormal];
    [_confirmBtn setTitle:@"确定" forState:UIControlStateNormal];
    
    _datePicker.y = TOOLBAR_HEIGHT;


}

- (NSString *)date {
    NSDate *origionDate = _datePicker.date;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *dataStr = [formatter stringFromDate:origionDate];

    return dataStr;
}

- (void)confirmBtnDidSelectedWithTarget:(id)target action:(SEL)action {
    [_confirmBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
}

- (void)dismiss {
    [UIView animateWithDuration:0.3 animations:^{
        CGRect tmp = self.frame;
        tmp.origin.y = kScreenHeight;
        self.frame = tmp;
        
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
        
    }];
    
}

@end
