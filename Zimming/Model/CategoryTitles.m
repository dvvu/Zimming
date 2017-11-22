//
//  CategoryTitles.m
//  YummlyDemoApp
//
//  Created by Macbook on 11/16/17.
//  Copyright © 2017 VDPersonal. All rights reserved.
//

#import "CategoryTitles.h"

@implementation CategoryTitles

- (instancetype)initWithName:(NSString *)name identifier:(int)identifier {

    self = [super init];
    
    if (self) {
        
        _name = name;
        _identifier = identifier;
    }
    
    return self;
}

@end
