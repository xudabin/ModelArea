//
//  MABaseInfoCell.m
//  ModelArea
//
//  Created by mac on 15/7/29.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MABaseInfoCell.h"

static const CGFloat Spacing_left = 15;
static const CGFloat Title_height = 43;
static const CGFloat Title_MaxWidth = 70;
//static const CGFloat Margin_top = 4;

@interface MABaseInfoCell () {
    CGFloat _maxWidth;
    CGFloat _currentWidth;
    CGFloat _width;
}



@end

@implementation MABaseInfoCell

+ (instancetype)cellWithTableview:(UITableView *)tableView forIndexPath:(NSIndexPath *)indexPath {
    
    MABaseInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:[MABaseInfoCell reuseableIdentifier] forIndexPath:indexPath];
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self =  [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UILabel *titleLab = [[UILabel alloc] initWithFrame:CGRectZero];
        titleLab.textColor = kDEFAULT_GRAYCOLOR;
        titleLab.font = MAFONT_SIZE(15);
        [self.contentView addSubview:titleLab];
        self.titleLab = titleLab;
        
        UILabel *descLab = [[UILabel alloc] initWithFrame:CGRectZero];
        descLab.textColor = kDEFAULT_BLACKCOLOR;
        descLab.font = MAFONT_SIZE(15);
        //descLab.backgroundColor = kDefaultColor;
        descLab.numberOfLines = 0;
        [self.contentView addSubview:descLab];
        self.descLab = descLab;
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat width = _currentWidth < Title_MaxWidth?Title_MaxWidth:_currentWidth;
    
    self.titleLab.frame = CGRectMake(Spacing_left, 0, width, Title_height);
    self.descLab.frame = CGRectMake(CGRectGetMaxX(self.titleLab.frame)+Spacing_left, 0, self.width-CGRectGetMaxX(self.titleLab.frame)-3*Spacing_left, self.height);
}

+ (UINib *)nib {
    return [UINib nibWithNibName:@"MABaseInfoCell" bundle:nil];
}

+ (NSString *)reuseableIdentifier {
    return @"BaseInfo";
}

- (void)setData:(NSDictionary *)data {
    _data = data;
    
    if (data[@"title"]) {
        _titleLab.text = data[@"title"];
        
    } else {
        _titleLab.text = @"";
    }
    
    if (data[@"desc"]) {
        _descLab.text = data[@"desc"];
        
    } else {
        _descLab.text = @"";
    }
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSFontAttributeName] = _titleLab.font;
    CGFloat width =  [_titleLab.text sizeWithAttributes:dict].width;
    _currentWidth = width;
    
    //CGRect rect = getRectFromText(_descLab.text, <#CGSize size#>, <#UIFont *font#>)
    
}


@end
