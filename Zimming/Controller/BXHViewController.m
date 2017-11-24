//
//  BXHViewController.m
//  Zimming
//
//  Created by Macbook on 11/20/17.
//  Copyright © 2017 VDPersonal. All rights reserved.
//

#import "ThreadSafeForMutableArray.h"
#import "BXHViewController.h"
#import "AutoScrollVIew.h"
#import "AutoScrollItem.h"
#import "Constants.h"

@interface BXHViewController ()

@property (nonatomic) UIButton* startButton;
@property (nonatomic) AutoScrollVIew* autoScrollView;

@end

@implementation BXHViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView * animatedImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320,80)];
    
    NSArray* testArray  = [[NSArray alloc] initWithObjects:[UIImage imageNamed:@"ic_w1"], [UIImage imageNamed:@"ic_w2"],[UIImage imageNamed:@"ic_w3"],[UIImage imageNamed:@"ic_w4"],[UIImage imageNamed:@"ic_w5"],[UIImage imageNamed:@"ic_w6"],[UIImage imageNamed:@"ic_w7"],nil];
    
    [animatedImageView setAnimationImages:testArray];
    animatedImageView.animationDuration =  0.5;
    animatedImageView.animationRepeatCount = 10000;
    [self.view addSubview: animatedImageView];
    [animatedImageView startAnimating];
    [self setupAutoScrollVIew];
}

#pragma mark - setupAutoScrollVIew

- (void)setupAutoScrollVIew {
    
    _autoScrollView = [[AutoScrollVIew alloc] initWithFrame:CGRectMake(0, 80, DEVICE_WIDTH, 150)];
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
