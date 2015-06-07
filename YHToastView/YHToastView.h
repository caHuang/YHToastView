//
//  YHToastView.h
//  YHToastView
//
//  Created by Andy Huang on 6/6/15.
//  Copyright (c) 2015 lab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YHToastView : UIView

+ (void)showWithMessage:(NSString *)message;
+ (void)showWithMessage:(NSString *)message animated:(BOOL)animated;

@end
