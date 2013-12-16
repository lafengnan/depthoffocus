//
//  DepthOfFocus.m
//  DepthOfFocus
//
//  Created by lafengnan on 12-8-20.
//  Copyright (c) 2012年 lafengnan. All rights reserved.
//

#import "DepthOfFocus.h"
#import "Camera.h"

@implementation DepthOfFocus

- (id)init
{
    self = [super init];
    if (self) {
       // focal = 50;
        //aperture = 2.8;
        distance = 1.0;
        depthOfFocus = 0.0;
        cameraInstance = [[Camera alloc]init];
    }
    return self;
}

- (float)preDepthOfFocusWithFocal:(float)focal andAperture:(float)aperture ofCamera:(NSString *)camera atDistance:(float)distance
{
    cameraInstance = [[Camera alloc]initWithFocal:focal andAperature:aperture andSerialNumber:camera];
    float preDOF = aperture*distance*distance*1000000*[cameraInstance circleOfConfusion]/(focal*focal + aperture*distance*1000*[cameraInstance circleOfConfusion]);
    [cameraInstance release];
    
    return preDOF;

}

- (float)tailDepthOfFocusWithFocal:(float)focal andAperture:(float)aperture ofCamera:(NSString *)camera atDistance:(float)distance
{
    cameraInstance = [[Camera alloc]initWithFocal:focal andAperature:aperture andSerialNumber:camera];
    float tailDOF = aperture*distance*distance*1000000*[cameraInstance circleOfConfusion]/(focal*focal - aperture*distance*1000*[cameraInstance circleOfConfusion]);
    [cameraInstance release];
    return tailDOF;
}

- (float)depthOfFocusWithFocal:(float)focal andAperture:(float)aperture ofCamera:(NSString *)camera atDistance:(float)distance
{
    return 0.0;
}

@end
