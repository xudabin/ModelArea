//
//  MAUser.h
//  ModelArea
//
//  Created by mac on 15/8/11.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MACity.h"
#import "MAUserInfo.h"

@interface MAUser : NSObject

/**
 * 用户
 */
@property (copy, nonatomic) NSString *nickName;
/**
 * 用户类型
 */
@property (copy, nonatomic) NSString *usertype;
/**
 * 手机号
 */
@property (copy, nonatomic) NSString *phone;

@property (nonatomic, strong) MAUserInfo *userInfo;

/**
* 城市
*/
@property (nonatomic, strong) MACity *city;


@end
