//
//  CategoriesCollectionViewCell.h
//  YummlyDemoApp
//
//  Created by Macbook on 11/16/17.
//  Copyright © 2017 VDPersonal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CategoriesCollectionViewCellObject.h"

@interface CategoriesCollectionViewCell : UICollectionViewCell

@property (nonatomic) id<CategoriesCollectionViewCellObjectProtocol> model;
@property (nonatomic) UILabel* titleLabel;
@property (nonatomic) int identifier;

@end
