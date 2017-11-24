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
@property (nonatomic) UIBackgroundTaskIdentifier backgroundUpdateTask;

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
                                                             LMMediaItemInfoURLKey:[NSURL URLWithString:@"https://r6---sn-i3belnez.googlevideo.com/videoplayback?ipbits=0&pl=21&ip=144.217.245.247&sparams=dur,ei,expire,id,initcwndbps,ip,ipbits,ipbypass,itag,lmt,mime,mip,mm,mn,ms,mv,pl,ratebypass,requiressl,source&id=o-ACzgjaY_HPfn2fewnD3pAP8APC4ZbJdAaXQvpb3PsiGe&source=youtube&dur=48.251&itag=22&requiressl=yes&mime=video%2Fmp4&ei=CJcWWsLkOIXP8wTf6pSAAg&signature=445ED1A79E1410BFD51FE64402648C3DD37A7D5F.402E1777201737B8FF333C2C81075BA5B1CA36E0&expire=1511451497&key=cms1&ratebypass=yes&lmt=1471034784637148&title=%C4%90%C3%A2y+l%C3%A0+Ti%E1%BA%BFng+n%C3%B3i+Vi%E1%BB%87t+Nam+!%20-%20HD%20720p%20-%20[downyoutubemp4.net]&mip=113.161.55.215&rm=sn-8pxuuxa-nboer7d,sn-a5mky7d&fexp=23702512&req_id=2ce041e8e2a5a3ee&redirect_counter=2&cms_redirect=yes&ipbypass=yes&mm=29&mn=sn-i3belnez&ms=rdu&mt=1511429805&mv=m"],
                                                             LMMediaItemInfoContentTypeKey:@(LMMediaItemContentTypeVideo)
                                                             }];

    //Add queue.
    [player.mediaPlayer addMedia:item1];

    //Play it!
    [player.mediaPlayer play];
    
    [self beginBackgroundUpdateTask];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 4 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        
        [player.mediaPlayer play];
    });
}

- (void)beginBackgroundUpdateTask {
    
    _backgroundUpdateTask = [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:^{
        
        [self endBackgroundUpdateTask];
    }];
}

- (void)endBackgroundUpdateTask {
    
    [[UIApplication sharedApplication] endBackgroundTask: _backgroundUpdateTask];
    _backgroundUpdateTask = UIBackgroundTaskInvalid;
}

@end
