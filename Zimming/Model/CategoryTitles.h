//
//  CategoryTitles.h
//  YummlyDemoApp
//
//  Created by Macbook on 11/16/17.
//  Copyright © 2017 VDPersonal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CategoryTitles : NSObject

@property (nonatomic) int identifier;
@property (nonatomic) NSString* name;

- (instancetype)initWithName:(NSString *)name identifier:(int)identifier;

@end
