//
//  MAPickImageCell.m
//  ModelArea
//
//  Created by mac on 15/8/12.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MAPickImageCell.h"
#import "UIButton+Extention.h"

static const CGFloat Margin_left = 15;
static const CGFloat ItemWH = 60;

@interface MAPickImageCell () {
    NSInteger count;
}

@property (nonatomic, weak) UIButton *addButton;
@property (nonatomic, weak) UILabel *titleLabel;
@property (nonatomic, strong) NSArray *images;

@end


@implementation MAPickImageCell

+ (instancetype)cellWithTableview:(UITableView *)tableView forIndexPath:(NSIndexPath *)indexPath {
    return [tableView dequeueReusableCellWithIdentifier:[MAPickImageCell reuseableIdentifier] forIndexPath:indexPath];
}

+ (NSString *)reuseableIdentifier {
    return @"MAPickImageCell";
}

+ (CGFloat)rowHeight {
    return 24+ItemWH+20;
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        count = 0;
        UILabel *titleLab = [[UILabel alloc] init];
        titleLab.font = MAFONT_SIZE(16);
        titleLab.text = @"添加艺术照";
        [self.contentView addSubview:titleLab];
        _titleLabel = titleLab;
        
        UIButton *addButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [addButton setImage:[UIImage imageNamed:@"register_add_icon.png"] forState:UIControlStateNormal];
        //[addButton setTitle:@"添加照片" forState:UIControlStateNormal];
        [addButton setBackgroundImage:[UIImage imageNamed:@"profile_button_border"] forState:UIControlStateNormal];
        [addButton setTitleColor:kDefaultColor forState:UIControlStateNormal];
        [addButton centerImageAndTitle];
        
        [addButton addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:addButton];
        _addButton = addButton;
        
        
        UIImageView *imageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"aa"]];
        imageView1.hidden = YES;
        [self.contentView addSubview:imageView1];
        UIImageView *imageView2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"aa"]];
        imageView2.hidden = YES;
        [self.contentView addSubview:imageView2];
        UIImageView *imageView3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"aa"]];
        imageView3.hidden = YES;
        [self.contentView addSubview:imageView3];
        _images = @[imageView1, imageView2, imageView3];
        
       
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.titleLabel.frame = CGRectMake(Margin_left, 0, 100, 24);
    
    CGFloat y = CGRectGetMaxY(self.titleLabel.frame) + 8;
    
    self.addButton.frame = CGRectMake(Margin_left, y, ItemWH, ItemWH);
    for (int i=0; i<self.images.count; i++) {
        UIImageView *photo = (UIImageView *)self.images[i];
        photo.frame = CGRectMake(i * (ItemWH+Margin_left) + Margin_left, y, ItemWH, ItemWH);
    }
    
    
}

- (void)buttonClick {
    
    if ([self.delegate respondsToSelector:@selector(pickImageCellDidClickButton:)]) {
        [self.delegate pickImageCellDidClickButton:self];
    }
    if (count > 2) {
        return ;
    }
    UIImageView *photo = (UIImageView *)self.images[count++];
    photo.hidden = NO;
   
    [UIView animateWithDuration:0.3f animations:^{
        CGRect tmp = self.addButton.frame;
        tmp.origin.x = count * (ItemWH+Margin_left) + Margin_left;
        self.addButton.frame = tmp;
    }];
    
    
    
    
    if (count == 3) {
        self.addButton.hidden = YES;
    }

    
}

@end
