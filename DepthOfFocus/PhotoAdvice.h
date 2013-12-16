//
//  photoAdvice.h
//  DepthOfFocus
//
//  Created by lafengnan on 12-8-27.
//  Copyright (c) 2012年 lafengnan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PhotoAdvice : NSObject
{
    NSArray *advicesTable;
    NSArray *adviceDetailsTable;
    BOOL flags[8]; // used for remember which advice is selected
}
+ (PhotoAdvice *)adviceStore;
- (NSArray *)allAdvices;
- (NSArray *)allAdviceDetails;
- (void)setAdviceFlag:(BOOL)selceted AtIndex:(NSInteger)index;
- (void)resetAdviceFlags;
- (BOOL *)allFlags;


@end
