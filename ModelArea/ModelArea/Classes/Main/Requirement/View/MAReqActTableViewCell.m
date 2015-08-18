//
//  MAReqActTableViewCell.m
//  ModelArea
//
//  Created by 123 on 15/8/3.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MAReqActTableViewCell.h"
#import "MAActiveViewController.h"
#import "MAHeader.h"
@implementation MAReqActTableViewCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        /*
         *timeLabels     时间
         *budgetLabel    预算
         *typeLabel      类型
         *numLabel       人数
         *addressLabel   地址
         *explainLabel   说明
         companyButton   大照片
         rankButton      小照片
         */

        _companyButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _companyButton.frame = CG(15, 15, 90, 90);
        _companyButton.backgroundColor=[UIColor orangeColor];
        [_companyButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_companyButton];
        
        UILabel*label8  = [[UILabel alloc]initWithFrame:CGRectMake(15, 115, 50, 20)];
        label8.font=[UIFont systemFontOfSize:12];
        label8.text=@"信用等级";
        [self addSubview:label8];
        
        _rankButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _rankButton.frame = CGRectMake(65, 115,17, 17);
        _rankButton.backgroundColor=[UIColor orangeColor];
//        [_rankButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_rankButton];
        
        
        
        UILabel*label1  = [[UILabel alloc]initWithFrame:CG(125, 15, 30, 20)];
        label1.text=@"时间";
        label1.font=[UIFont systemFontOfSize:12];
        [self addSubview:label1];
        
        UILabel*label2  = [[UILabel alloc]initWithFrame:CG(125, 35, 30, 20)];
        label2.text=@"预算";
        label2.font=[UIFont systemFontOfSize:12];
        [self addSubview:label2];
        
        UILabel*label3  = [[UILabel alloc]initWithFrame:CG(125, 55, 30, 20)];
        label3.text=@"类型";
        label3.font=[UIFont systemFontOfSize:12];
        [self addSubview:label3];
        
        UILabel*label4  = [[UILabel alloc]initWithFrame:CG(125, 75, 30, 20)];
        label4.font=[UIFont systemFontOfSize:12];
        label4.text=@"人数";
        [self addSubview:label4];
        
        UILabel*label5  = [[UILabel alloc]initWithFrame:CG(125, 95, 30, 20)];
        label5.font=[UIFont systemFontOfSize:12];
        label5.text=@"地址";
        [self addSubview:label5];
        
        UILabel*label6  = [[UILabel alloc]initWithFrame:CG(125, 115, 30, 20)];
        label6.font=[UIFont systemFontOfSize:12];
        label6.text=@"说明";
        [self addSubview:label6];
        
        
        
        _timeLabel  = [[UILabel alloc]initWithFrame:CG(155, 15, 70, 20)];
        _timeLabel.font=[UIFont systemFontOfSize:15];
        [self addSubview:_timeLabel];
        
        _budgetLabel  = [[UILabel alloc]initWithFrame:CG(155, 35, 85, 20)];
//        _budgetLabel.backgroundColor=[UIColor blackColor];
        _budgetLabel.font=[UIFont systemFontOfSize:15];
        _budgetLabel.textColor=[UIColor redColor];
        [self addSubview:_budgetLabel];
        
        UILabel*label7  = [[UILabel alloc]initWithFrame:CG(250, 35, 40, 20)];
        label7.font=[UIFont systemFontOfSize:10];
        label7.text=@"2小时";
        [self addSubview:label7];
       
        
        
        _typeLabel = [[UILabel alloc]initWithFrame:CG(155, 55, 70, 20)];
        _typeLabel.font=[UIFont systemFontOfSize:15];
        [self addSubview:_typeLabel];
        
        _numLabel = [[UILabel alloc]initWithFrame:CG(155, 75, 70, 20)];
        _numLabel.font=[UIFont systemFontOfSize:15];
        [self addSubview:_numLabel];
        
        
        _addressLabel = [[UILabel alloc]initWithFrame:CG(155, 95, 100, 20)];
        _addressLabel.font=[UIFont systemFontOfSize:15];
        [self addSubview:_addressLabel];
        
        
        _explainLabel = [[UILabel alloc]initWithFrame:CG(155, 115, 100, 20)];
        _explainLabel.font=[UIFont systemFontOfSize:15];
        [self addSubview:_explainLabel];
       
  
       
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    }
    return self;
}
- (void)buttonClick:(UIButton*)button
{
    NSLog(@"zxcvbgnm,./");
    [_delegate customAlertView:self clickButtonTag:button.tag];
    
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
