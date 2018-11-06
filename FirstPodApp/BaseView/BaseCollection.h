//
//  BaseCollection.h
//  BaseClass
//
//  Created by my y on 2018/10/30.
//  Copyright © 2018年 myy.company.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BaseTableModel;
NS_ASSUME_NONNULL_BEGIN

@interface BaseCollection : UIView

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray<BaseTableModel *> *dataAry;

/**
 index = 0 是item的xib的名字
 index = 1 是header的xib的名字
 index = 2 是fotter的xib的名字
 */
@property (nonatomic, copy) NSArray<NSString *> *cellAry;
@property (nonatomic, strong) NSMutableDictionary<NSNumber *, NSNumber *> *cellHeightDic;
@property (nonatomic, assign) int pageFlag;

@end

NS_ASSUME_NONNULL_END
