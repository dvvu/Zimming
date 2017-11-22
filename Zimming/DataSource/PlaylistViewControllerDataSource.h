//
//  PlaylistViewControllerDataSource.h
//  Zimming
//
//  Created by Macbook on 11/20/17.
//  Copyright © 2017 VDPersonal. All rights reserved.
//

#import "ThreadSafeForMutableArray.h"
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PlaylistViewControllerDataSource : NSObject

#pragma mark - initWithCollectionView
- (instancetype)initWithCollectionView:(UICollectionView *)collectionView;

#pragma mark - setupData
- (void)setupData:(ThreadSafeForMutableArray *)tracks;

@end
