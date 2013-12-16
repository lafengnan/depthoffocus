//
//  PhotoAdviceViewController.m
//  DepthOfFocus
//
//  Created by lafengnan on 12-8-20.
//  Copyright (c) 2012年 lafengnan. All rights reserved.
//

#import "PhotoAdviceViewController.h"
#import "PhotoAdvice.h"


@implementation PhotoAdviceViewController
- (id)init
{

    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self) {
        // Get tabBar item
        UITabBarItem *tbi = [self tabBarItem];
        [tbi setTitle:@"Advice"];
        UIImage *tabIcon = [UIImage imageNamed:@"Icon.png"];
        [tbi setImage:tabIcon];
        
        //UINavigationBar setting
        [[self navigationItem] setTitle:@"摄影法则"];
        //advices = [[PhotoAdvice alloc] init];
        advices = [PhotoAdvice adviceStore];
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
    UIColor *backGroundColor = [[UIColor alloc]initWithRed:0.58 green:0.87 blue:1.0 alpha:1.0];
    NSLog(@"Loaded the view for PhotoAdviceViewController");
    
    [[self view] setBackgroundColor:backGroundColor];
    [backGroundColor release];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger counter = [[advices allAdvices] count];
   
    return counter;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell =
    [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"] autorelease];
    PhotoAdvice *advice = [[advices allAdvices] objectAtIndex:[indexPath row]];
    [[cell textLabel] setText:[advice description]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"tableview: didSelectRowAtIndexPath");
    PhotoAdviceDetailViewController *detailViewController =
    [[[PhotoAdviceDetailViewController alloc] init] autorelease];
    //remember the row number for detail array index
    [advices resetAdviceFlags];
    [advices setAdviceFlag:true AtIndex:[indexPath row]];
    [detailViewController setAdviceDetails:[[advices allAdviceDetails] objectAtIndex:[indexPath row]]];
    // push detailViewController into stack top
    [[self navigationController] pushViewController:detailViewController animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
@end
