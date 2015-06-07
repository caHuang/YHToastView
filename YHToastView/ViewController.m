//
//  ViewController.m
//  YHToastView
//
//  Created by Andy Huang on 6/6/15.
//  Copyright (c) 2015 lab. All rights reserved.
//

#import "ViewController.h"
#import "YHToastView.h"

@interface ViewController ()

- (void)showToast;

@end

@implementation ViewController

#pragma mark - Lifecycle

- (void)viewDidLoad {
  [super viewDidLoad];
  
  UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
  [button setTitle:@"Show Toast" forState:UIControlStateNormal];
  [button sizeToFit];
  button.center = self.view.center;
  [button addTarget:self action:@selector(showToast) forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:button];
}

#pragma mark - Private

- (void)showToast {
  [YHToastView showWithMessage:@"I'm toast" animated:YES];
}

@end
