//
//  PlayListCollectionViewCellObject.h
//  Zimming
//
//  Created by Macbook on 11/20/17.
//  Copyright © 2017 VDPersonal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"

@protocol PlayListCollectionViewCellObjectProtocol <NSObject>

@property (readonly, nonatomic, copy) NSString* title;
@property (readonly, nonatomic) NSString* identifier;
@property (readonly, nonatomic) NSString* artworkURL;
@property (readonly, nonatomic) NSString* streamURL;
@property (readonly, nonatomic) BOOL selected;

@end

@interface PlayListCollectionViewCellObject : NSObject <PlayListCollectionViewCellObjectProtocol>

@property (nonatomic, copy) NSString* title;
@property (nonatomic) NSString* identifier;
@property (nonatomic) NSString* artworkURL;
@property (nonatomic) NSString* streamURL;
@property (nonatomic) BOOL selected;

- (void)getImageCacheForCell:(UICollectionViewCell *)cell;

@end
