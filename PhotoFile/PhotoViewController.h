//
//  PhotoViewController.h
//  PhotoFile
//
//  Created by Daniel Walsh on 5/25/13.
//  Copyright (c) 2013 Daniel Walsh. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PanViewDelegate;

@interface PhotoViewController : UIViewController

-(IBAction)handlePan:(UIPanGestureRecognizer*)recognizer;

@property (weak,atomic) id<PanViewDelegate> delegate;

@end

@protocol PanViewDelegate <NSObject>

@required
- (void)beginPan:(UIPanGestureRecognizer *)recognizer;
- (void)finishPan:(UIPanGestureRecognizer *)recognizer;

@end
