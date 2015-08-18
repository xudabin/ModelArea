//
//  MARequireTableViewCell.m
//  ModelArea
//
//  Created by 123 on 15/7/30.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MARequireTableViewCell.h"

#import "MAHeader.h"


@implementation MARequireTableViewCell

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
         *remarksLabel   备注
        ＊photoImageView   照片
            */
        _photoImageView = [[UIImageView alloc]initWithFrame:CG(10, 10, 60, 60)];
        [self addSubview:_photoImageView];
        
        UILabel*label1  = [[UILabel alloc]initWithFrame:CG(90, 10, 30, 20)];
        label1.text=@"时间";
        label1.font=[UIFont systemFontOfSize:12];
        [self addSubview:label1];
        
        UILabel*label2  = [[UILabel alloc]initWithFrame:CG(90, 35, 30, 20)];
        label2.text=@"预算";
        label2.font=[UIFont systemFontOfSize:12];
        [self addSubview:label2];
        
        UILabel*label3  = [[UILabel alloc]initWithFrame:CG(90, 60, 30, 20)];
        label3.text=@"类型";
        label3.font=[UIFont systemFontOfSize:12];
        [self addSubview:label3];
        
        
        _timeLabel  = [[UILabel alloc]initWithFrame:CG(135, 10, 70, 20)];
        _timeLabel.font=[UIFont systemFontOfSize:15];
        [self addSubview:_timeLabel];
        
        _budgetLabel  = [[UILabel alloc]initWithFrame:CG(135, 35, 60, 20)];
        _budgetLabel.font=[UIFont systemFontOfSize:15];
        _budgetLabel.textColor=[UIColor redColor];
        [self addSubview:_budgetLabel];
        
        UILabel*label4  = [[UILabel alloc]initWithFrame:CG(200, 35, 20, 20)];
        label4.font=[UIFont systemFontOfSize:10];
        label4.text=@"每人";
        [self addSubview:label4];
        
        
        _typeLabel = [[UILabel alloc]initWithFrame:CG(135, 60, 70, 20)];
        _typeLabel.font=[UIFont systemFontOfSize:15];
        [self addSubview:_typeLabel];
        
        UILabel*label5  = [[UILabel alloc]initWithFrame:CG(220, 60, 40, 20)];
        label5.font=[UIFont systemFontOfSize:12];
        label5.text=@"人数";
        [self addSubview:label5];
        
        _numLabel = [[UILabel alloc]initWithFrame:CG(270, 60, 70, 20)];
        _numLabel.font=[UIFont systemFontOfSize:15];
        [self addSubview:_numLabel];
        
        UILabel*label6  = [[UILabel alloc]initWithFrame:CG(10, 85, 30, 30)];
        label6.font=[UIFont systemFontOfSize:12];
        label6.text=@"备注";
        [self addSubview:label6];
        
        _remarksLabel = [[UILabel alloc]initWithFrame:CG(50, 85, 325, 30)];
        _remarksLabel.font=[UIFont systemFontOfSize:15];
        [self addSubview:_remarksLabel];
        

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
