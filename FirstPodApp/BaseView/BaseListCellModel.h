//
//  ListModel.h
//  BaseClass
//
//  Created by my y on 2018/10/24.
//  Copyright © 2018年 myy.company.com. All rights reserved.
//

#import "BaseTableModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseListCellModel : BaseTableModel

- (id)initWithAry:(NSMutableArray <BaseTableModel *>*)ary;

@property (nonatomic, strong) NSMutableArray <BaseTableModel *>*ary;

@end

NS_ASSUME_NONNULL_END
