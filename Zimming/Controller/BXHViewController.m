//
//  BXHViewController.m
//  Zimming
//
//  Created by Macbook on 11/20/17.
//  Copyright © 2017 VDPersonal. All rights reserved.
//

#import "BXHViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "HysteriaPlayer.h"

@interface BXHViewController () <AVAudioSessionDelegate, HysteriaPlayerDelegate, HysteriaPlayerDataSource>

@property (nonatomic) UIButton* startButton;
@end

@implementation BXHViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _startButton = [[UIButton alloc] init];
    [_startButton setTitle:@"Play" forState:UIControlStateNormal];
    [_startButton setBackgroundColor:[UIColor redColor]];
    _startButton.frame = CGRectMake(200, 200, 100, 100);
    [_startButton addTarget:self
                     action:@selector(btnTapped:)forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:_startButton];
    
//    HysteriaPlayer* hysteriaPlayer = [HysteriaPlayer sharedInstance];
//    hysteriaPlayer.delegate = self;
//    hysteriaPlayer.datasource = self;
//
//    [hysteriaPlayer setPlayerRepeatMode:HysteriaPlayerRepeatModeOff];
//    [hysteriaPlayer enableMemoryCached:NO];
//
//    [hysteriaPlayer setupPlayerItemWithUrl:[NSURL URLWithString:@"https://api.soundcloud.com/tracks/358364042/stream?client_id=XSGYiNkhWe60LlcYKwdw"] index:0];
//
////    [[HysteriaPlayer sharedInstance] fetchAndPlayPlayerItem:0];
//    [[HysteriaPlayer sharedInstance] play];
}

- (IBAction)btnTapped:(id)sender {
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//
//        [[HysteriaPlayer sharedInstance] fetchAndPlayPlayerItem:0];
//        if ([[HysteriaPlayer sharedInstance] isPlaying]) {
//
//            [[HysteriaPlayer sharedInstance] pause];
//        } else {
//
//            [[HysteriaPlayer sharedInstance] play];
//        }
//    });
}

- (void)hysteriaPlayerWillChangedAtIndex:(NSInteger)index {
    
}

- (void)hysteriaPlayerCurrentItemChanged:(AVPlayerItem *)item{
    
}

- (void)hysteriaPlayerRateChanged:(BOOL)isPlaying {
    
}

- (void)hysteriaPlayerDidReachEnd {
    
}

- (void)hysteriaPlayerCurrentItemPreloaded:(CMTime)time {
    
}

- (void)hysteriaPlayerDidFailed:(HysteriaPlayerFailed)identifier error:(NSError *)error {
    
}
- (void)hysteriaPlayerReadyToPlay:(HysteriaPlayerReadyToPlay)identifier {
    
}

- (void)hysteriaPlayerItemFailedToPlayEndTime:(AVPlayerItem *)item error:(NSError *)error {
    
}

- (void)hysteriaPlayerItemPlaybackStall:(AVPlayerItem *)item {
    
}

#pragma mark - HysteriaPlayerDataSource

- (NSInteger)hysteriaPlayerNumberOfItems {
    
    return 1;
}

- (NSURL *)hysteriaPlayerURLForItemAtIndex:(NSInteger)index preBuffer:(BOOL)preBuffer {
    
    return [NSURL URLWithString:@"https://api.soundcloud.com/tracks/358364042/stream?client_id=XSGYiNkhWe60LlcYKwdw"];
}

- (void)hysteriaPlayerAsyncSetUrlForItemAtIndex:(NSInteger)index preBuffer:(BOOL)preBuffer {

}

@end
