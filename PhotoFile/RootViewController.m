//
//  ViewController.m
//  PhotoFile
//
//  Created by Daniel Walsh on 5/25/13.
//  Copyright (c) 2013 Daniel Walsh. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController () {
    CGRect currentFrame;
    CGRect nextFrame;
    float min;
    float max;
    float displacement;
    float finalDisplacement;
}

@end

@implementation RootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    min = -self.view.bounds.size.width + 40;
    max = self.view.bounds.size.width - 40;
    currentFrame = self.view.bounds;
    nextFrame = self.view.bounds;
    
    if(self.storyboard) {
        self.leftViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"cvc_LeftViewController"];
        [self addChildViewController:self.leftViewController];
        self.leftViewController.view.frame = currentFrame;
        [self.view addSubview:self.leftViewController.view];
        self.rightViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"cvc_RightViewController"];
        [self addChildViewController:self.rightViewController];
        self.rightViewController.view.frame = currentFrame;
        [self.view addSubview:self.rightViewController.view];
        self.topViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"cvc_TopViewController"];
        [self addChildViewController:self.topViewController];
        self.topViewController.view.frame = currentFrame;
        [self.view addSubview:self.topViewController.view];
        [self.topViewController setDelegate:self];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)moveController:(UIViewController *)controller
{
    [UIView animateWithDuration:0.3
                     animations:^{controller.view.frame = nextFrame;}
     ];
}

- (void)beginPan:(UIPanGestureRecognizer *)recognizer
{
    CGPoint translation = [recognizer translationInView:self.view];
    
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        if (translation.x > 0) {
            if (currentFrame.origin.x == 0) {
                self.rightViewController.view.hidden = NO;
            }
            finalDisplacement = max;
        } else {
            if (currentFrame.origin.x == 0) {
                self.rightViewController.view.hidden = YES;
            }
            finalDisplacement = min;
        }
    }
    
    if (currentFrame.origin.x <= max && currentFrame.origin.x >= min ) {
        displacement += translation.x;
        self.topViewController.view.center = CGPointMake(self.topViewController.view.center.x + translation.x, self.topViewController.view.center.y);
        [recognizer setTranslation:CGPointMake(0, 0) inView:self.topViewController.view];
    }
}

- (void)finishPan:(UIPanGestureRecognizer *)recognizer
{
    if(fabs(displacement) > (self.view.bounds.size.width - 40) / 2)
        nextFrame.origin.x = currentFrame.origin.x + finalDisplacement;
    
    if (nextFrame.origin.x <= max && nextFrame.origin.x >= min ) {
        [self moveController:self.topViewController];
        currentFrame = nextFrame;
    }
    
    displacement = 0.0f;
}

@end
