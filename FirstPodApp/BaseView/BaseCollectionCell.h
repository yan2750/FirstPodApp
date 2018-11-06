//
//  BaseCollectionCell.h
//  BaseClass
//
//  Created by my y on 2018/10/30.
//  Copyright © 2018年 myy.company.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BaseTableModel;

NS_ASSUME_NONNULL_BEGIN

@interface BaseCollectionCell : UICollectionViewCell

- (void)setWithModel:(BaseTableModel *)model;

@end

NS_ASSUME_NONNULL_END
