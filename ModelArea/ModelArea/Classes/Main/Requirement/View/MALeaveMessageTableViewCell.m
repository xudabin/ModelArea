//
//  MALeaveMessageTableViewCell.m
//  ModelArea
//
//  Created by 123 on 15/8/4.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MALeaveMessageTableViewCell.h"
#import "MAActiveViewController.h"
#import "MAHeader.h"
@implementation MALeaveMessageTableViewCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        _photoButton1 = [UIButton buttonWithType:UIButtonTypeSystem];
        _photoButton1.frame = CG(15, 15, 40, 40);
        _photoButton1.backgroundColor=[UIColor orangeColor];
        [_photoButton1 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_photoButton1];
        
        _nameLabel=[[UILabel alloc]initWithFrame:CG(70,15, 100, 20)];
        [self addSubview:_nameLabel];
        
        _explainLabel=[[UILabel alloc]initWithFrame:CG(70, 40, kWindowWidth, 20)];
        [self addSubview:_explainLabel];


    }
    return self;
}
- (void)buttonClick:(UIButton*)button
{
    NSLog(@"zxcvbgnm,./");
    [_delegate customLeaveMessageView:self clickButtonTag:button.tag];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
