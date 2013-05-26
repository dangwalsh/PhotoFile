//
//  AlbumViewController.h
//  PhotoFile
//
//  Created by Daniel Walsh on 5/25/13.
//  Copyright (c) 2013 Daniel Walsh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlbumViewController : UICollectionViewController <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout> 

@property (assign, nonatomic) id albumItem;
@property (nonatomic, weak) IBOutlet UICollectionView *collectionView;
@property (nonatomic,strong) NSMutableArray *selection;

@end
