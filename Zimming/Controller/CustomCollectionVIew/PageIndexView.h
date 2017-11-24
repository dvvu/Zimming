//
//  PageIndexView.h
//  Zimming
//
//  Created by Macbook on 11/23/17.
//  Copyright © 2017 VDPersonal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageIndexView : UIView

- (instancetype)initWithPages:(int)pages;
- (void)selectObjectAtindex:(int)index;

@end
