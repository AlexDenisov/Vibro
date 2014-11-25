//
//  AppDelegate.m
//  Sample
//
//  Created by AlexDenisov on 25/11/14.
//  Copyright (c) 2014 AlexDenisov. All rights reserved.
//

#import "AppDelegate.h"
#import "VBURLProtocol.h"

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [NSURLProtocol registerClass:[VBURLProtocol class]];
    return YES;
}

@end
