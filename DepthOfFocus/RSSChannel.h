//
//  RSSChannel.h
//  DepthOfFocus
//
//  Created by lafengnan on 12-9-3.
//  Copyright (c) 2012年 lafengnan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RSSChannel : NSObject <NSXMLParserDelegate>
{
    NSString *title;
    NSString *shortDescription;
    NSMutableArray *items;
    
    id parentParserDelegate;
    
    NSMutableString *currentString;
}

@property (nonatomic, assign) id parentParserDelegate;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *shortDescription;
@property (nonatomic, readonly) NSMutableArray *items;

@end
