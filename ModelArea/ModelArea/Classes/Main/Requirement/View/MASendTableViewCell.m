//
//  MASendTableViewCell.m
//  ModelArea
//
//  Created by 123 on 15/8/5.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MASendTableViewCell.h"
#import "MAIssueViewController.h"
@implementation MASendTableViewCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
//        _textField=[[UITextField alloc]initWithFrame:CG(70,0,kWindowWidth, 60)];
        
        _textField=[[UITextField alloc]initWithFrame:CGRectMake(70, 0, 200, 60)];
        
        
        _textField.font=[UIFont systemFontOfSize:20];
        [self addSubview:_textField];
        
        
//        UITextField*field=[[UITextField alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
//        field.backgroundColor=[UIColor orangeColor];
//        [self addSubview:field];

        
        
        
        
        
    }
    return self;
}




- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
