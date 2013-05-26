//
//  PhotoViewController.m
//  PhotoFile
//
//  Created by Daniel Walsh on 5/25/13.
//  Copyright (c) 2013 Daniel Walsh. All rights reserved.
//

#import "PhotoViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface PhotoViewController ()

@end

@implementation PhotoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.view.layer.shadowOpacity = 0.8f;
    self.view.layer.cornerRadius = 4.0f;
    self.view.layer.shadowOffset = CGSizeZero;
    self.view.layer.shadowPath = [UIBezierPath bezierPathWithRect:self.view.bounds].CGPath;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)handlePan:(UIPanGestureRecognizer*)recognizer
{
    //if(self.isPannable)
    
    if (recognizer.state == UIGestureRecognizerStateEnded) {
        [self.delegate finishPan:recognizer];
    } else {
        [self.delegate beginPan:recognizer];
    }
}

/*
- (void)togglePan:(BOOL)pan
{
    self.isPannable = pan;
}
*/

@end
