//
//  BaseTableCell.h
//  BaseClass
//
//  Created by my y on 2018/10/23.
//  Copyright © 2018年 myy.company.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BaseTableModel;

NS_ASSUME_NONNULL_BEGIN

@interface BaseTableCell : UITableViewCell

@property (nonatomic, strong) BaseTableModel *model;

@property (nonatomic, strong) UIView *bgView;

- (void)setWithModel:(BaseTableModel *)model;

- (CGFloat)getHeight;

@end

NS_ASSUME_NONNULL_END
