//
//  HomeViewController.m
//  Zimming
//
//  Created by Macbook on 11/20/17.
//  Copyright © 2017 VDPersonal. All rights reserved.
//

#import "HotTracksCollectionViewDataSource.h"
#import "SoundCloudItemManager.h"
#import "HomeViewController.h"
#import "AutoScrollVIew.h"
#import "AutoScrollItem.h"
#import "Constants.h"
#import "Masonry.h"
#import "API.h"

@interface HomeViewController ()

@property (nonatomic) HotTracksCollectionViewDataSource* hotTracksCollectionViewDataSource;
@property (nonatomic) UICollectionViewFlowLayout* layout;
@property (nonatomic) UICollectionView* collectionView;
@property (nonatomic) AutoScrollVIew* autoScrollView;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupAutoScrollVIew];
    [self setupCollectionView];
    [self setupHotTracksData];
}

#pragma mark - setupViewContronllerIntoScrollView

- (void)setupCollectionView {
    
    _layout = [[UICollectionViewFlowLayout alloc] init];
    _layout.minimumInteritemSpacing = 1;
    _layout.minimumLineSpacing = 5;
    _layout.itemSize = CGSizeMake((DEVICE_WIDTH-22)/2, (DEVICE_WIDTH-22)/8*5);
    
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:_layout];
    [_collectionView setBackgroundColor:[UIColor whiteColor]];
    _hotTracksCollectionViewDataSource = [[HotTracksCollectionViewDataSource alloc] initWithCollectionView:_collectionView];
    [self.view addSubview:_collectionView];
    
    [_collectionView mas_makeConstraints:^(MASConstraintMaker* make) {
        
        make.top.equalTo(_autoScrollView.mas_bottom).offset(5);
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.bottom.equalTo(self.view).offset(-0);;
    }];
}

#pragma mark - setupPlayListData

- (void)setupHotTracksData {
    
    NSString* url = [NSString stringWithFormat:@"%@%@%@", NEWURL, COMEDYURL, ID];
    
    [[SoundCloudItemManager sharedInstance] requestAlbumFromURL:url callbackQueue:nil completion:^(BOOL granted, ThreadSafeForMutableArray* soundCloudItems) {
        
        [_hotTracksCollectionViewDataSource setupData:soundCloudItems];
    }];
}

#pragma mark - setupAutoScrollVIew

- (void)setupAutoScrollVIew {
    
    _autoScrollView = [[AutoScrollVIew alloc] initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, 160)];
    _autoScrollView.layer.cornerRadius = 5;
    [self.view addSubview:_autoScrollView];
    
    ThreadSafeForMutableArray* autoScrollItems = [[ThreadSafeForMutableArray alloc] init];
    for (int i = 0; i < 5; i++) {
        
        AutoScrollItem* autoScrollItem = [[AutoScrollItem alloc] init];
        autoScrollItem.title = @"Pop and Rock";
        autoScrollItem.identifier = [[NSUUID UUID] UUIDString];
        [autoScrollItems addObject:autoScrollItem];
    }
    
    [_autoScrollView setupData:autoScrollItems];
}

@end
