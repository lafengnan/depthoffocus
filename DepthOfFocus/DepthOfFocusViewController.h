//
//  DepthOfFocusViewController.h
//  DepthOfFocus
//
//  Created by lafengnan on 12-8-20.
//  Copyright (c) 2012年 lafengnan. All rights reserved.
//

#import <Foundation/Foundation.h>
@class DepthOfFocus;

@interface DepthOfFocusViewController : UIViewController <UITextFieldDelegate>
{
    DepthOfFocus *depthOfFocus;
}

@property (retain, nonatomic) IBOutlet UITextField *focalValue;
@property (retain, nonatomic) IBOutlet UITextField *apertureValue;

@property (retain, nonatomic) IBOutlet UITextField *distanceValue;
@property (retain, nonatomic) IBOutlet UITextField *cameraBand;
@property (retain, nonatomic) IBOutlet UILabel *dofValue;
@property (retain, nonatomic) IBOutlet UILabel *preDofValue;

@property (retain, nonatomic) IBOutlet UILabel *tailDofValue;
@property (retain, nonatomic) IBOutlet UIImageView *cameraView;

- (IBAction)dofCalculate:(id)sender;
- (IBAction)resetValues:(id)sender;

@end
