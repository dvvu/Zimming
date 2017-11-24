//
//  AutoScrollVIew.m
//  Zimming
//
//  Created by Macbook on 11/23/17.
//  Copyright © 2017 VDPersonal. All rights reserved.
//

#import "ThreadSafeForMutableArray.h"
#import "AutoScrollCollectionViewCellObject.h"
#import "AutoScrollCollectionViewCell.h"
#import "AutoScrollVIew.h"
#import "AutoScrollItem.h"
#import "PageIndexView.h"
#import "Constants.h"
#import "Masonry.h"

@interface AutoScrollVIew () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic) UICollectionViewFlowLayout* layout;
@property (nonatomic) UICollectionView* collectionView;
@property (nonatomic) UIView* contentView;

@property (nonatomic) ThreadSafeForMutableArray* backgroundImages;
@property (nonatomic) dispatch_queue_t loaderItemsQueue;
@property (nonatomic) NSIndexPath* currentSelected;

@property (nonatomic) PageIndexView* pageIndexView;

@end

@implementation AutoScrollVIew

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self setupLayout];
    }
    
    return self;
}

#pragma mark - setup Layout

- (void)setupLayout {
    
    _contentView = [[UIView alloc]initWithFrame:self.frame];
    [self addSubview:_contentView];
    
    _layout = [[UICollectionViewFlowLayout alloc] init];
    _layout.minimumInteritemSpacing = 1;
    _layout.minimumLineSpacing = 0;
    _layout.itemSize = self.frame.size;
    [_layout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:_layout];
    [_collectionView setBackgroundColor:[UIColor whiteColor]];
    [_contentView addSubview:_collectionView];
    
    _loaderItemsQueue = dispatch_queue_create("LOADER_ITEMS_QUEUE", DISPATCH_QUEUE_SERIAL);
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [_collectionView setPagingEnabled:YES];
    [_collectionView registerClass:[AutoScrollCollectionViewCell class] forCellWithReuseIdentifier:@"AutoScrollCollectionViewCell"];
    [_collectionView setShowsHorizontalScrollIndicator:NO];
    _backgroundImages = [[ThreadSafeForMutableArray alloc] init];
    
    [_contentView mas_makeConstraints:^(MASConstraintMaker* make) {
        
        make.edges.equalTo(self);
    }];
    
    [_collectionView mas_makeConstraints:^(MASConstraintMaker* make) {
        
        make.edges.equalTo(_contentView);
    }];
}

#pragma mark - setupData

- (void)setupData:(ThreadSafeForMutableArray *)backgroundImages {
    
    dispatch_async(_loaderItemsQueue, ^{
        
        [backgroundImages enumerateObjectsUsingBlock:^(id object, NSUInteger idx, BOOL* stop) {
            
            AutoScrollItem* autoScrollItem = (AutoScrollItem *)object;
            
            AutoScrollCollectionViewCellObject* cellObject = [[AutoScrollCollectionViewCellObject alloc] init];
            cellObject.title = autoScrollItem.title;
            cellObject.identifier = autoScrollItem.identifier;
            [_backgroundImages addObject:cellObject];
        }];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [_collectionView reloadData];
            _pageIndexView = [[PageIndexView alloc] initWithPages:_backgroundImages.count];
            [self addSubview:_pageIndexView];
            
            [_pageIndexView mas_makeConstraints:^(MASConstraintMaker* make) {
                
                make.left.equalTo(self).offset(8);
                make.right.equalTo(self).offset(-8);
                make.bottom.equalTo(self).offset(-5);
                make.height.equalTo(@10);
            }];
        });
    });
}

#pragma mark - Overriden methods

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return _backgroundImages.count;
}

#pragma mark - cellForItemAtIndexPath

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    AutoScrollCollectionViewCell* cell = (AutoScrollCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"AutoScrollCollectionViewCell" forIndexPath:indexPath];
    AutoScrollCollectionViewCellObject* model = [_backgroundImages objectAtIndex:indexPath.item];
    
    if (cell.model != model) {
        
        if (indexPath.row == 0 && indexPath.section == 0) {
            
            model.selected = YES;
            _currentSelected = indexPath;
        }
        
        cell.model = model;
        cell.identifier = model.identifier;
        cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"ic_s%d",indexPath.row+1]];
        [model getImageCacheForCell:cell];
    }
    
    return cell;
}

#pragma mark - didSelectItemAtIndexPath

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"%ld", (long)indexPath.row);
}

#pragma mark - scrollViewDidEndDecelerating

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    UICollectionViewCell* cell = [_collectionView visibleCells][0];
    NSIndexPath* indexPath = [_collectionView indexPathForCell:cell];
    [_pageIndexView selectObjectAtindex:indexPath.row];
}

@end
