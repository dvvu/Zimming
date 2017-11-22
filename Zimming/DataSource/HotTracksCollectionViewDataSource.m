//
//  HotTracksCollectionViewDataSource.m
//  Zimming
//
//  Created by Macbook on 11/21/17.
//  Copyright © 2017 VDPersonal. All rights reserved.
//

#import "HotTracksCollectionViewDataSource.h"
#import "HotTracksCollectionViewCell.h"
#import "SoundCloudItem.h"

@interface HotTracksCollectionViewDataSource () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic) ThreadSafeForMutableArray* hotTracks;
@property (nonatomic) UICollectionView* collectionView;
@property (nonatomic) dispatch_queue_t loaderItemsQueue;
@property (nonatomic) NSIndexPath* currentSelected;

@end

@implementation HotTracksCollectionViewDataSource

#pragma mark - initWithCollectionView

- (instancetype)initWithCollectionView:(UICollectionView *)collectionView {
    
    if (self = [super init]) {
        
        _hotTracks = [[ThreadSafeForMutableArray alloc] init];
        _loaderItemsQueue = dispatch_queue_create("LOADER_ITEMS_QUEUE", DISPATCH_QUEUE_SERIAL);
        _collectionView = collectionView;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[HotTracksCollectionViewCell class] forCellWithReuseIdentifier:@"HotTracksCollectionViewCell"];
    }
    return self;
}

#pragma mark - setupData

- (void)setupData:(ThreadSafeForMutableArray *)tracks {
    
    dispatch_async(_loaderItemsQueue, ^{
        
        [tracks enumerateObjectsUsingBlock:^(id object, NSUInteger idx, BOOL* stop) {
            
            SoundCloudItem* soundCloudItem = (SoundCloudItem *)object;
            
            HotTracksCollectionViewCellObject* cellObject = [[HotTracksCollectionViewCellObject alloc] init];
            cellObject.title = soundCloudItem.title;
            cellObject.identifier = soundCloudItem.identifier;
            cellObject.artworkURL = soundCloudItem.artworkURL;
            cellObject.streamURL = soundCloudItem.streamURL;
            [_hotTracks addObject:cellObject];
        }];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [_collectionView reloadData];
        });
    });
}

#pragma mark - Overriden methods

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return _hotTracks.count;
}

#pragma mark - cellForItemAtIndexPath

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    HotTracksCollectionViewCell* cell = (HotTracksCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"HotTracksCollectionViewCell" forIndexPath:indexPath];
    HotTracksCollectionViewCellObject* model = [_hotTracks objectAtIndex:indexPath.item];
    
    if (cell.model != model) {
        
        if (indexPath.row == 0 && indexPath.section == 0) {
            
            model.selected = YES;
            _currentSelected = indexPath;
        }
        
        cell.model = model;
        cell.identifier = model.identifier;
        [model getImageCacheForCell:cell];
    }
    
    return cell;
}

#pragma mark - didSelectItemAtIndexPath

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    HotTracksCollectionViewCellObject* model = [_hotTracks objectAtIndex:indexPath.item];
    NSLog(@"%ld", (long)indexPath.row);
}

@end
