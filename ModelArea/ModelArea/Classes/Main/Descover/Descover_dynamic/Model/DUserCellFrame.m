 //
//  CommentCellFrame.m
//  GoCourse
//
//  Created by jewelz on 15/2/7.
//  Copyright (c) 2015年 yangtzeU. All rights reserved.
//

#import "DUserCellFrame.h"
#import "UserDefault.h"
#import "DUser.h"

@implementation DUserCellFrame
+ (instancetype)userFrameWithUser:(DUser *)user {
    
    return [[self alloc] initWithUser:user];
}

- (instancetype)initWithUser:(DUser *)user {

        self = [super init];
        if (self) {
            _user = user;
           [self setupCellFrame];
            
        }
        return self;
}

- (void)setupCellFrame {
    
//    CGRect contentRect = getRectFromText(self.user.content, CGSizeMake(280, 1000), [UIFont systemFontOfSize:14]);
//    
//    self.contentF = CGRectMake(10, 8, contentRect.size.width, contentRect.size.height);
//    
//    if (self.user.userImage) {
//        self.imageF = CGRectMake(10,CGRectGetMaxY(self.contentF)+8, 50, 50);
//    }
//    
//    self.cellHeight = CGRectGetMaxY(self.contentF) + self.imageF.size.height +8 + 8;
//    
//    NSLog(@"frame -----content: %@, image: %@, height: %f", NSStringFromCGRect(self.contentF),  NSStringFromCGRect(self.imageF), self.cellHeight);
    int i=1;
   
    CGRect nameRect =getRectFromText(self.user.userName,  CGSizeMake(200, LONG_MAX) ,[UIFont systemFontOfSize:14]);
    self.nameF =CGRectMake(150/2, 30/2, 200, nameRect.size.height);
    
     CGRect contentRect =getRectFromText(self.user.content,  CGSizeMake(250, LONG_MAX) ,[UIFont systemFontOfSize:13]);
    self.contentF =CGRectMake(150/2, 40, 250,contentRect.size.height);
    
    CGRect timeRect =getRectFromText(self.user.time,  CGSizeMake(100, LONG_MAX) ,[UIFont systemFontOfSize:12]);
    self.timeF =CGRectMake(kScreenWidth-120, 30/2, 100,timeRect.size.height );
   
    _srcStringArray =[[NSArray alloc]init];
    _srcStringArray =_user.Array;
    NSLog(@"+++++++++++%d",_srcStringArray.count);
    if (_srcStringArray.count!=0) {
        self.viewF =CGRectMake(130/2, 170/2, kScreenWidth, 150);
            self.cellHeight =40+contentRect.size.height+230+10+120+50;
        NSLog(@"123456");
    }
    else{
        self.cellHeight =40+contentRect.size.height+40+130+50;
         NSLog(@"===========");
    }
//    _detailCommentArray =[[NSArray alloc]init];
//    _detailCommentArray=_user.detailCommentArray;
//    for (int i=0; i<
//         _detailCommentArray.count; i++) {
//          CGRect detailComment =getRectFromText(_detailCommentArray[i],  CGSizeMake(200, LONG_MAX) ,[UIFont systemFontOfSize:14]);
//        self.commentF.=CGRectMake(150/2, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)
//    }
//    if (i%2==1) {
////        if (self.user.imageArray.count<=3) {
////        
////        }
//        self.viewF =CGRectMake(130/2, 170/2, kScreenWidth, 150);
//         self.cellHeight =40+contentRect.size.height+220;
//    }
//    else{
//         self.cellHeight =40+contentRect.size.height;
//    }
 

}
    


@end


