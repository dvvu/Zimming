//
//  PlayListCollectionViewCell.h
//  Zimming
//
//  Created by Macbook on 11/20/17.
//  Copyright © 2017 VDPersonal. All rights reserved.
//

#import "PlayListCollectionViewCellObject.h"
#import <UIKit/UIKit.h>

@interface PlayListCollectionViewCell : UICollectionViewCell

@property (nonatomic) id<PlayListCollectionViewCellObjectProtocol> model;
@property (nonatomic) UIImageView* imageView;
@property (nonatomic) NSString* identifier;

@end
