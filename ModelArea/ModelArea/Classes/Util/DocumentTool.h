//
//  DocumentTool.h
//  HealthCare
//
//  Created by jewelz on 14-10-9.
//  Copyright (c) 2014年 yangtzeU. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DocumentTool : NSObject
{
    NSString *_path;
    NSMutableArray *_array;
}

/*!
   向沙盒中写入文件, 向一个文件中写入多条数据用此方法
  @param dict 要写入的字典
  @param fileName 文件名
 */
- (void) write:(NSDictionary *)dict ToFileWithFileName:(NSString *)fileName;

/*!
 删除沙盒中文件中某条数据
 @param index 要删除数据的索引
 @param path 文件全路径
 */
- (void) remove:(NSUInteger)index fromContentsOfFile:(NSString *)path;

/*!
 删除沙盒中文件中所有的数据
 @param path 文件全路径
 */
- (void) removefromContentsOfFile:(NSString *)path;


- (NSMutableArray *) openContentsOfDefaultFile;

/*!
 获取沙盒中的数据
 @param fileName  文件名
 */
- (NSMutableArray *) openContentsOfFileWithFileName:(NSString *)fileName;

/*!
 向沙盒中写入文件, 向一个文件中写一条数据用此方法
 @param dict 要写入的字典
 @param fileName 文件名
 */
+ (void) write:(NSDictionary *)dict ToFileWithFileName:(NSString *)fileName;

/*!
    获取沙盒中的数据
 @param fileName  文件名
 */
+ (NSDictionary *) openContentsOfFileWithFileName:(NSString *)fileName;

+ (id)sharedDocumentTool;

@end
