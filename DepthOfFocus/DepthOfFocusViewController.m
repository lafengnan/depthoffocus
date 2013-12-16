//
//  DepthOfFocusViewController.m
//  DepthOfFocus
//
//  Created by lafengnan on 12-8-20.
//  Copyright (c) 2012年 lafengnan. All rights reserved.
//

#import "DepthOfFocusViewController.h"
#import "DepthOfFocus.h"
#import "Camera.h"

@implementation DepthOfFocusViewController
@synthesize focalValue;
@synthesize apertureValue;
@synthesize distanceValue;
@synthesize cameraBand;
@synthesize dofValue;
@synthesize preDofValue;
@synthesize tailDofValue;
@synthesize cameraView;

- (id)init
{
    self = [super initWithNibName:nil bundle:nil];
    
    if (self) {
        // Get tabBar item
        UITabBarItem *tbi = [self tabBarItem];
        [tbi setTitle:@"Depth"];
        UIImage *tabIcon = [UIImage imageNamed:@"Depth.png"];
        [tbi setImage:tabIcon];
       
    }
    
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    return [self init];
}

- (IBAction)dofCalculate:(id)sender
{
    depthOfFocus = [[DepthOfFocus alloc] init];
    float focal = [[focalValue text] floatValue];
    float aperture = [[apertureValue text] floatValue];
    float distance = [[distanceValue text] floatValue];
    NSString *camera = [cameraBand text];
    NSLog(@" f = %f, a = %f, distance = %f", focal, aperture, distance);
   
    float preDof = [depthOfFocus preDepthOfFocusWithFocal:focal andAperture:aperture ofCamera:camera atDistance:distance];
    float tailDof = [depthOfFocus tailDepthOfFocusWithFocal:focal andAperture:aperture ofCamera:camera atDistance:distance];
    float dof = preDof + tailDof;
    NSLog(@"preDof = %f", preDof);
    NSLog(@"tailDof = %f", tailDof);
    NSLog(@"dof = %f", dof);
    
    [dofValue setText:[NSString stringWithFormat:@"%f", dof]];
    [preDofValue setText:[NSString stringWithFormat:@"%f", preDof]];
    [tailDofValue setText:[NSString stringWithFormat:@"%f", tailDof]];
 
    [focalValue resignFirstResponder];
    [apertureValue resignFirstResponder];
    [distanceValue resignFirstResponder];
    
}

- (IBAction)resetValues:(id)sender
{
    [dofValue setText:[NSString stringWithFormat:@"∞"]];
    [preDofValue setText:[NSString stringWithFormat:@"∞"]];
    [tailDofValue setText:[NSString stringWithFormat:@"∞"]];
    [focalValue setText:[NSString stringWithFormat:@"0"]];
    [apertureValue setText:[NSString stringWithFormat:@"0"]];
    [distanceValue setText:[NSString stringWithFormat:@"0"]];
    [cameraBand setText:[NSString stringWithFormat:@"D90"]];
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    apertureValue.delegate = self;
    focalValue.delegate = self;
    distanceValue.delegate = self;
    cameraBand.delegate = self;
    
    UIColor *backGroundColor = [[UIColor alloc]initWithRed:0.58 green:0.87 blue:1.0 alpha:1.0];
    NSLog(@"Loaded the view for DepthOfFocusViewController");
    [[self view] setBackgroundColor:backGroundColor];
    [backGroundColor release];
}

// Keyboard hidden if "Return" is tapped
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
// Keyboard hidden if "Cancel" is tapped
- (BOOL)textFieldShouldClear:(UITextField *)textField
{
    [textField resignFirstResponder];
    textField.text = @"";
    return NO;
}
// Keyboard hidden if other place is tapped
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [apertureValue resignFirstResponder];
    [focalValue resignFirstResponder];
    [distanceValue resignFirstResponder];
    [cameraBand resignFirstResponder];
}


- (void)dealloc {
    [focalValue release];
    [apertureValue release];
    [distanceValue release];
    [focalValue release];
    [apertureValue release];
    [dofValue release];
    [dofValue release];
    [preDofValue release];
    [tailDofValue release];
    [cameraView release];
    [cameraBand release];
    [super dealloc];
}
- (void)viewDidUnload {
    [focalValue release];
    focalValue = nil;
    [apertureValue release];
    apertureValue = nil;
    [self setDistanceValue:nil];
    [self setFocalValue:nil];
    [self setApertureValue:nil];
    [self setDofValue:nil];
    [self setDofValue:nil];
    [self setPreDofValue:nil];
    [self setTailDofValue:nil];
    [self setCameraView:nil];
    [self setCameraBand:nil];
    [super viewDidUnload];
}

@end
