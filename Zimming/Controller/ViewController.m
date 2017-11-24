//
//  ViewController.m
//  Zimming
//
//  Created by Macbook on 11/20/17.
//  Copyright © 2017 VDPersonal. All rights reserved.
//

#import "SoundCloudItemManager.h"
#import "ViewController.h"
#import "NetworkingClient.h"
#import "Constants.h"
#import "API.h"

#import "CategoriesCollectionViewDataSource.h"
#import "ResultSearchTableViewController.h"
#import "HomeViewController.h"
#import "PlaylistViewController.h"
#import "BXHViewController.h"
#import "TopicViewController.h"
#import "CategoryTitles.h"

@interface ViewController () <CategoriesCollectionViewDataSourceDelegate, UISearchResultsUpdating>

@property (nonatomic) PlaylistViewController* playlistViewController;
@property (nonatomic) TopicViewController* topicViewController;
@property (nonatomic) HomeViewController* homeViewController;
@property (nonatomic) BXHViewController* bXHViewController;

@property (weak, nonatomic) IBOutlet UICollectionView *titleCollectionView;
@property (weak, nonatomic) IBOutlet UIScrollView* scrollView;
@property (weak, nonatomic) IBOutlet UIView* parentView;

@property (nonatomic) CategoriesCollectionViewDataSource* categoriesCollectionViewDataSource;
@property (nonatomic) UICollectionViewFlowLayout* layout;
@property (nonatomic) ThreadSafeForMutableArray* titles;

@property (nonatomic) ResultSearchTableViewController* resultSearchTableViewController;
@property (nonatomic) UISearchController* searchController;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];    
    _layout = [[UICollectionViewFlowLayout alloc] init];
    _layout.itemSize = CGSizeMake((DEVICE_WIDTH - 30)/4, 50);
    [_layout setScrollDirection:UICollectionViewScrollDirectionHorizontal];

    [_titleCollectionView setCollectionViewLayout:_layout];
    _categoriesCollectionViewDataSource = [[CategoriesCollectionViewDataSource alloc] initWithCollectionView:_titleCollectionView];
    _categoriesCollectionViewDataSource.delegate = self;
    
    [self setupTitleData];
    [self setupViewContronllerIntoScrollView];
}

#pragma mark - setupViewContronllerIntoScrollView

- (void)setupViewContronllerIntoScrollView {
    
    // HomeViewController
    _homeViewController = [[HomeViewController alloc] init];
    CGRect homeFrame = _parentView.frame;
    homeFrame.origin.y = 0;
    _homeViewController.view.frame = homeFrame;
    [self addChildViewController:_homeViewController];
    [_scrollView addSubview:_homeViewController.view];
    [_homeViewController didMoveToParentViewController:self];
    
    // PlaylistViewController
    _playlistViewController = [[PlaylistViewController alloc] init];
    CGRect playlist = homeFrame;
    playlist.origin.x = DEVICE_WIDTH;
    _playlistViewController.view.frame = playlist;
    [self addChildViewController:_playlistViewController];
    [_scrollView addSubview:_playlistViewController.view];
    [_playlistViewController didMoveToParentViewController:self];

    // BXHViewController
    _bXHViewController = [[BXHViewController alloc] init];
    CGRect bXHFrame = homeFrame;
    bXHFrame.origin.x = DEVICE_WIDTH * 2;
    _bXHViewController.view.frame = bXHFrame;
    [self addChildViewController:_bXHViewController];
    [_scrollView addSubview:_bXHViewController.view];
    [_bXHViewController didMoveToParentViewController:self];

    // TopicViewController
    _topicViewController = [[TopicViewController alloc] init];
    CGRect topicFrame = homeFrame;
    topicFrame.origin.x = DEVICE_WIDTH * 3;
    _topicViewController.view.frame = topicFrame;
    [self addChildViewController:_topicViewController];
    [_scrollView addSubview:_topicViewController.view];
    [_topicViewController didMoveToParentViewController:self];
    
    // scrolview viewController
    _scrollView.pagingEnabled = YES;
    [_scrollView setBounces:NO];
//    _scrollView.scrollEnabled = NO;
    _scrollView.contentSize = CGSizeMake(DEVICE_WIDTH, _parentView.frame.size.height-100);
    [_scrollView setContentOffset:CGPointMake(0, _scrollView.frame.origin.y) animated:NO];
}

#pragma mark - setupTitleData

- (void)setupTitleData {
    
    _titles = [[ThreadSafeForMutableArray alloc] init];
    
    NSArray* titles = [NSArray arrayWithObjects: @"Home", @"Playlist", @"BXH", @"Topic", nil];
    
    for (int i = 0; i < 4; i++) {
        
        CategoryTitles* categoryTitles = [[CategoryTitles alloc] initWithName:[titles objectAtIndex:i] identifier:i];
        
        [_titles addObject:categoryTitles];
    }
    
    [_categoriesCollectionViewDataSource setupData:_titles];
}

#pragma mark - didSelectedItemWithID delegate

- (void)didSelectedItemWithID:(int)idendifier {
    
    [_scrollView setContentOffset:CGPointMake(idendifier * DEVICE_WIDTH, _scrollView.frame.origin.y) animated:YES];
}

#pragma mark - Create searchBar

- (void)createSearchController {
    
    _resultSearchTableViewController = [[ResultSearchTableViewController alloc] init];
    _searchController = [[UISearchController alloc] initWithSearchResultsController:_resultSearchTableViewController];
    _searchController.searchResultsUpdater = self;
    _searchController.searchBar.searchBarStyle = UISearchBarStyleMinimal;
    _searchController.dimsBackgroundDuringPresentation = YES;
    _searchController.searchBar.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleBottomMargin;
    [[UITextField appearanceWhenContainedIn:[UISearchBar class], nil] setTextColor:[UIColor blackColor]];
//    [_searchController addSubview:_searchController.searchBar];
    [_searchController.searchBar sizeToFit];
}

#pragma mark - updateSearchResultViewController

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    
    NSString* searchString = searchController.searchBar.text;
    NSLog(@"%@",searchString);
//    NSPredicate* predicate = [NSPredicate predicateWithFormat:@"firstName contains[cd] %@ OR lastName contains[cd] %@ OR phoneNumber contains[cd] %@ OR company contains[cd] %@", searchString, searchString, searchString, searchString];
//
//    [[CoreDataManager sharedInstance] getEntitiesFromClass:CONTACT withCondition:predicate callbackQueue:nil success:^(NSArray* results) {
//
//        [_searchResultTableViewController repareData:results];
//    } failed:^(NSError* error) {
//
//        NSLog(@"%@",error);
//    }];
}

- (IBAction)searchAction:(id)sender {
    
    [_searchController.searchBar becomeFirstResponder];
}

@end
