//
//  SoundCloudItemManager.h
//  Zimming
//
//  Created by Macbook on 11/20/17.
//  Copyright © 2017 VDPersonal. All rights reserved.
//

#import "ThreadSafeForMutableArray.h"
#import <Foundation/Foundation.h>

@interface SoundCloudItemManager : NSObject

#pragma mark public class
+ (instancetype)sharedInstance;

#pragma mark - requestSoundCloudItemFromURL
- (void)requestSoundCloudItemFromURL:(NSString *)URLString callbackQueue:(dispatch_queue_t )queue completion:(void(^)(BOOL granted, ThreadSafeForMutableArray* soundCloudItems))completion;

#pragma mark - requestPlaylistFromURL
- (void)requestPlaylistFromURL:(NSString *)URLString callbackQueue:(dispatch_queue_t )queue completion:(void(^)(BOOL granted, ThreadSafeForMutableArray* soundCloudItems))completion;

#pragma mark - requestAlbumFromURL
- (void)requestAlbumFromURL:(NSString *)URLString callbackQueue:(dispatch_queue_t )queue completion:(void(^)(BOOL granted, ThreadSafeForMutableArray* soundCloudItems))completion;

@end
