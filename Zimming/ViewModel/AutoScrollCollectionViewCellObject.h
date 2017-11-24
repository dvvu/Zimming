//
//  AutoScrollCollectionViewCellObject.h
//  Zimming
//
//  Created by Macbook on 11/23/17.
//  Copyright © 2017 VDPersonal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"

@protocol AutoScrollCollectionViewCellObjectProtocol <NSObject>

@property (readonly, nonatomic, copy) NSString* title;
@property (readonly, nonatomic) NSString* identifier;
@property (readonly, nonatomic) BOOL selected;

@end

@interface AutoScrollCollectionViewCellObject : NSObject <AutoScrollCollectionViewCellObjectProtocol>

@property (nonatomic, copy) NSString* title;
@property (nonatomic) NSString* identifier;
@property (nonatomic) BOOL selected;

- (void)getImageCacheForCell:(UICollectionViewCell *)cell;

@end
