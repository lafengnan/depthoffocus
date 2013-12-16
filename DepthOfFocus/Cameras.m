//
//  CameraBandNikkon.m
//  DepthOfFocus
//
//  Created by lafengnan on 12-8-20.
//  Copyright (c) 2012年 lafengnan. All rights reserved.
//

#import "Cameras.h"

@implementation Cameras
@synthesize 


- (id)init
{
    if (self = [super init]) {
        focal = 50;
        aperture = 5.6;
        circleOfConfusion = 0.025;
        serialNumber = @"D90";
    }
    return  self;
}

@end
