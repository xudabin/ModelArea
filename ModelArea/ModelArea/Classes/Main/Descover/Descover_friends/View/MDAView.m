

//
//  MAView.m
//  ModelArea
//
//  Created by mac on 15/7/28.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MDAView.h"

@implementation MDAView
{
    CGRect _rect;
}

-(id)initWithFrame:(CGRect)frame
{
    self =[super initWithFrame:frame];
    if (self) {
        _rect =[UIScreen mainScreen].bounds;
        [self addSubview:self.leftButton];
        [self addSubview:self.rightButton];
        [self addSubview:self.label];
        [self addSubview:self.leftLabel];
        [self addSubview:self.lineLabel];
        [self addSubview:self.view];
        
    }
    return self;
}
-(UIView*)view
{
    if (!_view) {
        _view =[[UIView alloc]init];
        _view.frame =CGRectMake(0, 54, _rect.size.width, _rect.size.height-54);
        
    }
    return _view;
}

-(UIButton *)leftButton
{
    
    if (!_leftButton) {
        _leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        _leftButton.frame = CGRectMake(0, 0, (_rect.size.width-1)/2, 50);
        
        _leftButton.backgroundColor = [UIColor whiteColor];
        [_leftButton setTitle:[NSString stringWithFormat:@"关注"] forState:UIControlStateNormal];
        [_leftButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        [_leftButton addTarget:self action:@selector(leftClick) forControlEvents:UIControlEventTouchUpInside];
        
    }

    return _leftButton;
    
}
-(UIButton *)rightButton
{
    
    if (!_rightButton) {
        _rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        _rightButton.frame = CGRectMake((_rect.size.width-1)/2+1, 0, (_rect.size.width-1)/2, 50);
        [_rightButton setTitle:[NSString stringWithFormat:@"粉丝"] forState:UIControlStateNormal];
        [_rightButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        _rightButton.backgroundColor = [UIColor whiteColor];
        
        [_rightButton addTarget:self action:@selector(rightClick) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _rightButton;
    
}
-(UILabel*)lineLabel
{
    if (!_lineLabel) {
    
        _lineLabel =[[UILabel alloc]init];
        _lineLabel.frame =CGRectMake((_rect.size.width-1)/2, 0, 1, 50);
        _lineLabel.backgroundColor =[UIColor lightGrayColor];
    }
    return _lineLabel;
}
-(UILabel *)leftLabel
{
    if (!_leftLabel) {
        _leftLabel = [[UILabel alloc]init];
        _leftLabel.frame = CGRectMake(0, 50, (_rect.size.width)/2, 4);
        _leftLabel.backgroundColor = kDefaultColor;
        
        _isLeftClick =YES;
    }
    
    
    return _leftLabel;
    
    
}
-(UILabel *)label
{
    if (!_label) {
        _label = [[UILabel alloc]init];
        _label.frame =CGRectMake(0, 50, _rect.size.width, 4);
        _label.backgroundColor = [UIColor lightGrayColor];
        _isRightClick =NO;
    }
    
    return _label;
    
    
}


-(void)leftClick
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
    _leftLabel.frame =CGRectMake(0, 50, (_rect.size.width)/2, 4);
    [UIView commitAnimations];
    [_rightButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [_leftButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    NSLog(@"11111111");
}
-(void)rightClick
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
    _leftLabel.frame =CGRectMake((_rect.size.width)/2, 50, (_rect.size.width)/2, 4);
    [UIView commitAnimations];
     [_rightButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_leftButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    NSLog(@"222222222222");
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
