//
//  MATextFieldCell.m
//  ModelArea
//
//  Created by mac on 15/8/12.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MATextFieldCell.h"

static const CGFloat Margin = 15;
static const CGFloat InputW = 200;

@implementation MATextFieldCell 

+ (instancetype)cellWithTableview:(UITableView *)tableView forIndexPath:(NSIndexPath *)indexPath {
    return [tableView dequeueReusableCellWithIdentifier:[MATextFieldCell reuseableIdentifier] forIndexPath:indexPath];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = MAFONT_SIZE(15);
        [self.contentView addSubview:_titleLabel];
        //self.backgroundColor = kDefaultColor;
        _inputField = [[UITextField alloc] init];
        _inputField.textColor = kDEFAULT_GRAYCOLOR;
        _inputField.font = MAFONT_SIZE(14);
        _inputField.textAlignment = NSTextAlignmentRight;
        _inputField.minimumFontSize = 13;
        //_inputField.
        //_inputField.delegate = self;
       // _inputField.backgroundColor = kDefaultColor;
        [self.contentView addSubview:_inputField];
        
        
    }
    return self;
}

- (void)layoutSubviews {
    NSLog(@"textcell width:%f", self.width);
    
    self.titleLabel.frame = CGRectMake(Margin, 0, InputW*0.65, self.height-1);
    self.inputField.frame = CGRectMake(self.width-InputW-Margin, 0, InputW, self.height-1);
}

+ (NSString *)reuseableIdentifier {
    return @"MATextFieldCell";
}

//- (void)textFieldDidBeginEditing:(UITextField *)textField {
//    textField.text = @"";
//}

@end
