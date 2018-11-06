//
//  BaseTableDecorator.h
//  BaseClass
//
//  Created by my y on 2018/10/22.
//  Copyright © 2018年 myy.company.com. All rights reserved.
//

#import "BaseTableController.h"

@class BaseTableController;

NS_ASSUME_NONNULL_BEGIN

@interface BaseTableDecorator : BaseTableController

@property (nonatomic, strong) BaseTableController *tableController;

/**
 设置TableView的样式
 */
- (void)setTableStyle;

@end

NS_ASSUME_NONNULL_END
