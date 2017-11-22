//
//  CategoriesCollectionViewDataSource.m
//  YummlyDemoApp
//
//  Created by Macbook on 11/16/17.
//  Copyright © 2017 VDPersonal. All rights reserved.
//

#import "CategoriesCollectionViewDataSource.h"
#import "CategoriesCollectionViewCell.h"
#import "CategoryTitles.h"

@interface CategoriesCollectionViewDataSource () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic) ThreadSafeForMutableArray* titles;
@property (nonatomic) UICollectionView* collectionView;
@property (nonatomic) dispatch_queue_t loaderItemsQueue;
@property (nonatomic) NSIndexPath* currentSelected;

@end

@implementation CategoriesCollectionViewDataSource

#pragma mark - initWithCollectionView

- (instancetype)initWithCollectionView:(UICollectionView *)collectionView {
    
    if (self = [super init]) {
        
        _titles = [[ThreadSafeForMutableArray alloc] init];
        _loaderItemsQueue = dispatch_queue_create("LOADER_ITEMS_QUEUE", DISPATCH_QUEUE_SERIAL);
        _collectionView = collectionView;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[CategoriesCollectionViewCell class] forCellWithReuseIdentifier:@"CategoriesCollectionViewCell"];
    }
    return self;
}

#pragma mark - setupData

- (void)setupData:(ThreadSafeForMutableArray *)categories {
    
    dispatch_async(_loaderItemsQueue, ^{
        
        [categories enumerateObjectsUsingBlock:^(id object, NSUInteger idx, BOOL* stop) {
            
            CategoryTitles* categoryTitle = (CategoryTitles *)object;
            
            CategoriesCollectionViewCellObject* cellObject = [[CategoriesCollectionViewCellObject alloc] init];
            cellObject.title = categoryTitle.name;
            cellObject.identifier = categoryTitle.identifier;
            
            [_titles addObject:cellObject];
        }];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [_collectionView reloadData];
        });
    });
}

#pragma mark - Overriden methods

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return _titles.count;
}

#pragma mark - cellForItemAtIndexPath

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CategoriesCollectionViewCell* cell = (CategoriesCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"CategoriesCollectionViewCell" forIndexPath:indexPath];
    CategoriesCollectionViewCellObject* model = [_titles objectAtIndex:indexPath.item];
    
    
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

#pragma mark - collectionViewLayout

//- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
//
//    return UIEdgeInsetsMake(3, 3, 3, 3);
//}

#pragma mark - didSelectItemAtIndexPath

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"%ld", (long)indexPath.row);
    
    if (_currentSelected != indexPath) {
        
        CategoriesCollectionViewCellObject* lastCellObject = [_titles objectAtIndex:_currentSelected.item];
        lastCellObject.selected = NO;
        CategoriesCollectionViewCell* lastCell = (CategoriesCollectionViewCell *)[collectionView cellForItemAtIndexPath:_currentSelected];
        lastCell.model = lastCellObject;
        
        _currentSelected = indexPath;
        
        CategoriesCollectionViewCellObject* cellObject = [_titles objectAtIndex:indexPath.item];
        CategoriesCollectionViewCell* cell = (CategoriesCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
        cellObject.selected = YES;
        cell.model = cellObject;
        [_delegate didSelectedItemWithID:cellObject.identifier];
    }
}

@end
