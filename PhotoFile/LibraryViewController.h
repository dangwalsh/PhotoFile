//
//  LibraryViewController.h
//  PhotoFile
//
//  Created by Daniel Walsh on 5/25/13.
//  Copyright (c) 2013 Daniel Walsh. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AlbumViewController;

@interface LibraryViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) AlbumViewController *albumViewController;

@end
