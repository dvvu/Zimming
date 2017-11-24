//
//  AutoScrollCollectionViewCell.h
//  Zimming
//
//  Created by Macbook on 11/23/17.
//  Copyright © 2017 VDPersonal. All rights reserved.
//

#import "AutoScrollCollectionViewCellObject.h"
#import <UIKit/UIKit.h>

@interface AutoScrollCollectionViewCell : UICollectionViewCell

@property (nonatomic) id <AutoScrollCollectionViewCellObjectProtocol> model;
@property (nonatomic) UIImageView* imageView;
@property (nonatomic) NSString* identifier;
@property (nonatomic) UILabel* titleLabel;

@end
