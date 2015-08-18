//
//  CZMessageFrameModel.h
//  QQ聊天布局02
//
//  Created by S.J on 14-8-18.
//  Copyright (c) 2014年 itcast. All rights reserved.
//
/**
 *  正文的内边距
 */

#import <Foundation/Foundation.h>

#define czBtnFontSize [UIFont systemFontOfSize:15.0f]
#define CZTextPadding 20

@class MAMessageModel;
@interface MAMessageFrameModel : NSObject
/**
 *  正文的frame
 */
@property (nonatomic,assign,readonly)CGRect textF;

/**
 *  时间的frame
 */
@property (nonatomic,assign,readonly)CGRect timeF;

/**
 *  头像的frame
 */
@property (nonatomic,assign,readonly)CGRect iconF;

/**
 *  cell的高度
 */
@property (nonatomic,assign,readonly)CGFloat cellHeight;

/**
 *  根据数据模型设置frame
 */
@property (nonatomic, strong)MAMessageModel *message;
@end
