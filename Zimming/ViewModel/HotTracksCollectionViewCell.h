//
//  HotTracksCollectionViewCell.h
//  Zimming
//
//  Created by Macbook on 11/21/17.
//  Copyright © 2017 VDPersonal. All rights reserved.
//

#import "HotTracksCollectionViewCellObject.h"
#import <UIKit/UIKit.h>

@interface HotTracksCollectionViewCell : UICollectionViewCell

@property (nonatomic) id <HotTracksCollectionViewCellObjectProtocol> model;
@property (nonatomic) UIImageView* imageView;
@property (nonatomic) NSString* identifier;

@end
