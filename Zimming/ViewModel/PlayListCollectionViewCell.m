//
//  PlayListCollectionViewCell.m
//  Zimming
//
//  Created by Macbook on 11/20/17.
//  Copyright © 2017 VDPersonal. All rights reserved.
//

#import "PlayListCollectionViewCell.h"
#import "Constants.h"
#import "Masonry.h"

@interface PlayListCollectionViewCell ()

@property (nonatomic) UIImageView* headPhoneImageView;
@property (nonatomic) UIImageView* playImageView;
@property (nonatomic) UILabel* listenCount;
@property (nonatomic) UILabel* titleLabel;
@property (nonatomic) UIView* infoView;

@end

@implementation PlayListCollectionViewCell

#pragma mark - initWithFrame

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self layoutForCell];
    }
    
    return self;
}

#pragma mark - setModel

- (void)setModel:(id<PlayListCollectionViewCellObjectProtocol>)model {
    
    _model = model;
    
    [_titleLabel setText:model.title];
    if (_model.selected == YES) {
        
        [_titleLabel setTextColor:[UIColor blueColor]];
    } else {
        
        [_titleLabel setTextColor:[UIColor grayColor]];
    }
}

#pragma mark - layoutForCell

- (void)layoutForCell {
    
    CGFloat scale = FONTSIZE_SCALE;
    
    _imageView = [[UIImageView alloc] init];
    _imageView.image = [UIImage imageNamed:@"ic_test"];
    [self addSubview:_imageView];
    
    _titleLabel = [[UILabel alloc] init];
    [_titleLabel setTextColor:[UIColor blackColor]];
    [_titleLabel setNumberOfLines:3];
    [_titleLabel setTextAlignment:NSTextAlignmentCenter];
    [_titleLabel setFont:[UIFont boldSystemFontOfSize:11 * scale]];
    [self addSubview:_titleLabel];
    
    _playImageView = [[UIImageView alloc] init];
    _playImageView.image = [UIImage imageNamed:@"ic_play"];
    [self addSubview:_playImageView];
    
    _infoView = [[UIView alloc] init];
    [_infoView setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.5]];
    [self addSubview:_infoView];
    
    _headPhoneImageView = [[UIImageView alloc] init];
    _headPhoneImageView.image = [UIImage imageNamed:@"ic_headPhone"];
    [_infoView addSubview:_headPhoneImageView];
    
    _listenCount = [[UILabel alloc] init];
    [_listenCount setText:@"19.5k"];
    [_listenCount setTextColor:[UIColor whiteColor]];
    [_listenCount setTextAlignment:NSTextAlignmentCenter];
    [_listenCount setFont:[UIFont boldSystemFontOfSize:9 * scale]];
    [_infoView addSubview:_listenCount];
    
    [_imageView mas_makeConstraints:^(MASConstraintMaker* make) {
        
        make.top.equalTo(self).offset(0);
        make.left.equalTo(self).offset(5);
        make.right.equalTo(self).offset(-5);
        make.height.equalTo(_imageView.mas_width);
    }];
    
    [_infoView mas_makeConstraints:^(MASConstraintMaker* make) {
        
        make.left.equalTo(self).offset(7);
        make.bottom.equalTo(_imageView.mas_bottom).offset(0);
        make.height.equalTo(@17);
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker* make) {
        
        make.top.equalTo(_imageView.mas_bottom).offset(5);
        make.left.equalTo(self).offset(0);
        make.right.equalTo(self).offset(0);
    }];
    
    [_playImageView mas_makeConstraints:^(MASConstraintMaker* make) {
    
        make.right.equalTo(self).offset(-7);
        make.bottom.equalTo(_imageView.mas_bottom).offset(-4);
        make.width.and.height.equalTo(@20);
    }];
    
    [_headPhoneImageView mas_makeConstraints:^(MASConstraintMaker* make) {
        
        make.left.equalTo(_infoView).offset(2);
        make.centerY.equalTo(_infoView);
        make.width.and.height.equalTo(@11);
    }];
    
    [_listenCount mas_makeConstraints:^(MASConstraintMaker* make) {
        
        make.left.equalTo(_headPhoneImageView.mas_right).offset(2);
        make.centerY.equalTo(_infoView);
        make.right.equalTo(_infoView.mas_right).offset(0);
    }];
}

@end
