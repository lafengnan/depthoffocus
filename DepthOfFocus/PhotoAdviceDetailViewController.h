//
//  PhotoAdviceDetailViewController.h
//  DepthOfFocus
//
//  Created by lafengnan on 12-8-27.
//  Copyright (c) 2012年 lafengnan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoAdviceDetailViewController : UIViewController 
{
    IBOutlet UILabel *advicePoem;
    IBOutlet UILabel *adviceDetails;
}

@property (nonatomic, retain)UILabel *advicePoem;

@property (nonatomic, retain) UILabel *adviceDetails;

@end
