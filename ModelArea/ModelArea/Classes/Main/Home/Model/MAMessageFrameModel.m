
//
//  CZMessageFrameModel.m
//  QQ聊天布局02
//
//  Created by S.J on 14-8-18.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MAMessageFrameModel.h"
#import "MAMessageModel.h"


@implementation MAMessageFrameModel

- (void)setMessage:(MAMessageModel *)message
{
    _message = message;
    
    //设备屏幕的宽
    CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
    //边距
    CGFloat padding = 10;
    
    //时间
    if (message.hideTime == NO) {
        CGFloat timeX = 0;
        CGFloat timeY = 0;
        CGFloat timeW = 320;
        CGFloat timeH = 40;
        
        _timeF = CGRectMake(timeX, timeY, timeW, timeH);
    }
    
    //头像
    CGFloat iconX;
    CGFloat iconY = CGRectGetMaxY(_timeF) + padding;
    CGFloat iconW = 50;
    CGFloat iconH = 50;
    if (message.type == MAMessageModelGatsby) {//Gatsby发的  头像在右边
        iconX = screenW - iconW - padding;
    }else{//Jobs发的  头像在左边
        iconX = padding;
    }
    
    _iconF = CGRectMake(iconX, iconY, iconW, iconH);
    
    
    //正文
    
    CGSize textSize = [message.text boundingRectWithSize:CGSizeMake(150, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size;
    
    //最终正文的size
    CGSize lastBtnSize = CGSizeMake(textSize.width + CZTextPadding * 2 , textSize.height + CZTextPadding * 2);
    
    CGFloat textX ;
    CGFloat textY = iconY;
    
    if (message.type == MAMessageModelGatsby) {
        textX = iconX - padding - lastBtnSize.width;
    }else{
        textX = CGRectGetMaxX(_iconF) + padding;
    }
    
    _textF = (CGRect){{textX,textY},lastBtnSize};
    
//    _textF = CGRectMake(textX, textY, textW, textH);
    
    //cell的高度
    CGFloat iconMaxY = CGRectGetMaxY(_iconF);
    CGFloat textMaxY = CGRectGetMaxY(_textF);
    _cellHeight = MAX(iconMaxY, textMaxY);
}

@end
