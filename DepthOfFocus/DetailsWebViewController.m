//
//  DetailsWebViewController.m
//  DepthOfFocus
//
//  Created by lafengnan on 12-9-3.
//  Copyright (c) 2012年 lafengnan. All rights reserved.
//

#import "DetailsWebViewController.h"

@implementation DetailsWebViewController

- (void)loadView
{
    CGRect screenFrame = [[UIScreen mainScreen] applicationFrame];
    UIWebView *wv = [[UIWebView alloc] initWithFrame:screenFrame];
    
    [wv setScalesPageToFit:YES];
    [self setView:wv];
    [wv release];
}

- (UIWebView *)detailWebView
{
    return (UIWebView *)[self view];
}

@end
