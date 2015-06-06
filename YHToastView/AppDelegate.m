//
//  AppDelegate.m
//  YHToastView
//
//  Created by Andy Huang on 6/6/15.
//  Copyright (c) 2015 lab. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

- (void)setupRootViewController;

@end

@implementation AppDelegate

#pragma mark - Private

- (void)setupRootViewController {
  ViewController *viewController = [[ViewController alloc] init];
  viewController.view.backgroundColor = [UIColor whiteColor];
  self.window.rootViewController = viewController;
}

#pragma mark -  UIApplicationDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
  [self setupRootViewController];
  [self.window makeKeyAndVisible];
  return YES;
}

@end
