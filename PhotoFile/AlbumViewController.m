//
//  AlbumViewController.m
//  PhotoFile
//
//  Created by Daniel Walsh on 5/25/13.
//  Copyright (c) 2013 Daniel Walsh. All rights reserved.
//

#import "AlbumViewController.h"
#import "AlbumPhoto.h"
#import "AlbumPhotoCell.h"
#import <AssetsLibrary/AssetsLibrary.h>

@interface AlbumViewController () {
    NSMutableArray *assets;
    ALAssetsLibrary *library;
}

@end

@implementation AlbumViewController

- (void)configureView
{
    assets = [[NSMutableArray alloc]init];
    library = [[ALAssetsLibrary alloc]init];
    
    void (^assetEnumerator)(ALAsset *, NSUInteger, BOOL *) = ^(ALAsset *result, NSUInteger index, BOOL *stop) {
        if(result) {
            AlbumPhoto *aPhoto = [[AlbumPhoto alloc]init];
            aPhoto.thumbnail = [UIImage imageWithCGImage:[result thumbnail]];
            aPhoto.largeImage = [UIImage imageWithCGImage:[[result defaultRepresentation] fullScreenImage]];
            [assets addObject:aPhoto];
        } else {
            [self.collectionView reloadData];
        }
    };
    
    void (^assetGroupEnumerator)(ALAssetsGroup *, BOOL *) =  ^(ALAssetsGroup *group, BOOL *stop) {
        if([group valueForProperty:ALAssetsGroupPropertyName] == [self.albumItem valueForProperty:ALAssetsGroupPropertyName]) {
            [group enumerateAssetsUsingBlock:assetEnumerator];
        }
    };
    
    [library enumerateGroupsWithTypes:ALAssetsGroupAll
                           usingBlock:assetGroupEnumerator
                         failureBlock: ^(NSError *error) { NSLog(@"Failure"); }
     ];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.collectionView.allowsMultipleSelection = YES;
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionView Datasource

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section
{
    return [assets count];
}

- (NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView
{
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    AlbumPhotoCell *cell = [cv dequeueReusableCellWithReuseIdentifier:@"PhotoCell" forIndexPath:indexPath];
    cell.photo = [assets objectAtIndex:indexPath.item];
    if (cell.selected) {
        cell.checkView.hidden = NO;
    }
    else
    {
        cell.checkView.hidden = YES;
    }
    return cell;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    AlbumPhotoCell *cell = (AlbumPhotoCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
    cell.checkView.hidden = NO;
    AlbumPhoto *photo = cell.photo;
    [self.selection addObject:photo];
}
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    AlbumPhotoCell *cell = (AlbumPhotoCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
    cell.checkView.hidden = YES;
    AlbumPhoto *photo = cell.photo;
    [self.selection removeObject:photo];
}

#pragma mark – UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize size = CGSizeMake((self.view.bounds.size.width - 25) / 4, (self.view.bounds.size.width - 25) / 4);
    return size;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 5, 5, 5);
}

@end
