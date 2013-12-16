//
//  CameraMarketViewController.m
//  DepthOfFocus
//
//  Created by lafengnan on 12-8-20.
//  Copyright (c) 2012年 lafengnan. All rights reserved.
//

#import "CameraMarketViewController.h"

@implementation CameraMarketViewController

- (id)init
{
    self = [super initWithNibName:nil bundle:nil];
    
    if (self) {
        // Get tabBar item
        UITabBarItem *tbi = [self tabBarItem];
        UIOffset offset;
        offset.horizontal = 0;
        offset.vertical = -15.0;
        
        // set title
        //[tbi setTitlePositionAdjustment:offset];
        [tbi setTitle:@"MarketInfo"];
        UIImage *tabIcon = [UIImage imageNamed:@"Market.png"];
        [tbi setImage:tabIcon];
        
    }
    
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    return [self init];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"Loaded the view for CameraMarketViewController");
     UIColor *backGroundColor = [[UIColor alloc]initWithRed:0.58 green:0.87 blue:1.0 alpha:1.0];
    
    [[self view] setBackgroundColor:backGroundColor];
    [backGroundColor release];
}

@end
