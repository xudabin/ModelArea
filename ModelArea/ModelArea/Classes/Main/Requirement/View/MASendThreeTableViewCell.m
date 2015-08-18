//
//  MASendThreeTableViewCell.m
//  ModelArea
//
//  Created by 123 on 15/8/6.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MASendThreeTableViewCell.h"
#import "MAIssueViewController.h"
#import "MAHeader.h"
@implementation MASendThreeTableViewCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        _myphotoButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _myphotoButton.frame = CG(15, 0, 250*PROPERTION_X, 60);
        [_myphotoButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        _myphotoButton.tag=1;
        [_myphotoButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_myphotoButton];
        
    }
    return self;
}
- (void)buttonClick:(UIButton*)button
{
    NSLog(@"zxcvbgnm,./");
    [_delegate sendThreeTableView:self clickButtonTag:button.tag];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
