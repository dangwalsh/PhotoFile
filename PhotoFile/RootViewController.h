//
//  ViewController.h
//  PhotoFile
//
//  Created by Daniel Walsh on 5/25/13.
//  Copyright (c) 2013 Daniel Walsh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoViewController.h"

@interface RootViewController : UIViewController <PanViewDelegate>

@property (nonatomic, strong, readwrite) UIViewController *leftViewController;
@property (nonatomic, strong, readwrite) UIViewController *rightViewController;
@property (nonatomic, strong, readwrite) PhotoViewController *topViewController;

@end
