//
//  NetworkingManagerment.h
//  BGL
//
//  Created by Share Gray on 12/3/15.
//  Copyright © 2015 STS. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "API.h"
#import "AFNetworking.h"
#import "AFHTTPSessionManager.h"

#define ERROR           @"error"
#define ERROR_CODE      @"errorCode"
#define ERROR_MESSAGE   @"error_description"
#define ERROR_MESSAGE1   @"errorMessage"

@interface NetworkingClient : AFHTTPSessionManager

+ (NetworkingClient *)sharedClient;

- (void)requestAPIURL:(NSString *)strURL withParams:(id)params headers:(NSDictionary *)header methodType:(METHOD_TYPE)type successHandler:(void (^)(id responseDict))resultHandler errorHandler:(void (^)(NSError *error))errorHandle;

@end
