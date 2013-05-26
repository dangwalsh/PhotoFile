//
//  AlbumPhotoCell.m
//  PhotoFile
//
//  Created by Daniel Walsh on 5/25/13.
//  Copyright (c) 2013 Daniel Walsh. All rights reserved.
//

#import "AlbumPhotoCell.h"
#import "AlbumPhoto.h"

@implementation AlbumPhotoCell

-(void) setPhoto:(AlbumPhoto *)photo
{
    if(_photo != photo) {
        _photo = photo;
    }
    self.imageView.image = _photo.thumbnail;
    self.checkView.hidden = YES;
}

@end
