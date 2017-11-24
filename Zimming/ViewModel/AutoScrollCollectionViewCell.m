//
//  AutoScrollCollectionViewCell.m
//  Zimming
//
//  Created by Macbook on 11/23/17.
//  Copyright © 2017 VDPersonal. All rights reserved.
//

#import "AutoScrollCollectionViewCell.h"
#import "Constants.h"
#import "Masonry.h"

@implementation AutoScrollCollectionViewCell

#pragma mark - initWithFrame

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self layoutForCell];
    }
    
    return self;
}

#pragma mark - setModel

- (void)setModel:(id<AutoScrollCollectionViewCellObjectProtocol>)model {
    
    _model = model;
    
    [_titleLabel setText:model.title];
    if (_model.selected == YES) {
        
    } else {
        
    }
}

#pragma mark - layoutForCell

- (void)layoutForCell {
    
    CGFloat scale = FONTSIZE_SCALE;
    
    _imageView = [[UIImageView alloc] init];
    _imageView.image = [UIImage imageNamed:@"ic_test"];
    [self addSubview:_imageView];
    
    _titleLabel = [[UILabel alloc] init];
    [_titleLabel setTextColor:[UIColor whiteColor]];
    [_titleLabel setNumberOfLines:3];
    [_titleLabel setTextAlignment:NSTextAlignmentCenter];
    [_titleLabel setFont:[UIFont boldSystemFontOfSize:20 * scale]];
    [self addSubview:_titleLabel];
    
    [_imageView mas_makeConstraints:^(MASConstraintMaker* make) {
        
        make.edges.equalTo(self).offset(0);
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker* make) {
        
        make.center.equalTo(_imageView).offset(5);
    }];
}

@end
