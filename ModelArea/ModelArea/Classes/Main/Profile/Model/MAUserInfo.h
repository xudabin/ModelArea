//
//  MAUserInfo.h
//  ModelArea
//
//  Created by mac on 15/8/13.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MAUserInfo : NSObject

/**
 * 头像
 */
@property (copy, nonatomic) NSString *headImgUrl;
/**
 * 会员等级
 */
@property (copy, nonatomic) NSString *vipGrade;

/**
 * 粉丝
 */
@property (copy, nonatomic) NSString *fans;

/**
 * 评分
 */
@property (copy, nonatomic) NSString *commentScore;

/**
 * 身份认证
 */
@property (copy, nonatomic) NSString *idCard;
/**
 * 魅力值
 */
@property (copy, nonatomic) NSString *charmValue;

/**
 * 关注
 */
//@property (copy, nonatomic) NSString *attentions;

/**
 * 用户名
 */
@property (copy, nonatomic) NSString *nickName;

/**
 * 是否手机认证  1：是，0否
 */
//@property (copy, nonatomic) NSString *phone_user;

/**
 * 余额
 */
@property (copy, nonatomic) NSString *balance;




@end
