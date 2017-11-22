//
//  SoundCloudItem.m
//  Zimming
//
//  Created by Macbook on 11/20/17.
//  Copyright © 2017 VDPersonal. All rights reserved.
//

#import "SoundCloudItem.h"

@interface SoundCloudItem ()

@end

@implementation SoundCloudItem

#pragma mark - initWithPHAsset

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    
    self = [super init];
    
    if (self) {
        
        _identifier = [NSString stringWithFormat:@"%ld", [[dictionary objectForKey:@"id"] longValue]];
//        NSLog(@"%@",_identifier);
        _title = [dictionary objectForKey:@"title"];
        _permalinURL = [dictionary objectForKey:@"permalink_url"];
        _duration = [[dictionary objectForKey:@"duration"] doubleValue];
        _waveformURL = [dictionary objectForKey:@"waveform_url"];
        _streamURL = [dictionary objectForKey:@"stream_url"];
        _artworkURL = [dictionary objectForKey:@"artwork_url"];
    }
    
    return  self;
}

- (instancetype)init {
    
    self = [super init];
    
    if (self) {
    
        _identifier = nil;
        _type = Track;
        _title = @"No found";
        _permalinURL = nil;
        _duration = 0.0;
        _waveformURL = @"";
    }
    
    return  self;
}

@end
