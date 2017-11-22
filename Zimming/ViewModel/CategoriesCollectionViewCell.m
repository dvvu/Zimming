//
//  CategoriesCollectionViewCell.m
//  YummlyDemoApp
//
//  Created by Macbook on 11/16/17.
//  Copyright © 2017 VDPersonal. All rights reserved.
//

#import "CategoriesCollectionViewCell.h"
#import "Constants.h"
#import "Masonry.h"

@interface CategoriesCollectionViewCell ()

@property (nonatomic) UIView* sellectedView;

@end

@implementation CategoriesCollectionViewCell

#pragma mark - initWithFrame

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self layoutForCell];
    }
    
    return self;
}

#pragma mark - setModel

- (void)setModel:(id<CategoriesCollectionViewCellObjectProtocol>)model {
    
    _model = model;
    
    [_titleLabel setText:model.title];
    if (_model.selected == YES) {
        
        [_titleLabel setTextColor:[UIColor blueColor]];
        [_sellectedView setHidden:NO];
    } else {
        
        [_titleLabel setTextColor:[UIColor grayColor]];
        [_sellectedView setHidden:YES];
    }
}

#pragma mark - layoutForCell

- (void)layoutForCell {
    
    CGFloat scale = FONTSIZE_SCALE;
    
    _sellectedView = [[UIView alloc] init];
    [_sellectedView setBackgroundColor:[UIColor blueColor]];
    [self addSubview:_sellectedView];
    
    _titleLabel = [[UILabel alloc] init];
    [_titleLabel setTextColor:[UIColor grayColor]];
    [_titleLabel setTextAlignment:NSTextAlignmentCenter];
    [_titleLabel setFont:[UIFont boldSystemFontOfSize:12 * scale]];
    [self addSubview:_titleLabel];
    
    [_sellectedView mas_makeConstraints:^(MASConstraintMaker* make) {
        
        make.left.equalTo(self).offset(0);
        make.right.equalTo(self).offset(0);
        make.bottom.equalTo(self).offset(0);
        make.height.equalTo(@5);
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker* make) {
        
        make.left.equalTo(self).offset(0);
        make.right.equalTo(self).offset(0);
        make.center.equalTo(self);
    }];
}

@end
