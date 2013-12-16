//
//  ForumListViewController.h
//  DepthOfFocus
//
//  Created by lafengnan on 12-8-30.
//  Copyright (c) 2012年 lafengnan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RSSChannel.h"
@class DetailsWebViewController;

@interface ForumListViewController : UITableViewController <NSXMLParserDelegate>
{
    NSURLConnection *connection;
    NSMutableData *xmlData;
    
    RSSChannel *channel;
    
    DetailsWebViewController *detailWebViewController;
}

@property (nonatomic, retain) DetailsWebViewController *detailWebViewController;

- (void)fetchEntries;

@end
