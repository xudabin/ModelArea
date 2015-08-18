//
//  MARegisterItem.h
//  ModelArea
//
//  Created by mac on 15/7/28.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MARegisterItem : NSObject

@property (copy, nonatomic) NSString *icon;
@property (weak, nonatomic) NSString *placeholder;


+ (instancetype)itemWithDictionary:(NSDictionary *)dict;

@end
