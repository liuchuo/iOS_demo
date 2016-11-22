//
//  ViewController.m
//  demo7_CollectionView
//
//  Created by ChenXin on 16/10/19.
//  Copyright © 2016年 ChenXin. All rights reserved.
//

#import "ViewController.h"
#import "ImageCell.h"
#import "CityDetailViewController.h"

@interface ViewController ()

@end

@implementation ViewController


#pragma mark -- Collection View Data Source --
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 8;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
   ImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ImageCell" forIndexPath:indexPath];
    cell.imageView.image = [self imageOfCityWithId: indexPath.item];
    return cell;
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    return [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"citiesHeader" forIndexPath:indexPath];
}

#pragma mark -- Delegate --
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"showCity" sender:collectionView];
}

#pragma mark -- Navigation --
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if( [segue.identifier isEqualToString:@"showCity"] ) {
        // current item => destination viewcontroller
        UICollectionView *cv = (UICollectionView*)sender;
        [cv indexPathsForSelectedItems];
    }
}

#pragma mark -- View Controller Lifecycle --

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
