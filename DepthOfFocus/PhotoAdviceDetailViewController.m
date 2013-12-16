//
//  PhotoAdviceDetailViewController.m
//  DepthOfFocus
//
//  Created by lafengnan on 12-8-27.
//  Copyright (c) 2012年 lafengnan. All rights reserved.
//

#import "PhotoAdviceDetailViewController.h"
#import "PhotoAdvice.h"


@interface PhotoAdviceDetailViewController ()

@end

@implementation PhotoAdviceDetailViewController
@synthesize advicePoem, adviceDetails;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
       
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[self view] setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    // Do any additional setup after loading the view from its nib.

    PhotoAdvice *advice = [PhotoAdvice adviceStore];
    NSInteger index = 0;
    for (int i = 0; i < 8; i++) {
        if ([advice allFlags][i] == true) {
            index = i;
            break;
        }
    }
    NSString *adviceContent = [[advice allAdviceDetails] objectAtIndex:index];
     
    //CGFloat poemWidth = 100;
    CGFloat adviceWidth = 320;
    //CGRect poemFrame = CGRectMake(0, 0, poemWidth, 22);
    CGRect adviceFrame = CGRectMake(0, 0, adviceWidth, 22);
    //[advicePoem setFrame:poemFrame];
    [adviceDetails setFrame:adviceFrame];
    [adviceDetails setNumberOfLines:0];
   //[advicePoem setText:advicePoemContent];

    [adviceDetails setText:adviceContent];
    //[advicePoem sizeToFit];
    [adviceDetails sizeToFit];
    UIColor *backGroundColor = [[UIColor alloc]initWithRed:0.58 green:0.87 blue:1.0 alpha:1.0];
    [[self view] setBackgroundColor:backGroundColor];
    [backGroundColor release];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    [self setAdviceDetails:nil];
    [adviceDetails release];
    adviceDetails = nil;
    [advicePoem release];
    advicePoem = nil;
    
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [adviceDetails release];
    [advicePoem release];
    [super dealloc];
}

@end
