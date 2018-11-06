//
//  BaseCollection.m
//  BaseClass
//
//  Created by my y on 2018/10/30.
//  Copyright © 2018年 myy.company.com. All rights reserved.
//

#import "BaseCollection.h"
#import "BaseCollectionCell.h"
#import "BaseCollectionReusableView.h"

@interface BaseCollection() <UICollectionViewDelegate, UICollectionViewDataSource>

@end

@implementation BaseCollection

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        layout.itemSize = CGSizeMake(200, 200);
        
        
        _collectionView = [[UICollectionView alloc] initWithFrame:self.bounds];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [self addSubview:_collectionView];
        return _collectionView;
    }
    
    return _collectionView;
}

- (void)setCellAry:(NSArray<NSString *> *)cellAry {
    NSString *itemStr = [self.cellAry objectAtIndex:0];
    NSString *headerStr = [self.cellAry objectAtIndex:1];
    NSString *fotterStr = [self.cellAry objectAtIndex:2];
    
    [self.collectionView registerNib:[UINib nibWithNibName:itemStr bundle:nil] forCellWithReuseIdentifier:itemStr];
    [self.collectionView registerNib:[UINib nibWithNibName:headerStr bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerStr];
    [self.collectionView registerNib:[UINib nibWithNibName:fotterStr bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:headerStr];
    
}

#pragma mark dataSource
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    BaseCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[self.cellAry objectAtIndex:0] forIndexPath:indexPath];
    [cell setWithModel:[self.dataAry objectAtIndex:indexPath.row]];
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.dataAry count];
}

//这个方法是返回 Header的大小 size
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(kScreenWidth, 100);
}

//这个也是最重要的方法 获取Header的 方法。
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    
    BaseCollectionReusableView *headerCell = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:[self.cellAry objectAtIndex:1] forIndexPath:indexPath];
    return headerCell;
}



@end
