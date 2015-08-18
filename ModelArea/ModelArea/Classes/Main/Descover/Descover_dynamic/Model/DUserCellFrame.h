//
//  CommentCellFrame.h
//  GoCourse
//
//  Created by jewelz on 15/2/7.
//  Copyright (c) 2015年 yangtzeU. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DUser;
@interface DUserCellFrame : NSObject

@property (strong, nonatomic) DUser *user;
@property (assign, nonatomic) CGRect contentF;
@property (assign, nonatomic) CGRect nameF;
@property (assign, nonatomic) CGRect timeF;
@property (assign, nonatomic) CGRect viewF;
@property (assign, nonatomic) CGFloat cellHeight;
@property (nonatomic, strong) NSArray *srcStringArray;
@property (nonatomic,strong) NSArray *detailCommentArray;
@property(assign ,nonatomic) CGRect commentF;
+ (instancetype)userFrameWithUser:(DUser *)user;

@end
