//
//  SoundCloudItemManager.m
//  Zimming
//
//  Created by Macbook on 11/20/17.
//  Copyright © 2017 VDPersonal. All rights reserved.
//

#import "SoundCloudItemManager.h"
#import "NetworkingClient.h"
#import "SoundCloudItem.h"
#import "API.h"

@interface SoundCloudItemManager ()

@property (nonatomic) dispatch_queue_t mediaLoaderQueue;

@end

@implementation SoundCloudItemManager

+ (instancetype)sharedInstance {
    
    static SoundCloudItemManager* sharedInstance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        sharedInstance = [[SoundCloudItemManager alloc] init];
    });
    
    return sharedInstance;
}

#pragma mark - init

- (instancetype)init {
    
    self = [super init];
    
    if (self) {
        
        _mediaLoaderQueue = dispatch_queue_create("SOUND_CLOUD_ITEM_LOADER_QUEUE", DISPATCH_QUEUE_SERIAL);
        [NetworkingClient sharedClient].requestSerializer = [AFHTTPRequestSerializer serializer];
        [NetworkingClient sharedClient].responseSerializer = [AFHTTPResponseSerializer serializer];
    }
    
    return self;
}

#pragma mark - requestAuthorization
- (void)requestPlaylistFromURL:(NSString *)URLString callbackQueue:(dispatch_queue_t )queue completion:(void(^)(BOOL granted, ThreadSafeForMutableArray* soundCloudItems))completion {
    
    ThreadSafeForMutableArray* playlist = [[ThreadSafeForMutableArray alloc] init];
    [[NetworkingClient sharedClient] requestAPIURL:URLString withParams:nil headers:nil methodType:METHOD_GET successHandler:^(id response) {
        
        NSDictionary* responseDict;
        if (![response isKindOfClass:[NSDictionary class]]) {
            
            responseDict = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableContainers error:nil];
            
            if (responseDict) {
                
                for (NSDictionary* dictionary in responseDict) {
                    
                    NSDictionary* tracks = [dictionary objectForKey:@"tracks"];
               
                    for (NSDictionary* track in tracks) {
                        
                        SoundCloudItem* soundCloudItem = [[SoundCloudItem alloc] initWithDictionary:track];
                      
                        if (soundCloudItem) {
                            
                            [playlist addObject:soundCloudItem];
                        }
                    }
                }
                
                if (completion) {
                    
                    completion (YES, playlist);
                }
            }
        }
    } errorHandler:^(NSError* error) {
        
        if (completion) {
            
            completion (NO, nil);
        }
        NSLog(@"Error URL: %@", URLString);
    }];
}

#pragma mark - requestAuthorization

- (void)requestSoundCloudItemFromURL:(NSString *)URLString callbackQueue:(dispatch_queue_t )queue completion:(void(^)(BOOL granted, ThreadSafeForMutableArray* soundCloudItems))completion {
    
    ThreadSafeForMutableArray* track = [[ThreadSafeForMutableArray alloc] init];
    [[NetworkingClient sharedClient] requestAPIURL:URLString withParams:nil headers:nil methodType:METHOD_GET successHandler:^(id response) {
        
        NSDictionary* responseDict;
        if (![response isKindOfClass:[NSDictionary class]]) {
            
            responseDict = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableContainers error:nil];
            
            if (responseDict) {
                
                for (NSDictionary* dictionary in responseDict) {
                    
                    SoundCloudItem* soundCloudItem = [[SoundCloudItem alloc] initWithDictionary:dictionary];
                    
                    if (soundCloudItem) {
                        
                        [track addObject:soundCloudItem];
                    }
                }
                
                if (completion) {
                    
                    completion (YES, track);
                }
            }
        }
    } errorHandler:^(NSError* error) {
        
        if (completion) {
            
            completion (NO, nil);
        }
        NSLog(@"Error URL: %@", URLString);
    }];
}

#pragma mark - requestAuthorization

- (void)requestAlbumFromURL:(NSString *)URLString callbackQueue:(dispatch_queue_t )queue completion:(void(^)(BOOL granted, ThreadSafeForMutableArray* soundCloudItems))completion {
    
    ThreadSafeForMutableArray* album = [[ThreadSafeForMutableArray alloc] init];
    [[NetworkingClient sharedClient] requestAPIURL:URLString withParams:nil headers:nil methodType:METHOD_GET successHandler:^(id response) {
        
        NSDictionary* responseDict;
        if (![response isKindOfClass:[NSDictionary class]]) {
            
            responseDict = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableContainers error:nil];
            
            if (responseDict) {
                
                NSDictionary* collection = [responseDict objectForKey:@"collection"];
                
                for (NSDictionary* tracks in collection) {
                    
                    NSDictionary* track = [tracks objectForKey:@"track"];
                    SoundCloudItem* soundCloudItem = [[SoundCloudItem alloc] initWithDictionary:track];
           
                    if (soundCloudItem) {
                        
                        [album addObject:soundCloudItem];
                    }
                }
                
                if (completion) {
                    
                    completion (YES, album);
                }
            }
        }
    } errorHandler:^(NSError* error) {
        
        if (completion) {
            
            completion (NO, nil);
        }
        NSLog(@"Error URL: %@", URLString);
    }];
}

@end
