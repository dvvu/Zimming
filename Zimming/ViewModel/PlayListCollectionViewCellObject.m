//
//  PlayListCollectionViewCellObject.m
//  Zimming
//
//  Created by Macbook on 11/20/17.
//  Copyright © 2017 VDPersonal. All rights reserved.
//

#import "PlayListCollectionViewCellObject.h"
#import "PlayListCollectionViewCell.h"
#import "NetworkingClient.h"
#import "VDImageCache.h"
#import "Constants.h"

@implementation PlayListCollectionViewCellObject

#pragma mark - getImageCacheForCell

- (void)getImageCacheForCell:(UICollectionViewCell *)cell {

    __weak PlayListCollectionViewCell* playListCollectionViewCell = (PlayListCollectionViewCell *)cell;
    
    if ([_identifier length] > 0) {
        
        [[VDImageCache sharedInstance] imageFromKey:_identifier withSize:CGSizeMake(DEVICE_WIDTH/2, DEVICE_WIDTH/2) completion:^(UIImage* image) {
            
            if (image) {
                
                UIGraphicsBeginImageContextWithOptions(image.size, NO, image.scale);
                [image drawAtPoint:CGPointZero];
                image = UIGraphicsGetImageFromCurrentImageContext();
                UIGraphicsEndImageContext();
                
                if ([_identifier isEqualToString:playListCollectionViewCell.identifier]) {
                    
                    dispatch_async(dispatch_get_main_queue(), ^ {
                        
                        playListCollectionViewCell.imageView.image = image;
                    });
                }
            } else {
                
                if (![_artworkURL isKindOfClass:[NSNull class]]) {
                    
                    [NetworkingClient sharedClient].requestSerializer = [AFHTTPRequestSerializer serializer];
                    [NetworkingClient sharedClient].responseSerializer = [AFHTTPResponseSerializer serializer];
                    [[NetworkingClient sharedClient] requestAPIURL:_artworkURL withParams:nil headers:nil methodType:METHOD_GET successHandler:^(id responseDict) {
                        
                        UIImage* image = [UIImage imageWithData:responseDict];
                        
                        if (image) {
                            
                            [[VDImageCache sharedInstance] storeImage:image withKey:_identifier];
                            UIGraphicsBeginImageContextWithOptions(image.size, NO, image.scale);
                            [image drawAtPoint:CGPointZero];
                            image = UIGraphicsGetImageFromCurrentImageContext();
                            UIGraphicsEndImageContext();
                            
                            if ([_identifier isEqualToString:playListCollectionViewCell.identifier]) {
                                
                                dispatch_async(dispatch_get_main_queue(), ^ {
                                    
                                    playListCollectionViewCell.imageView.image = image;
                                });
                            }
                        } else {
                            
                            NSLog(@"Error NOT IMAGE URL: %@", _artworkURL);
                        }
                    } errorHandler:^(NSError* error) {
                        
                        NSLog(@"Error URL: %@", _artworkURL);
                    }];
                }
            }
        }];
    }
}

@end
