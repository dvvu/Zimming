//
//  CategoriesCollectionViewCellObject.m
//  YummlyDemoApp
//
//  Created by Macbook on 11/16/17.
//  Copyright © 2017 VDPersonal. All rights reserved.
//

#import "CategoriesCollectionViewCellObject.h"

@implementation CategoriesCollectionViewCellObject

#pragma mark - getImageCacheForCell

- (void)getImageCacheForCell:(UICollectionViewCell *)cell {
    
//    __weak GalleryCollectionViewCell* galleryCollectionViewCell = (GalleryCollectionViewCell *)cell;
//    UIImage* image = [[VDImageCache sharedInstance] imageFromKey:_identifier withSize:CGSizeMake(300, 300)];
//    
//    if (image) {
//        
//        if (image) {
//            
//            UIGraphicsBeginImageContextWithOptions(image.size, NO, image.scale);
//            [image drawAtPoint:CGPointZero];
//            image = UIGraphicsGetImageFromCurrentImageContext();
//            UIGraphicsEndImageContext();
//        }
//        
//        if ([_identifier isEqualToString:galleryCollectionViewCell.identifier]) {
//            
//            dispatch_async(dispatch_get_main_queue(), ^ {
//                
//                galleryCollectionViewCell.galaryImageView.image = image;
//            });
//        }
//    } else {
//        
//        NSLog(@"----- no image");
//    }
}

@end
