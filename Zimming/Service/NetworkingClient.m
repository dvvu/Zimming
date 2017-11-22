//
//  NetworkingManagerment.m
//  BGL
//
//  Created by Share Gray on 12/3/15.
//  Copyright © 2015 STS. All rights reserved.
//

#import "NetworkingClient.h"

@implementation NetworkingClient

#pragma mark - Singleton

+ (NetworkingClient *)sharedClient {
    
    static NetworkingClient* requests = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        requests = [[NetworkingClient alloc] initWithBaseURL:[NSURL URLWithString:@""]];
        
    });
    return requests;
}

#pragma mark - custom initialization

- (id)initWithBaseURL:(NSURL *)url {
    
    self = [super initWithBaseURL:url];
   
    if (self) {
        
        self.requestSerializer = [AFJSONRequestSerializer serializer];
        self.responseSerializer = [AFJSONResponseSerializer serializer];
    }
    
    return self;
}

- (void)requestAPIURL:(NSString *)strURL withParams:(id)params headers:(NSDictionary *)header methodType:(METHOD_TYPE)type successHandler:(void (^)(id responseDict))resultHandler errorHandler:(void (^)(NSError *error))errorHandler {
    
    if (header != nil) {
        
        for (NSString* key in [header allKeys]) {
        
            [self.requestSerializer setValue:header[key] forHTTPHeaderField:key];
        }
    }
    
    switch (type) {
            
        case METHOD_GET: {
            
            [self GET:strURL parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
                if (resultHandler) {
                
                    resultHandler(responseObject);
                }
                
            } failure:^(NSURLSessionDataTask* _Nullable task, NSError* _Nonnull error) {
              
                NSError* err = [NetworkingClient processError:error];
                
                if (errorHandler) {
                
                    errorHandler(err);
                }
            }];
        }
            break;
            
        case METHOD_POST: {
            
            [self POST:strURL parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                
                if (resultHandler) {
                
                    resultHandler(responseObject);
                }
            } failure:^(NSURLSessionDataTask* _Nullable task, NSError* _Nonnull error) {
                
                NSError* err = [NetworkingClient processError:error];
                
                if (errorHandler) {
                
                    errorHandler(err);
                }
            }];
        }
            break;
        default:
            break;
    }
    
}

+ (NSError *)processError:(NSError *)error {
    
    NSHTTPURLResponse *response = error.userInfo[AFNetworkingOperationFailingURLResponseErrorKey];
    NSInteger statusCode = response.statusCode;
    
    if (statusCode == 403) {
        
        NSError* err = [NSError errorWithDomain:@"Warning" code:error.code userInfo:@{NSLocalizedDescriptionKey:@"You need to login again!"}];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"TockenExpired" object:nil];
        return err;
    }
    
    NSData* errorData = error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey];
    
    if (errorData.length) {
    
        NSDictionary* serializedData = [NSJSONSerialization JSONObjectWithData: errorData options:kNilOptions error:nil];
        
        if (serializedData[ERROR_MESSAGE]) {
            
            NSError* err = [NSError errorWithDomain:serializedData[ERROR_MESSAGE] code:error.code userInfo:@{NSLocalizedDescriptionKey:serializedData[ERROR_MESSAGE]}];
            
            return err;
        } else if (serializedData[ERROR_MESSAGE1]) {
            
            NSError* err = [NSError errorWithDomain:serializedData[ERROR_MESSAGE1] code:error.code userInfo:@{NSLocalizedDescriptionKey:serializedData[ERROR_MESSAGE1]}];
            return err;
        } else if (serializedData[ERROR]) {
            
            NSError* err = [NSError errorWithDomain:serializedData[ERROR] code:error.code userInfo:@{NSLocalizedDescriptionKey:serializedData[ERROR]}];
            return err;
        }
    }
    
    return error;
}

@end
