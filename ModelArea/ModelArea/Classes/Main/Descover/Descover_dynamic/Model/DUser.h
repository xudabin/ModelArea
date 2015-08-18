//
//  User.h
//  cell
//
//  Created by mac on 15/8/5.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DUser : NSObject

@property (nonatomic, copy) NSString *userName;
@property (nonatomic, copy) NSString *userImage;
@property (nonatomic, copy) NSString *time;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *loveCount;
@property (nonatomic, copy) NSString *commentCount;
@property (nonatomic, copy) NSString * imageString;
@property (nonatomic, copy) NSString *loveImage;
@property (nonatomic, copy) NSString *commentImage;
@property  (nonatomic, copy)NSArray *Array;
@property (nonatomic,copy) NSArray *detailCommentArray;
+ (instancetype)userWithDict:(NSDictionary *)dict;
+ (instancetype)userWithArr:(NSArray *)array;
@end
