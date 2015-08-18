//
//  CZMessageCell.m
//  QQ聊天布局02
//
//  Created by S.J on 14-8-18.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MAMessageCell.h"
#import "MAMessageFrameModel.h"
#import "MAMessageModel.h"

@interface MAMessageCell()
/**
 *  时间
 */
@property (nonatomic, weak)UILabel *timeLbl;

/**
 *  头像
 */
@property (nonatomic, weak)UIImageView *iconImg;

/**
 *  正文
 */
@property (nonatomic, weak)UIButton *textBtn;

@end

@implementation MAMessageCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //1.时间
        UILabel *timeLbl = [[UILabel alloc]init];
        timeLbl.textAlignment = NSTextAlignmentCenter;
        timeLbl.font = [UIFont systemFontOfSize:13.0f];
        timeLbl.textColor = kDEFAULT_GRAYCOLOR;
        [self.contentView addSubview:timeLbl];
        self.timeLbl = timeLbl;
        
        //2.头像
        UIImageView *iconImg = [[UIImageView alloc]init];
        [self.contentView addSubview:iconImg];
        self.iconImg = iconImg;
        
        //3.正文
        UIButton *btn = [[UIButton alloc]init];
//        btn.backgroundColor = [UIColor redColor];
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        btn.titleLabel.numberOfLines = 0;//自动换行
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        btn.titleLabel.backgroundColor = [UIColor blackColor];
        btn.contentEdgeInsets = UIEdgeInsetsMake(CZTextPadding, CZTextPadding, CZTextPadding, CZTextPadding);
        [self.contentView addSubview:btn];
        self.textBtn = btn;
        
        self.backgroundColor = [UIColor clearColor];
        
    }
    return self;
}

- (void)setMessageFrame:(MAMessageFrameModel *)messageFrame
{
    _messageFrame = messageFrame;
    
    //数据模型
    MAMessageModel *msg = messageFrame.message;
    
    //1.时间
    self.timeLbl.text = msg.time;
    self.timeLbl.frame = messageFrame.timeF;
    
    //2.头像
    if (msg.type == MAMessageModelGatsby) {
        self.iconImg.image = [UIImage imageNamed:@"Gatsby"];
    }else{
        self.iconImg.image = [UIImage imageNamed:@"Jobs"];
    }
    self.iconImg.frame = messageFrame.iconF;
    
    //3.正文
    [self.textBtn setTitle:msg.text forState:UIControlStateNormal];
    self.textBtn.frame = messageFrame.textF;
    
    
//    [normal resizableImageWithCapInsets:<#(UIEdgeInsets)#> resizingMode:<#(UIImageResizingMode)#>];
    
    if (msg.type == MAMessageModelGatsby) {
        [self.textBtn setBackgroundImage:[self resizeImageWithName:@"chat_send_nor"] forState:UIControlStateNormal];
    }else{
        [self.textBtn setBackgroundImage:[self resizeImageWithName:@"chat_recive_nor"] forState:UIControlStateNormal];
    }
    
    
    
}

- (UIImage *)resizeImageWithName:(NSString *)name
{
    UIImage *normal = [UIImage imageNamed:name];
    
    CGFloat w = normal.size.width * 0.5f - 1;
    CGFloat h = normal.size.height* 0.5f - 1;
    
    return [normal resizableImageWithCapInsets:UIEdgeInsetsMake(h, w, h, w)];
}


@end
