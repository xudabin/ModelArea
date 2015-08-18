//
//  HUAFNetworking.m
//  GoCourse
//
//  Created by jewelz on 15/2/28.
//  Copyright (c) 2015年 yangtzeU. All rights reserved.
//

#import "MANetworkingAPI.h"
#import <AFNetworking.h>
@interface MANetworkingAPI()
@property (strong, nonatomic) AFHTTPRequestOperationManager *manager;
@property (nonatomic, weak) NSDictionary *rawData;
@end

@implementation MANetworkingAPI

+ (instancetype)netWorking {
    return [[self alloc] init];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _manager = [AFHTTPRequestOperationManager manager];
        
        NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingUTF8);
        _manager.requestSerializer.stringEncoding = enc;
        [_manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
        _manager.requestSerializer.timeoutInterval = 5.0f;
        [_manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
       // _manager.requestSerializer = [AFHTTPRequestSerializer serializer];
        //_manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        //[_manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        //[_manager.requestSerializer setValue:@"application/json;charset=utf-8" forHTTPHeaderField:@"Content-Type"];
        _manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html", @"text/json",@"text/javascript", nil];
    }
    return self;
}

- (void)startRequestWithGET:(NSString *)url parameters:(id)parameters {
    NSString *fUrl = [NSString stringWithFormat:@"%@%@", HOST, url];
    __weak typeof(self) weakself = self;
    
    [_manager GET:fUrl parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        self.rawData = responseObject;
        //NSLog(@"response: %@", operation.response);
        if ([self.delegate respondsToSelector:@selector(networkingAPI:didSuccessWithResponseObject:)]) {
            [weakself.delegate networkingAPI:self didSuccessWithResponseObject:responseObject];
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSString *errorMsg = [self errorMsgFromeErrorMsg:error.userInfo[NSLocalizedDescriptionKey]];
        
        if ([self.delegate respondsToSelector:@selector(networkingAPI:didFailWithErrorMsg:)]) {
            [weakself.delegate networkingAPI:self didFailWithErrorMsg:errorMsg];
        }
    }];

}


- (void)startRequestWithPOST:(NSString *)url parameters:(id)parameters {
    NSString *fUrl = [NSString stringWithFormat:@"%@%@", HOST, url];
    __weak typeof(self) weakself = self;
    
    [_manager POST:fUrl parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //NSLog(@"response: %@", operation.response);
        self.rawData = responseObject;
        if ([self.delegate respondsToSelector:@selector(networkingAPI:didSuccessWithResponseObject:)]) {
            [weakself.delegate networkingAPI:self didSuccessWithResponseObject:responseObject];
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSString *errorMsg = [self errorMsgFromeErrorMsg:error.userInfo[NSLocalizedDescriptionKey]];
        
        if ([self.delegate respondsToSelector:@selector(networkingAPI:didFailWithErrorMsg:)]) {
            [weakself.delegate networkingAPI:self didFailWithErrorMsg:errorMsg];
        }
    }];

}

- (id)fetchDataWithReformer:(id<MAReformerProtocol>)reformer {
    if (!reformer) {
        return self.rawData;
    }
    return [reformer reformDataWithOriginData:self.rawData];;
}

- (NSString *)errorMsgFromeErrorMsg:(NSString *)errorMsg {
    if ([errorMsg isEqualToString:@"The request timed out."]) {
        return @"连接超时";
    }
    if ([errorMsg isEqualToString:@"Could not connect to the server."]) {
        return @"服务器开了点小差，先休息下吧";
    }
    
    return @"连接超时";
}

@end
