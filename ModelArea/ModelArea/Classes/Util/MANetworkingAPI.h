//
//  HUAFNetworking.h
//  GoCourse
//
//  Created by jewelz on 15/2/28.
//  Copyright (c) 2015年 yangtzeU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MAReformerDelegate.h"

typedef NS_ENUM(NSInteger, MANetWorkingErrorType) {
    MANetWorkingErrorTypeTimeOut = 0,
    MANetWorkingErrorTypeOutOfCollection
};

@class MANetworkingAPI;
@protocol MANetworkingAPIDelegate <NSObject>


@optional
/// call when the request succeed
- (void)networkingAPI:(MANetworkingAPI *)networkingAPI didFailWithErrorMsg:(NSString *)errorMsg;

/**
 * call when the request succeed
 */
- (void)networkingAPI:(MANetworkingAPI *)networkingAPI didSuccessWithResponseObject:(id)responseObject;

@end

@interface MANetworkingAPI : NSObject

@property (weak, nonatomic) id<MANetworkingAPIDelegate> delegate;

+ (instancetype)netWorking;

/*!
   get请求
   param url 请求地址
   param parameters 请求参数
 */
- (void)startRequestWithGET:(NSString *)url parameters:(id)parameters;

/*!
   post请求
   param url 请求地址
   param parameters 请求参数
 */
- (void)startRequestWithPOST:(NSString *)url parameters:(id)parameters ;

/*!
 根据传入的数据解析对象解析数据
 param 遵守MAReformerProtocol的任何对象
 */
- (id)fetchDataWithReformer:(id<MAReformerProtocol>)reformer;

@end
