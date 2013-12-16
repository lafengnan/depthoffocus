//
//  DepthOfFocusAppDelegate.m
//  DepthOfFocus
//
//  Created by lafengnan on 12-8-20.
//  Copyright (c) 2012年 lafengnan. All rights reserved.
//

#import "DepthOfFocusAppDelegate.h"
#import "DepthOfFocusViewController.h"
#import "PhotoAdviceViewController.h"
#import "CameraMarketViewController.h"
#import "ForumListViewController.h"
#import "DetailsWebViewController.h"

@implementation DepthOfFocusAppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    
    UIViewController *vc1 = [[DepthOfFocusViewController alloc] init];
    UIViewController *vc2 = [[PhotoAdviceViewController alloc] init];
    UIViewController *vc3 = [[CameraMarketViewController alloc] init];
    ForumListViewController *vc4 = [[ForumListViewController alloc] initWithStyle:UITableViewStylePlain];
    [vc4 autorelease];
    
    UINavigationController *adviceNav = [[UINavigationController alloc] initWithRootViewController:vc2];
    [vc2 release];
    UINavigationController *forumNav = [[UINavigationController alloc] initWithRootViewController:vc4];
    //[vc4 release];
    DetailsWebViewController *dwvc = [[[DetailsWebViewController alloc] init] autorelease];
    [vc4 setDetailWebViewController:dwvc];
    NSArray *viewControllers = [NSArray arrayWithObjects:vc1, adviceNav, vc3, forumNav, nil];
    [vc1 release];
    //[vc2 release];
    [adviceNav release];
    [vc3 release];
    [forumNav release];
    [tabBarController setViewControllers:viewControllers];
    [[self window] setRootViewController:tabBarController];
    [tabBarController release];

    [[self window] makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

@end
