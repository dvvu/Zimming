//
//  CategoriesCollectionViewDataSource.h
//  YummlyDemoApp
//
//  Created by Macbook on 11/16/17.
//  Copyright © 2017 VDPersonal. All rights reserved.
//

#import "ThreadSafeForMutableArray.h"
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol CategoriesCollectionViewDataSourceDelegate <NSObject>

#pragma mark - didSelectedItemWithID
- (void)didSelectedItemWithID:(int)identifier;

@end

@interface CategoriesCollectionViewDataSource : NSObject

@property (nonatomic) id <CategoriesCollectionViewDataSourceDelegate> delegate;

#pragma mark - initWithCollectionView
- (instancetype)initWithCollectionView:(UICollectionView *)collectionView;

#pragma mark - setupData
- (void)setupData:(ThreadSafeForMutableArray *)categories;

@end
