//
//  Camera.h
//  DepthOfFocus
//
//  Created by lafengnan on 12-8-22.
//  Copyright (c) 2012年 lafengnan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Camera : NSObject

@property (nonatomic, readonly) NSArray *camerasFromPlist;

@property float focal;
@property float aperture;
@property float circleOfConfusion;
@property (nonatomic, retain)NSString *serialNumber;

- (id)initWithFocal:(float)focalValue andAperature:(float)apertureValue andSerialNumber:(NSString *)serialNumberValue;

@end
