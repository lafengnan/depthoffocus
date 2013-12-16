//
//  ForumListViewController.m
//  DepthOfFocus
//
//  Created by lafengnan on 12-8-30.
//  Copyright (c) 2012年 lafengnan. All rights reserved.
//

#import "ForumListViewController.h"
#import "RSSItem.h"
#import "DetailsWebViewController.h"

@implementation ForumListViewController
@synthesize detailWebViewController;
- (id)init
{
    
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self) {
        // Get tabBar item
        UITabBarItem *tbi = [self tabBarItem];
        [tbi setTitle:@"Forum"];
        UIImage *tabIcon = [UIImage imageNamed:@"Depth.png"];
        [tbi setImage:tabIcon];
        
        //UINavigationBar setting
        [[self navigationItem] setTitle:@"跳蚤市场"];
        [self fetchEntries];
    }
    
    return self;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    return [self init];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    UIColor *backGroundColor = [[UIColor alloc]initWithRed:0.58 green:0.87 blue:1.0 alpha:1.0];
    NSLog(@"Loaded the view for ForumListViewController");
    
    [[self view] setBackgroundColor:backGroundColor];
    [backGroundColor release];

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[channel items] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"]
                autorelease];
        
    }
    RSSItem *item = [[channel items] objectAtIndex:[indexPath row]];
    [[cell textLabel] setText:[item title]];
    
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [[self navigationController] pushViewController:detailWebViewController animated:YES];
    
    RSSItem *entry = [[channel items] objectAtIndex:[indexPath row]];
    
    NSURL *url = [NSURL URLWithString:[entry link]];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    
    [[detailWebViewController detailWebView] loadRequest:req];
    [[detailWebViewController navigationItem] setTitle:[entry title]];
    
}

- (void)fetchEntries
{
    NSLog(@"fetchEntries");
    [xmlData release];
    xmlData = [[NSMutableData alloc]init];
    
    NSURL *fengNiaoUrl = [NSURL URLWithString:@"http://feed.feedsky.com/fengniao_nikon"];
    //NSURL *xitekUrl = [NSURL URLWithString:@"http://forum.xitek.com/forum-rss-fid-3-auth-0.html"];
    //NSURL *cnbeta = [NSURL URLWithString:@"http://cnbeta.feedsportal.com/c/34306/f/624776/index.rss"];
    NSURLRequest *req = [NSURLRequest requestWithURL:fengNiaoUrl];
    connection = [[NSURLConnection alloc]initWithRequest:req delegate:self startImmediately:YES];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [xmlData appendData:data];
}
- (void)connectionDidFinishLoading:(NSURLConnection *)conn
{
    //NSString *xmlCheck = [[[NSString alloc] initWithData:xmlData encoding:NSUTF8StringEncoding] autorelease];
    //NSLog(@"xmlCheck = %@", xmlCheck );
    
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:xmlData];
    [parser setDelegate:self];
    
    [parser parse];
    
    [parser release];
    
    [xmlData release];
    connection = nil;
    [[self tableView] reloadData];
    NSLog(@"%@\n %@\n %@\n", channel, [channel title], [channel shortDescription]);
    
    
    
    
}

- (void)connection:(NSURLConnection *)conn didFailWithError:(NSError *)error
{
    [connection release];
    connection = nil;
    
    [xmlData release];
    xmlData = nil;
    
    NSString *errorString = [NSString stringWithFormat:@"Fetch failed:%@", [error localizedDescription]];
    
    UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Error"
                                                 message:errorString
                                                delegate:nil
                                       cancelButtonTitle:@"OK"
                                       otherButtonTitles:nil];
    [av show];
    [av autorelease];
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    NSLog(@"%@ found a %@ element", self, elementName);
    if ([elementName isEqual:@"channel"]) {
        [channel release];
        channel = [[RSSChannel alloc] init];
        
        [channel setParentParserDelegate:self];
        [parser setDelegate:channel];
    }
}
@end
