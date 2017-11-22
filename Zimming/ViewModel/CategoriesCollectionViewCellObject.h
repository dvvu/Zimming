//
//  CategoriesCollectionViewCellObject.h
//  YummlyDemoApp
//
//  Created by Macbook on 11/16/17.
//  Copyright © 2017 VDPersonal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"

@protocol CategoriesCollectionViewCellObjectProtocol <NSObject>

@property (readonly, nonatomic, copy) NSString* title;
@property (readonly, nonatomic) int identifier;
@property (readonly, nonatomic) BOOL selected;

@end

@interface CategoriesCollectionViewCellObject : NSObject <CategoriesCollectionViewCellObjectProtocol>

@property (nonatomic, copy) NSString* title;
@property (nonatomic) int identifier;
@property (nonatomic) BOOL selected;

- (void)getImageCacheForCell:(UICollectionViewCell *)cell;

@end
