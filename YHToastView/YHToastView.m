//
//  YHToastView.m
//  YHToastView
//
//  Created by Andy Huang on 6/6/15.
//  Copyright (c) 2015 lab. All rights reserved.
//

#import "YHToastView.h"

@interface YHToastView ()

+ (CGRect)screenFrame;
+ (UIView *)toastViewWithMessage:(NSString *)message;

+ (void)hideToastView:(UIView *)toastView animated:(BOOL)animated;

@end

@implementation YHToastView

#pragma mark - Public

+ (void)showWithMessage:(NSString *)message {
  [self showWithMessage:message animated:YES];
}

+ (void)showWithMessage:(NSString *)message animated:(BOOL)animated {
  UIView *toastView = [self toastViewWithMessage:message];
  if (animated) {
    toastView.alpha = 0.0f;
    [UIView animateWithDuration:0.35f animations:^{
      toastView.alpha = 1.0f;
    } completion:nil];
  }
  
  UIWindow *window = [UIApplication sharedApplication].keyWindow;
  CGPoint point = window.center;
  CGFloat offsetY = CGRectGetMaxY(window.bounds) - CGRectGetHeight(toastView.frame) / 2.0f;
  point.y = offsetY - 64.0f;
  toastView.center = point;
  [window addSubview:toastView];
  
  __weak typeof(self) weakSelf = self;
  dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    [weakSelf hideToastView:toastView animated:animated];
  });
}

#pragma mark - Private

+ (CGRect)screenFrame {
  UIScreen *mainScreen = [UIScreen mainScreen];
  return mainScreen.bounds;
}

+ (UIView *)toastViewWithMessage:(NSString *)message {
  CGRect toastFrame = CGRectZero;

  UIView *toastView = [[UIView alloc] init];
  toastView.layer.cornerRadius = 10.0f;
  toastView.layer.shadowColor = [[UIColor blackColor] CGColor];
  toastView.layer.shadowOpacity = 0.5f;
  toastView.layer.shadowOffset = CGSizeMake(3, 3);
  toastView.backgroundColor = [UIColor blackColor];

  UILabel *messageLabel = nil;
  
  if (message) {
    UIFont *font = [UIFont systemFontOfSize:14.0f];
    
    messageLabel = [[UILabel alloc] init];
    messageLabel.backgroundColor = [UIColor clearColor];
    messageLabel.text = message;
    messageLabel.font = font;
    messageLabel.textColor = [UIColor whiteColor];
    messageLabel.numberOfLines = 0;
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineBreakMode = NSLineBreakByCharWrapping;
    NSDictionary *attributes = @{
                                 NSFontAttributeName: font,
                                 NSParagraphStyleAttributeName: paragraphStyle.copy
                                 };
    
    CGSize labelSize = [message boundingRectWithSize:CGSizeMake(280.0f, CGFLOAT_MAX)
                                             options:NSStringDrawingUsesLineFragmentOrigin
                                          attributes:attributes
                                             context:nil].size;
    labelSize.width = ceil(labelSize.width);
    labelSize.height = ceilf(labelSize.height);
    
    CGPoint labelPoint = CGPointMake(10.0f, 10.0f);
    
    CGRect labelFrame = CGRectZero;
    labelFrame.origin = labelPoint;
    labelFrame.size = labelSize;
    messageLabel.frame = labelFrame;
    
    [toastView addSubview:messageLabel];
  }
  
  toastFrame.size.width = messageLabel.frame.size.width + 20.0f;
  toastFrame.size.height = messageLabel.frame.size.height + 20.0f;
  toastView.frame = toastFrame;
  
  return toastView;
}

+ (void)hideToastView:(UIView *)toastView animated:(BOOL)animated {
  if (animated) {
    [UIView animateWithDuration:0.35f animations:^{
      toastView.alpha = 0.0f;
    } completion:^(BOOL finished) {
      [toastView removeFromSuperview];
    }];
  } else {
    [toastView removeFromSuperview];
  }
}

@end
