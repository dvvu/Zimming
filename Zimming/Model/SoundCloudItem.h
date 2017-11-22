//
//  SoundCloudItem.h
//  Zimming
//
//  Created by Macbook on 11/20/17.
//  Copyright © 2017 VDPersonal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"

@interface SoundCloudItem : NSObject

@property (nonatomic) NSString* identifier;
@property (nonatomic) MediaType type;
@property (nonatomic) NSString* title;
@property (nonatomic) NSString* permalinURL;
@property (nonatomic) double duration;
@property (nonatomic) NSString* waveformURL;
@property (nonatomic) NSString* artworkURL;
@property (nonatomic) NSString* streamURL;

#pragma mark - initWithPHAsset
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
