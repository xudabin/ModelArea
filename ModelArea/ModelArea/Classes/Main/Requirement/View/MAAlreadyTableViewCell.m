//
//  MAAlreadyTableViewCell.m
//  ModelArea
//
//  Created by 123 on 15/8/4.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MAAlreadyTableViewCell.h"
#import "MAActiveViewController.h"
#import "MAHeader.h"
@implementation MAAlreadyTableViewCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        
        UILabel*label=[[UILabel alloc]initWithFrame:CG(15, 0, 100, 20)];
        label.text=@"已报名";
        [self addSubview:label];
                
        UILabel*label1=[[UILabel alloc]initWithFrame:CG(115, 0, 40, 20)];
        label1.text=@"4人";
        
        [self addSubview:label1];
        
        UIButton*button=[[UIButton alloc]initWithFrame:CG(300, 0, 40, 20)];
        [button setTitle:@"更多" forState:UIControlStateNormal];
        button.backgroundColor=[UIColor orangeColor];
        button.tag=1110;
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        
        _photoButton1 = [UIButton buttonWithType:UIButtonTypeSystem];
        _photoButton1.frame = CG(15, 35, 60, 60);
        _photoButton1.backgroundColor=[UIColor orangeColor];
        _photoButton1.layer.cornerRadius=30;
        _photoButton1.layer.masksToBounds=YES;
        _photoButton1.tag=1111;
        [_photoButton1 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_photoButton1];
        
        _photoButton2 = [UIButton buttonWithType:UIButtonTypeSystem];
        _photoButton2.frame = CG(90, 35, 60, 60);
        _photoButton2.backgroundColor=[UIColor orangeColor];
        _photoButton2.layer.cornerRadius=30;
         _photoButton2.tag=1112;
        _photoButton2.layer.masksToBounds=YES;
        [_photoButton2 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_photoButton2];
        
        _photoButton3 = [UIButton buttonWithType:UIButtonTypeSystem];
        _photoButton3.frame = CG(165, 35, 60, 60);
        _photoButton3.backgroundColor=[UIColor orangeColor];
        _photoButton3.layer.cornerRadius=30;
        _photoButton3.tag=1113;
        _photoButton3.layer.masksToBounds=YES;
        [_photoButton3 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_photoButton3];
        
        _photoButton4 = [UIButton buttonWithType:UIButtonTypeSystem];
        _photoButton4.frame = CG(240, 35, 60, 60);
        _photoButton4.backgroundColor=[UIColor orangeColor];
        _photoButton4.layer.cornerRadius=30;
        _photoButton4.tag=1114;
        _photoButton4.layer.masksToBounds=YES;
        [_photoButton4 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_photoButton4];
    }
    return self;
}
- (void)buttonClick:(UIButton*)button
{
    NSLog(@"zxcvbgnm,./");
   [_delegate customView:self clickButtonTag:button.tag];
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

@end
