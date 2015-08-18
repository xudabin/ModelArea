//
//  MAProfileCell.m
//  ModelArea
//
//  Created by mac on 15/7/30.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MAProfileCell.h"
#import "MAButtonBroup.h"
#import "MAModel.h"
#import "UIImageView+WebCache.h"
#import "SDImageCache.h"
#import "MAUser.h"

static const CGFloat IconW = 80;
static const CGFloat IconH = 85;
static const CGFloat MarginLeft = 15;
static const CGFloat MarginTop = 8;
static const CGFloat Spacing = 8;
static const CGFloat DefaultTextWidth = 100;
static const CGFloat DefaultTextHeight = 22;
static const CGFloat DefaultConstTextWidth = 60;
static const CGFloat IconWH = 13;


@interface MAProfileCell ()
//用户图像
@property (strong, nonatomic) UIImageView *icon;
//用户姓名
@property (strong, nonatomic) UILabel *nameLabel;
//用户类型
@property (strong, nonatomic) UIImageView *typeImage;
@property (strong, nonatomic) UIImageView *vipImage;
//用户地址
@property (strong, nonatomic) UILabel *addressLabel;

@property (strong, nonatomic) UILabel *scoreLabel;
//用户分数（图片）
@property (strong, nonatomic) UIImageView *scoreImage;
//用户分数(文字)
@property (strong, nonatomic) UILabel *scoreText;

//用户魅力值
@property (strong, nonatomic) UILabel *charmLabel;
@property (strong, nonatomic) UILabel *charmNoLabel;

//用户认证
@property (strong, nonatomic) UIImageView *sourceTypeImage;
//@property (weak, nonatomic) UIImageView *vipImage;




@end

@implementation MAProfileCell

+ (instancetype)cellWithTableview:(UITableView *)tableView forIndexPath:(NSIndexPath *)indexPath {
    
    MAProfileCell *cell = [tableView dequeueReusableCellWithIdentifier:[MAProfileCell reuseableIdentifier] forIndexPath:indexPath];
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self =  [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        
        _icon = [[UIImageView alloc] initWithFrame:CGRectZero];
        _icon.layer.cornerRadius = 3;
        _icon.layer.masksToBounds = YES;
        [self addSubview:_icon];
        _icon.image = [UIImage imageNamed:@"girl_2.jpg"];
        
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _nameLabel.textColor = kDEFAULT_BLACKCOLOR;
        _nameLabel.font = MAFONT_SIZE(15);
        [self addSubview:_nameLabel];
        //_nameLabel.backgroundColor = kDefaultColor;
        
        _typeImage = [[UIImageView alloc] initWithFrame:CGRectZero];
        [self addSubview:_typeImage];
        
        _vipImage = [[UIImageView alloc] initWithFrame:CGRectZero];
        [self addSubview:_vipImage];
        
        _addressLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _addressLabel.textColor = kDEFAULT_GRAYCOLOR;
        _addressLabel.textAlignment = NSTextAlignmentRight;
        _addressLabel.font = MAFONT_SIZE(13);
        [self addSubview:_addressLabel];
        //_addressLabel.backgroundColor = kDEFAULT_GRAYCOLOR;
        
        _scoreLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _scoreLabel.textColor = kDEFAULT_GRAYCOLOR;
        _scoreLabel.font = MAFONT_SIZE(13);
        _scoreLabel.text = @"综合分数";
        [self addSubview:_scoreLabel];
        
        _scoreImage = [[UIImageView alloc] initWithFrame:CGRectZero];
        [self addSubview:_scoreImage];
        //_scoreImage.backgroundColor = [UIColor orangeColor];
        
        _scoreText = [[UILabel alloc] initWithFrame:CGRectZero];
        _scoreText.textColor = [UIColor orangeColor];
        _scoreText.font = MAFONT_SIZE(13);
        _scoreText.text = @"4.8分";
        [self addSubview:_scoreText];
        
        _sourceTypeImage = [[UIImageView alloc] initWithFrame:CGRectZero];
        [self addSubview:_sourceTypeImage];
         //_sourceTypeImage.backgroundColor = [UIColor orangeColor];
        
        _charmLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _charmLabel.textColor = kDEFAULT_GRAYCOLOR;
        _charmLabel.font = MAFONT_SIZE(13);
        _charmLabel.text = @"魅力值";
        [self addSubview:_charmLabel];

        
        _charmNoLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _charmNoLabel.textColor = kDEFAULT_BLACKCOLOR;
        _charmNoLabel.font = MAFONT_SIZE(13);
        [self addSubview:_charmNoLabel];
        //_charmNoLabel.backgroundColor = [UIColor redColor];
        
        _buttonGroup  = [[MAButtonBroup alloc] init];
        _buttonGroup.data = @{@"level":@"23", @"fans":@"223", @"fellower":@"40",};
        [self addSubview:_buttonGroup];
        _buttonGroup.backgroundColor = kDefaultTextColor;
        
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.icon.frame = CGRectMake(MarginLeft, MarginTop, IconW, IconH);
    
    self.nameLabel.frame = CGRectMake(CGRectGetMaxX(_icon.frame)+2*Spacing*kSCREEN_SCALE, 1.2*MarginTop, DefaultConstTextWidth, DefaultTextHeight);
    
    self.vipImage.frame = CGRectMake(CGRectGetMaxX(_nameLabel.frame), _nameLabel.y+4, IconWH, IconWH);
    self.vipImage.image = [UIImage imageNamed:@"vip3_icon"];
    
    self.typeImage.frame = CGRectMake(CGRectGetMaxX(_vipImage.frame)+4, _vipImage.y, IconWH, IconWH);
    self.typeImage.image = [UIImage imageNamed:@"type_model_icon@2x"];
    
    self.addressLabel.frame = CGRectMake(self.width-DefaultTextWidth-3*Spacing, _nameLabel.y, DefaultTextWidth, DefaultTextHeight);
    
    
    self.scoreLabel.frame = CGRectMake(_nameLabel.x, CGRectGetMaxY(_nameLabel.frame)+Spacing, DefaultConstTextWidth, DefaultTextHeight);
    
    self.scoreImage.frame = CGRectMake(CGRectGetMaxX(_scoreLabel.frame), _scoreLabel.y+4, IconWH*5, IconWH);
    self.scoreImage.image = [UIImage imageNamed:@"star_4"];
    
    self.scoreText.frame = CGRectMake(CGRectGetMaxX(_scoreImage.frame)+Spacing, _scoreLabel.y, IconWH*3, DefaultTextHeight);
    
    
    self.sourceTypeImage.frame = CGRectMake(_nameLabel.x, CGRectGetMaxY(_scoreLabel.frame)+Spacing, IconWH, IconWH);
   
    self.charmLabel.frame = CGRectMake(CGRectGetMaxX(_sourceTypeImage.frame)+Spacing, _sourceTypeImage.y-4, DefaultConstTextWidth-20, DefaultTextHeight);
    
    self.charmNoLabel.frame = CGRectMake(CGRectGetMaxX(_charmLabel.frame)+Spacing, _charmLabel.y, DefaultTextWidth, DefaultTextHeight);
    
    
    self.buttonGroup.frame = CGRectMake(0, CGRectGetMaxY(_icon.frame)+10, self.width, self.height-CGRectGetMaxY(_icon.frame)-10);
  
}

- (void)setModel:(MAModel *)model {
    _model = model;
   
    self.nameLabel.text = model.name;
    self.addressLabel.text = model.address;
    self.sourceTypeImage.image = [UIImage imageNamed:@"source_iocn"];
    self.scoreImage.image = [UIImage imageNamed:@""];
    self.charmNoLabel.text = model.charm;
  
}

- (void)setUser:(MAUser *)user {
    _user = user;
    self.nameLabel.text = user.userInfo.nickName;
    self.addressLabel.text = user.city.city;
    [self.icon sd_setImageWithURL:[NSURL URLWithString:user.userInfo.headImgUrl] placeholderImage:nil];
    self.sourceTypeImage.image = [UIImage imageNamed:@"source_iocn"];
    self.scoreImage.image = [UIImage imageNamed:@""];
    NSString *score = [NSString stringWithFormat:@"%d分", [user.userInfo.charmValue intValue]];
    self.scoreText.text = score;
    self.charmNoLabel.text = user.userInfo.charmValue;
    
    
}

+ (NSString *)reuseableIdentifier {
    return @"Profile";
}

+ (CGFloat)rowHeight {
    return 150;
}

@end
