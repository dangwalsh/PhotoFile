//
//  AlbumPhotoCell.h
//  PhotoFile
//
//  Created by Daniel Walsh on 5/25/13.
//  Copyright (c) 2013 Daniel Walsh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@class AlbumPhoto;

@interface AlbumPhotoCell : UICollectionViewCell

@property (nonatomic, strong) IBOutlet UIImageView *imageView;
@property (nonatomic, strong) IBOutlet UIImageView *checkView;
@property (nonatomic, strong) AlbumPhoto *photo;

@end
