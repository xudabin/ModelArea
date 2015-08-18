//
//  CZMessageModel.h
//  QQ聊天布局02
//
//  Created by S.J on 14-8-18.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

typedef enum {
    MAMessageModelGatsby,//gatsby 发的消息
    MAMessageModelJobs,//jobs 发的消息
    
}MAMessageModelType;

#import <Foundation/Foundation.h>

@interface MAMessageModel : NSObject
/**
 *  正文
 */
@property (nonatomic, copy)NSString *text;

/**
 *  时间
 */
@property (nonatomic, copy)NSString *time;

/**
 *  消息类型
 */
@property (nonatomic, assign)MAMessageModelType type;

/**
 *  是否隐藏事件
 */
@property (nonatomic, assign)BOOL hideTime;

+ (instancetype)messageWithDict:(NSDictionary *)dict;

- (instancetype)initWithDict:(NSDictionary *)dict;
@end
