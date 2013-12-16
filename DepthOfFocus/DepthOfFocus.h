//
//  DepthOfFocus.h
//  DepthOfFocus
//
//  Created by lafengnan on 12-8-20.
//  Copyright (c) 2012年 lafengnan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Camera.h"

@interface DepthOfFocus : NSObject
{
    //float focal;
    //float aperture;
    float distance;
    float depthOfFocus;
    Camera *cameraInstance;
}
- (float)preDepthOfFocusWithFocal:(float)focal andAperture:(float)aperture ofCamera:(NSString *)camera atDistance:(float)distance;
- (float)tailDepthOfFocusWithFocal:(float)focal  andAperture:(float)aperture ofCamera:(NSString *)camera atDistance:(float)distance;

- (float)depthOfFocusWithFocal:(float)focal andAperture:(float)aperture ofCamera:(NSString *)camera atDistance:(float)distance;
@end
