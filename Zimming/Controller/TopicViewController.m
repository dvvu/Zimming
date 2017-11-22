//
//  TopicViewController.m
//  Zimming
//
//  Created by Macbook on 11/20/17.
//  Copyright © 2017 VDPersonal. All rights reserved.
//

#import "TopicViewController.h"
#import "LMMediaPlayerView.h"
#import "LMMediaItem.h"


@interface TopicViewController ()

@property (nonatomic) UIView* mediaView;
@end

@implementation TopicViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view setBackgroundColor:[UIColor yellowColor]];
    //Get shared player
    LMMediaPlayerView* player = [LMMediaPlayerView sharedPlayerView];

    _mediaView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 400)];
    player.frame = _mediaView.frame;
    [self.view addSubview:_mediaView];
    [_mediaView addSubview:player];
    LMMediaItem* item1 = [[LMMediaItem alloc] initWithInfo:@{
                                                             LMMediaItemInfoURLKey:[NSURL URLWithString:@"https://api.soundcloud.com/tracks/358364042/stream?client_id=XSGYiNkhWe60LlcYKwdw"],
                                                             LMMediaItemInfoContentTypeKey:@(LMMediaItemContentTypeAudio)
                                                             }];

    //Add queue.
    [player.mediaPlayer addMedia:item1];

    //Play it!
    [player.mediaPlayer play];
}

@end
