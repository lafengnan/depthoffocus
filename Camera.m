//
//  Camera.m
//  DepthOfFocus
//
//  Created by lafengnan on 12-8-22.
//  Copyright (c) 2012年 lafengnan. All rights reserved.
//

#import "Camera.h"

@implementation Camera
@synthesize focal, aperture, circleOfConfusion, serialNumber;

- (id)init
{
    self = [super init];
    if (self) {
        focal = 50; // 50mm as standard focal
        aperture = 5.6; // 5.6 as common aperture
        circleOfConfusion = 0.017; // D90 circle of confusion
        serialNumber = @"D90"; // D90 as standard camera
    }
    
    return self;
}

- (id)initWithFocal:(float)focalValue andAperature:(float)apertureValue andSerialNumber:(NSString *)serialNumberValue
{
    self = [super init];
    if (self) {
        [self setFocal:focalValue];
        [self setAperture:apertureValue];
        [self setSerialNumber:serialNumberValue];
        
        if ([serialNumberValue isEqualToString:@"D90"] || [serialNumberValue isEqualToString:@"d90"]) {
            [self setCircleOfConfusion:0.019];
        } else if ([serialNumberValue isEqualToString:@"550D"] || [serialNumberValue isEqualToString:@"550d"]) {
            [self setCircleOfConfusion:0.018];
        } else if ([serialNumberValue isEqualToString:@"k5"] || [serialNumberValue isEqualToString:@"K5"]) {
            [self setCircleOfConfusion:0.019];
        } else if ([serialNumberValue rangeOfString:@"5D"].length!= 0) {
            [self setCircleOfConfusion:0.025];
        }
    }
   
    return self;
}

@end
