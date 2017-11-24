//
//  PageIndexView.m
//  Zimming
//
//  Created by Macbook on 11/23/17.
//  Copyright © 2017 VDPersonal. All rights reserved.
//

#import "ThreadSafeForMutableArray.h"
#import "PageIndexView.h"
#import "Masonry.h"

@interface PageIndexView () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic) ThreadSafeForMutableArray* cellObjects;
@property (nonatomic) UICollectionViewFlowLayout* layout;
@property (nonatomic) UICollectionView* collectionView;
@property (nonatomic) int curentIndex;
@property (nonatomic) int pages;

@end

@implementation PageIndexView

- (instancetype)initWithPages:(int)pages {
    
    self = [super init];
    
    if (self) {
        
        [self ceatePageIndexs:pages];
    }
    
    return self;
}

#pragma mark - setup Layout

- (void)ceatePageIndexs:(int)pages {
    
    _pages = pages;
    _layout = [[UICollectionViewFlowLayout alloc] init];
    _layout.minimumInteritemSpacing = 8;
    _layout.minimumLineSpacing = 8;
    _layout.itemSize = CGSizeMake(10, 10);
    [_layout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:_layout];
    [_collectionView setBackgroundColor:[UIColor clearColor]];
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"Cell"];
    [_collectionView setDelegate:self];
    [_collectionView setDataSource:self];
    [self addSubview:_collectionView];
    
    [_collectionView mas_makeConstraints:^(MASConstraintMaker* make) {
        
        make.edges.equalTo(self);
    }];
}

#pragma mark - selectObjectAtindex

- (void)selectObjectAtindex:(int)index {
    
    if (_curentIndex != index) {
        
        _curentIndex = index;
        [_collectionView reloadData];
    }
}

#pragma mark - Overriden methods

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return _pages;
}

#pragma mark - cellForItemAtIndexPath

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    [cell.contentView.layer setCornerRadius:cell.contentView.frame.size.height/2];
    
    if (indexPath.row == _curentIndex) {
        
        [cell.contentView setBackgroundColor:[UIColor redColor]];
    } else {
        
        [cell.contentView setBackgroundColor:[UIColor whiteColor]];
    }

    return cell;
}

@end
